<?php
$className = $_GET['c'];
include '../controller/wechat/' . $className . '.php';
$method = $_GET['m'];
$page = new $className();
$page->$method();