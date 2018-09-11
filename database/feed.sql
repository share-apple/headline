-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-09-11 07:55:16
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
-- 表的结构 `feed`
--

DROP TABLE IF EXISTS `feed`;
CREATE TABLE IF NOT EXISTS `feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_avater` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `pubtime` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `images` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `feed`
--

INSERT INTO `feed` (`id`, `user_name`, `user_avater`, `content`, `pubtime`, `address`, `images`) VALUES
(1, '马爸爸', 'https://wx2.sinaimg.cn/orj360/006zQ9Lpgy1furpvcmg56j308c08c751.jpg', '后悔创阿里', '11分钟前', '阿里总部', 'https://wx2.sinaimg.cn/orj360/cd0f352agy1fujw2w3hdij20j60j6ta0.jpg;https://wx1.sinaimg.cn/orj360/cd0f352agy1fujw2tv52qj20j60j640i.jpg;https://wx3.sinaimg.cn/orj360/cd0f352agy1fujw2rivjij20j60j640b.jpg'),
(2, '马爸爸', 'https://wx2.sinaimg.cn/orj360/61e89b74ly1fv4nimdaarj20go0bydg5.jpg', '我要去当老师啦,哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '6分钟前', '阿里总部', 'https://wx2.sinaimg.cn/orj360/cd0f352agy1fujw2w3hdij20j60j6ta0.jpg;https://wx1.sinaimg.cn/orj360/cd0f352agy1fujw2tv52qj20j60j640i.jpg;https://wx3.sinaimg.cn/orj360/cd0f352agy1fujw2rivjij20j60j640b.jpg;https://wx4.sinaimg.cn/orj360/006BuBTIly1fv5muw0rlig306o06o10o.gif;https://wx2.sinaimg.cn/orj360/00685TFIly1fqp6p4s842j30hs0hsdgs.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
