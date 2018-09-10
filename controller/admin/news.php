<?php
include '../core/db.php';

class news extends db
{
    const PER_PAGE = 10;
    public function index()
    {
        if (isset($_GET['cid'])){
            $cid=$_GET['cid'];
        }else{
            $cid=1;
        }
        //接收页数
        if (isset($_GET['page'])) {
            $page = $_GET['page'];
        } else {
            $page = 1;
        }
        //page1 offect 0
        //page2 poffect 2
        //page3 poffect 4

//某个分类下的总条数
        $num = $this->pdo
            ->query('select count(*) as total from news where cid =' . $cid)
            ->fetch()['total'];
//总页数
        $page_total = ceil($num / $this::PER_PAGE);
//查询到新闻页 限制出现3条
//        $array = $this->pdo
//            ->query('select * from news limit 3')
//            ->fetchAll();
        $course = $this->pdo
            ->query(
                'select * from news where cid= ' . $cid . ' limit '.$this::PER_PAGE.' offset ' . ($page - 1) * $this::PER_PAGE
            )
            ->fetchAll();

        include '../view/admin/admin-news.html';

    }



    public function add()
    {
        $stmt = $this->pdo->prepare("insert into news (cid,mold,title,dsc,url,image,pubtime,content) values (?,?,?,?,?,?,?,?)");
        $stmt->bindValue(1, '1');
        $stmt->bindValue(2, '');
        $stmt->bindValue(3, '');
        $stmt->bindValue(4, '');
        $stmt->bindValue(5, '');
        $stmt->bindValue(6, '');
        $stmt->bindValue(7, '');
        $stmt->bindValue(8, '');
        echo $stmt->execute();
    }

    public function remove()
    {
        $course = $this->pdo->exec("delete from news where id=" . $_GET['id']);
        echo $course;
    }

    public function update()
    {
        $count = $this->pdo->prepare('update news set '.$_GET['k'].'= ? where id= ?');
        $count->bindValue(1, $_GET['v']);
        $count->bindValue(2, $_GET['id']);
        echo $count->execute();
    }

    public function search()
    {
        $num = null;//所以没有出现的变量要单独定义一下
        $results = [];
        if (isset($_GET['title'])){
            $title=$_GET['title'];

            $num =
                $this->pdo
                    ->query('select count(*) as num from news where title like "%' . $key . '%"')
                    ->fetch()['num'];

            $results = $this->pdo
                ->query('select * from news where title='.$title.' limit 10')
                ->fetchAll();
        }

        include '../view/admin/admin-news.html';//不光只回页面，要回经过PHP处理的东西
    }

}