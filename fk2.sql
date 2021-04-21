-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2021-04-21 16:31:00
-- 服务器版本： 5.6.44-log
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fk2`
--

-- --------------------------------------------------------

--
-- 表的结构 `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL COMMENT '卡密内容',
  `state` int(11) NOT NULL COMMENT '卡密状态 1：待售 0：已售',
  `shopid` int(11) NOT NULL COMMENT '所属商品',
  `updatetime` int(10) NOT NULL COMMENT '上传时间',
  `selltime` int(10) NOT NULL COMMENT '卖出时间',
  `orderid` int(11) NOT NULL COMMENT '订单id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `shopid` int(11) NOT NULL COMMENT '商品id',
  `shopname` varchar(256) NOT NULL COMMENT '商品名',
  `cards` text NOT NULL COMMENT '卡密',
  `date` int(10) NOT NULL COMMENT '订单时间',
  `qq` varchar(256) NOT NULL COMMENT '联系方式',
  `paytype` varchar(256) NOT NULL COMMENT '支付方式',
  `num` int(11) NOT NULL COMMENT '数量',
  `money` double NOT NULL COMMENT '售价',
  `state` int(11) NOT NULL COMMENT '订单状态 -1过期 0待支付 1已支付 2已入群'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `setting`
--

CREATE TABLE `setting` (
  `vkey` varchar(64) NOT NULL COMMENT '配置名',
  `vvalue` text NOT NULL COMMENT '配置内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `setting`
--

INSERT INTO `setting` (`vkey`, `vvalue`) VALUES
('gg', 'QQ付费入群系统，开源系统'),
('vmq', ''),
('name', 'QQ付费入群系统'),
('user', 'admin'),
('pass', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `shop`
--

CREATE TABLE `shop` (
  `id` int(11) NOT NULL,
  `typeid` int(11) NOT NULL COMMENT '分类id',
  `typename` varchar(256) NOT NULL COMMENT '分类名',
  `shopname` varchar(256) NOT NULL COMMENT '商品名',
  `shoptext` text NOT NULL COMMENT '商品描述',
  `xiaoliang` int(11) NOT NULL COMMENT '销量',
  `kucun` int(11) NOT NULL COMMENT '库存',
  `money` double NOT NULL COMMENT '单价',
  `state` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop`
--

INSERT INTO `shop` (`id`, `typeid`, `typename`, `shopname`, `shoptext`, `xiaoliang`, `kucun`, `money`, `state`) VALUES
(1, 1, '付费入群授权', '付费入群授权', '<p><span>请填写需要加群的</span><span><b>本人</b></span><span>QQ号</span><span><b>（非群号）</b></span></p>', 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `shoptype`
--

CREATE TABLE `shoptype` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL COMMENT '分类名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shoptype`
--

INSERT INTO `shoptype` (`id`, `name`) VALUES
(1, '付费入群授权');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`vkey`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shoptype`
--
ALTER TABLE `shoptype`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `shoptype`
--
ALTER TABLE `shoptype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
