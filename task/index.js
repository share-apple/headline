
const request = require ('request');//发送请求
const cheerio = require ('cheerio');//编程语言
const async = require('async');//多次请求，请求一次完成后再请求下一次
const iconv = require('iconv-lite');//编码方式
const mysql = require('mysql');//连接数据库
const filter = require('bloom-filter-x');//哈希函数
const fs = require('fs');//连接数据库
//请求地址
//找到东西
//放到数据库
    let connection = mysql.createConnection({
        host:'localhost',
        user:'root',
        password:'',
        database:'db'
    })
    let urls = [];
    let obj = [];
//查，去重
    let select_mysql = 'select * from news';
    connection.query(select_mysql,(err,results,fields)=>{
        if(err) throw err;
        results.forEach((v)=>{
                let url = v.url;
                if(filter.add(url)){
                    urls.push(url);
                }
            })
        });
function fetch_news(){
    request({
        url:'http://news.zol.com.cn/',
        encoding:null
    },(err,res,body)=>{
        body = iconv.decode(body,'gb2312');
        let $ = cheerio.load(body);
        $('.content-list li').each((k,v)=>{
            let t = $(v).find('.info-head a');
            let title  = t.text();
            let dsc =  $(v).find('p').contents().eq(0).text();
            let url =t.attr('href');
            let image =$(v).find('img').attr('.src');
            let r=Math.random();
            let mold;
            if(r<0.32){
                mold='1';
            }else if(r<0.55){
                mold='2';
            }
            else if(r<0.85){
                mold='3';
            }
            else if(r<0.99){
                mold='4';
            }
            if(filter.add(url)){
                urls.push(url);//加入哈希函数的数组
                obj.push({
                    'title':title,
                    'dsc':dsc,
                    'url':url,
                    'image':image,
                    'mold':mold
                });
            }
        });
        console.log(obj);
        if(!urls.length){
            let d = new Date();
            console.log(d.toUTCString() + '抓取了一次，本次没有更新..')
        }else {
            let d = new Date();
            console.log(d.toUTCString() + '抓取了一次，本次更新了'+ urls.length +'条');
            async.eachLimit(obj,1,function (v,next) {
                request({
                    url:v.url,
                    encoding:null
                },(err,res,body)=>{
                    if(err){
                        console.log(err.message);
                    }else{
                        body = iconv.decode(body,'gb2312');
                        let $ = cheerio.load(body);
                        let pubtime = $('#pubtime_baidu').attr('content');
                        let content = $('#article-content').html();
                        let title = v.title;
                        let dsc = v.dsc;
                        let url = v.url;
                        let image = v.image;
                        let mold=v.mold;
                        let cid=1;

                        let insert_mysql = 'insert into news (cid,mold,title,dsc,image,url,pubtime,content) values (?,?,?,?,?,?,?,?)';
                        connection.query(insert_mysql,[cid,mold,title,dsc,image,url,pubtime,content],(err,results,fields)=>{
                            if (err) throw  err;
                            console.log('OK');
                        })
                    }
                    next(null);
                })
            })
        }
    });
}
fetch_news();

setInterval(fetch_news,400000);