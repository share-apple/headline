<?php
include '../core/db.php';


//今日头条的首页
class page extends db

{    //页面资源
    //首页 /index.php?c=page&m=index
    public function index()
    {
        if (isset($_GET['cid'])){
            $cid=$_GET['cid'];
        }else{
            $cid=1;
        }

        $array = $this->pdo
            ->query('select * from adds where is_default = "1" ')
            ->fetchAll();
        $course = $this->pdo
            ->query('select * from news where cid='.$cid.' limit 5')
            ->fetchAll();
        include '../view/index/index.html';
    }

    public function add()
    {   //页面资源
        // 查两次
        // 查默认的
        // 查其他的
        $yes = $this->pdo
            ->query("select * from adds where is_default = '1' ")
            ->fetchAll();
        $no = $this->pdo
            ->query("select * from adds where is_default = '0' ")
            ->fetchAll();

        $adds = $this->pdo
            ->query('select * from adds')
            ->fetchAll();
        include '../view/index/add.html';
    }
    public function move(){

        $is_default=$_GET['is_default'];
        $id=$_GET['id'];
        $stmt = $this->pdo->prepare("update adds set is_default=? where id=?");
        $stmt->bindValue(1, $is_default);
        $stmt->bindValue(2, $id);

        $rows=$stmt->execute();
        echo $rows;

    }


    const PER_PAGE = 5;
    public function search()
    {
        //经过PHP处理 ,只能用方法里面的变量，
        //页面资源
        $total_number = null;//所以没有出现的变量要单独定义一下
        $results = [];
        if (isset($_GET['s'])) {
            $key = $_GET['s'];
        $total_number =
                    $this->pdo
                    ->query('select count(*) as total_number from news where title like "%' . $key . '%"')
                    ->fetch()['total_number'];

            $sql = 'select * from news where title like "%' . $key . '%" limit ' . $this::PER_PAGE . ' offset 0';
            $results = $this->pdo->query($sql)->fetchAll();

        }
        include '../view/index/search.html';//不光只回页面，要回经过PHP处理的东西
    }
    // ajax
    //搜索页面的数据资源，要经过js处理否则将不能运行
    public function searchList(){

        if (isset($_GET['page']) && isset($_GET['s'])) {
            $page = $_GET['page'];
            $key = $_GET['s'];
            $sql = 'select * from news where title like "%' . $key . '%" limit ' . $this::PER_PAGE . ' offset '.($page-1)*$this::PER_PAGE;
            $r = $this->pdo->query($sql)->fetchAll();
            echo json_encode($r);
        } else {
            echo json_encode('参数错误');
        }

    }
}
