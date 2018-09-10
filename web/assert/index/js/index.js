
//点击信封出现半透明黑背景
let left=document.querySelector('.abs_l');
console.log(left);
let close=document.querySelector('.close');
let box=document.querySelector('.bigbox');
left.onclick=function () {
    box.classList.add('active')
};
close.onclick=function () {
    box.classList.remove('active')
};


//刷新下拉推荐条 并转一圈
let Btn=document.querySelector('.refreshBtn-container');
let recommend=document.querySelector('.recommend');
console.log(Btn);
Btn.onclick=function () {
    recommend.classList.add('appear');
    // recommend.transform=rotate(360deg);
};

//点击新闻要点字变红
let red=document.querySelectorAll('.color');
console.log(red);
red.onclick=function () {
    // red.classList.remove('red');
    red.classList.add('red')
};