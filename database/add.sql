-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-09-05 01:11:18
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- 表的结构 `adds`
--

DROP TABLE IF EXISTS `adds`;
CREATE TABLE IF NOT EXISTS `adds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_default` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `adds`
--

INSERT INTO `adds` (`id`, `name`, `is_default`) VALUES
(1, '推荐', '1'),
(2, '视频', '1'),
(3, '热点', '1'),
(4, '社会', '1'),
(5, '娱乐', '1'),
(6, '科技', '1'),
(7, '体育', '1'),
(8, '汽车', '1'),
(9, '游戏', '1'),
(10, '时尚', '1'),
(11, '国际', '1'),
(12, '军事', '1'),
(13, '旅游', '0'),
(14, '历史', '0'),
(15, '探索', '0'),
(16, '美食', '0'),
(17, '育儿', '0'),
(18, '养生', '0'),
(19, '故事', '0'),
(20, '美文', '0');
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
