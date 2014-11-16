-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- 主機: localhost
-- 建立日期: Nov 16, 2014, 10:31 AM
-- 伺服器版本: 5.0.51
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 資料庫: `greetingcard`
-- 

-- --------------------------------------------------------

-- 
-- 資料表格式： `card`
-- 

CREATE TABLE `card` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `bgurl` text,
  `bgcolor` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

-- 
-- 列出以下資料庫的數據： `card`
-- 

INSERT INTO `card` VALUES (13, 'Cat', 'http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg', '#DDD', '100002161315577');
INSERT INTO `card` VALUES (12, 'cat_FUcKKKKK', 'http://images.wisegeek.com/young-calico-cat.jpg', '#DDD', '100002149855807');
INSERT INTO `card` VALUES (11, '貓', 'http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg', '#DDD', '100002149855807');
INSERT INTO `card` VALUES (10, 'Cardddd', 'http://images.wisegeek.com/young-calico-cat.jpg', 'rgb(239, 239, 239)', '100002149855807');
INSERT INTO `card` VALUES (9, '我是一張賀卡', 'efewfewfewewf', '#55555', '100002149855807');
INSERT INTO `card` VALUES (14, 'ergerg', 'http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg', '#DDD', '100002161315577');
INSERT INTO `card` VALUES (15, 'eeee', 'http://images.wisegeek.com/young-calico-cat.jpg', 'rgb(239, 239, 239)', '100002161315577');
INSERT INTO `card` VALUES (16, '我是一張賀卡', '"http://localhost/greeting/img/hallowen.png"', 'rgb(0, 0, 0)', '100000196684195');
INSERT INTO `card` VALUES (17, '萬聖節', '"http://210.70.167.98/greeting/img/hallowen.png"', 'rgb(0, 0, 0)', '100000196684195');
INSERT INTO `card` VALUES (18, 'sol', 'img/hallowen.png', '#000', '100001950005002');
INSERT INTO `card` VALUES (19, 'Greeting', 'img/christmas.png', '#FF9966', '100000196684195');
INSERT INTO `card` VALUES (20, 'BLanK', 'http://210.70.167.98/greeting/index.php', 'rgb(238, 221, 238)', '100002161315577');
INSERT INTO `card` VALUES (21, 'SRTsai', 'http://210.70.167.98/greeting/img/hallowen.png', 'rgb(0, 0, 0)', '100000872926145');
INSERT INTO `card` VALUES (22, '我是一張賀卡', 'http://210.70.167.98/greeting/index.php', 'pink', '100000042069695');
INSERT INTO `card` VALUES (23, '我是一張賀卡', 'http://210.70.167.98/greeting/index.php', 'black', '100000042069695');
INSERT INTO `card` VALUES (24, '我是一張賀卡SRTasi', 'img/christmas.png', '#FF9966', '100000872926145');
INSERT INTO `card` VALUES (25, 'BIRD', 'http://astromatrix.org/Content/images/Objects/Bird.jpg', 'rgb(255, 255, 255)', '100002149855807');
INSERT INTO `card` VALUES (26, 'BIRD', 'http://astromatrix.org/Content/images/Objects/Bird.jpg', '#000', '100002149855807');
INSERT INTO `card` VALUES (27, 'NEW', 'http://www.f-covers.com/cover/colorful-hearts-facebook-cover-timeline-banner-for-fb.jpg', 'rgb(255, 153, 102)', '100000196684195');

-- --------------------------------------------------------

-- 
-- 資料表格式： `card_setting`
-- 

CREATE TABLE `card_setting` (
  `id` int(11) NOT NULL,
  `left` varchar(50) NOT NULL,
  `top` varchar(50) NOT NULL,
  `text` text,
  `color` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 列出以下資料庫的數據： `card_setting`
-- 

INSERT INTO `card_setting` VALUES (10, '107.5px', '70px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (9, '182.5px', '92px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (9, '106.5px', '155px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (10, '84.5px', '241px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (10, '388.5px', '97px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (11, '51.5px', '75px', '我終於做完了!!', 'rgb(0, 0, 0)', '40px', '276', '59');
INSERT INTO `card_setting` VALUES (11, '68.5px', '306px', '賀卡!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!', 'rgb(0, 0, 0)', '25px', '363', '33');
INSERT INTO `card_setting` VALUES (12, '369.5px', '12px', 'FUCKKKKKKKK!!!!!!!!!!!!!!!!!!!', 'rgb(0, 0, 0)', '25px', '206', '62');
INSERT INTO `card_setting` VALUES (12, '15.5px', '85px', '貓咪第二!!!!!!!!!', 'rgb(0, 0, 0)', '85px', '206', '406');
INSERT INTO `card_setting` VALUES (13, '79.5px', '40px', 'Hello World!', 'rgb(0, 0, 0)', '40px', '244', '57');
INSERT INTO `card_setting` VALUES (13, '77.5px', '96px', 'ergergregergergegrergergergergergerg', 'rgb(17, 34, 51)', '25px', '206', '152');
INSERT INTO `card_setting` VALUES (14, '229.5px', '34px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (14, '257.5px', '78px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (14, '293.5px', '118px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (15, '229.5px', '34px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (15, '100.5px', '114px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (15, '293.5px', '118px', '雙擊我編輯文字！', 'rgb(255, 255, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (16, '184.5px', '23px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (16, '321.5px', '90px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (18, '326.5px', '95px', 'YAMA.SOL', 'rgb(0, 0, 0)', '25px', '171', '44');
INSERT INTO `card_setting` VALUES (19, '388.5px', '15px', 'I use Greeting Card', 'rgb(255, 255, 255)', '25px', '263', '57');
INSERT INTO `card_setting` VALUES (19, '287.5px', '278px', 'Design By Zap', 'rgb(255, 255, 255)', '50px', '413', '62');
INSERT INTO `card_setting` VALUES (19, '23.5px', '8px', '文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字', 'rgb(255, 255, 255)', '30px', '218', '195');
INSERT INTO `card_setting` VALUES (20, '12.5px', '29px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (20, '10.5px', '93px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (20, '4.5px', '161px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (20, '9.5px', '229px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (20, '236.5px', '30px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (20, '239.5px', '96px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (20, '2.5px', '304px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '37');
INSERT INTO `card_setting` VALUES (20, '238.5px', '232px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (20, '235.5px', '312px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (20, '453.5px', '32px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '36');
INSERT INTO `card_setting` VALUES (20, '222.5px', '184px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (21, '56.5px', '28px', 'Happy Birthday', 'rgb(0, 0, 255)', '40px', '206', '98');
INSERT INTO `card_setting` VALUES (21, '167.5px', '268px', 'SRTsai', 'rgb(255, 255, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (22, '113.5px', '74px', 'AAAAA', 'rgb(0, 0, 255)', '50px', '206', '61');
INSERT INTO `card_setting` VALUES (23, '89.5px', '52px', 'HAPPY', 'rgb(255, 255, 255)', '50px', '206', '61');
INSERT INTO `card_setting` VALUES (24, '46.5px', '61px', 'fgfgfsdfha', 'rgb(0, 0, 200)', '34px', '206', '42');
INSERT INTO `card_setting` VALUES (24, '283.5px', '272px', 'SRTasi', 'rgb(0, 0, 0)', '25px', '206', '62');
INSERT INTO `card_setting` VALUES (25, '143.5px', '6px', 'Hello , world !!!', 'rgb(255, 255, 255)', '40px', '280', '42');
INSERT INTO `card_setting` VALUES (25, '134.5px', '125px', 'HEY', 'rgb(102, 102, 102)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (25, '163.5px', '148px', '雙擊我編輯文字！', 'rgb(0, 0, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (25, '54.5px', '298px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (25, '169.5px', '204px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '26');
INSERT INTO `card_setting` VALUES (25, '338.5px', '64px', '雙擊我編輯文字！', 'rgb(204, 221, 238)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (25, '349.5px', '272px', '雙擊我編輯文字！', 'rgb(255, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (26, '82.5px', '15px', 'Hello , world !!!', 'rgb(255, 255, 255)', '40px', '280', '42');
INSERT INTO `card_setting` VALUES (26, '101.5px', '70px', 'eefwef', 'rgb(255, 255, 255)', '25px', '206', '26');
INSERT INTO `card_setting` VALUES (26, '163.5px', '148px', '雙擊我編輯文字！', 'rgb(0, 0, 255)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (26, '54.5px', '298px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (26, '169.5px', '204px', '雙擊我編輯文字！', 'rgb(0, 0, 0)', '25px', '206', '26');
INSERT INTO `card_setting` VALUES (26, '360.5px', '61px', 'nkkflewlrfreerregreg', 'rgb(204, 221, 238)', '25px', '219', '40');
INSERT INTO `card_setting` VALUES (26, '349.5px', '272px', '雙擊我編輯文字！', 'rgb(255, 0, 0)', '25px', '206', '32');
INSERT INTO `card_setting` VALUES (27, '11.5px', '35px', 'ewfefwefwefweewfwefwefwefwwefwefwfwefwef++fewf3we3fwefwe', 'rgb(255, 255, 255)', '25px', '206', '114');
INSERT INTO `card_setting` VALUES (27, '234.5px', '37px', 'Titlewefwefwefwefwefwef', 'rgb(255, 255, 255)', '50px', '206', '234');
INSERT INTO `card_setting` VALUES (27, '10.5px', '185px', 'ewfefwefwefweewfwefwefwefwwefwefwfwefwef++fewf3we3fwefwe', 'rgb(255, 255, 255)', '25px', '206', '114');

-- --------------------------------------------------------

-- 
-- 資料表格式： `card_share`
-- 

CREATE TABLE `card_share` (
  `id` int(11) NOT NULL,
  `fbid` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 列出以下資料庫的數據： `card_share`
-- 

INSERT INTO `card_share` VALUES (13, '100000196684195');
INSERT INTO `card_share` VALUES (13, '100000449854004');
INSERT INTO `card_share` VALUES (13, '100001950005002');
INSERT INTO `card_share` VALUES (13, '100002045471125');
INSERT INTO `card_share` VALUES (13, '100003814787470');
INSERT INTO `card_share` VALUES (14, '100002041722306');
INSERT INTO `card_share` VALUES (14, '100002842159343');
INSERT INTO `card_share` VALUES (16, '100002161315577');
INSERT INTO `card_share` VALUES (17, '100003780895463');
INSERT INTO `card_share` VALUES (17, '100002417657586');
INSERT INTO `card_share` VALUES (17, '100002149855807');
INSERT INTO `card_share` VALUES (17, '100001607723134');
INSERT INTO `card_share` VALUES (17, '100001431365689');
INSERT INTO `card_share` VALUES (17, '100000218318112');
INSERT INTO `card_share` VALUES (17, '1802606545');
INSERT INTO `card_share` VALUES (19, '100007880203551');
INSERT INTO `card_share` VALUES (19, '100006139688496');
INSERT INTO `card_share` VALUES (19, '100004829348783');
INSERT INTO `card_share` VALUES (19, '100003814787470');
INSERT INTO `card_share` VALUES (19, '100003780895463');
INSERT INTO `card_share` VALUES (19, '100002842159343');
INSERT INTO `card_share` VALUES (19, '100002161315577');
INSERT INTO `card_share` VALUES (19, '100002127417279');
INSERT INTO `card_share` VALUES (19, '100002041722306');
INSERT INTO `card_share` VALUES (19, '100001957794015');
INSERT INTO `card_share` VALUES (19, '100001950005002');
INSERT INTO `card_share` VALUES (19, '100001625137476');
INSERT INTO `card_share` VALUES (19, '100001607723134');
INSERT INTO `card_share` VALUES (19, '100001202837671');
INSERT INTO `card_share` VALUES (19, '100001118082648');
INSERT INTO `card_share` VALUES (19, '100000872926145');
INSERT INTO `card_share` VALUES (19, '100000367699660');
INSERT INTO `card_share` VALUES (19, '100000350203388');
INSERT INTO `card_share` VALUES (19, '100000316250378');
INSERT INTO `card_share` VALUES (19, '100000314030547');
INSERT INTO `card_share` VALUES (19, '100000289996830');
INSERT INTO `card_share` VALUES (19, '100000246555928');
INSERT INTO `card_share` VALUES (19, '100000244853373');
INSERT INTO `card_share` VALUES (19, '100000238143381');
INSERT INTO `card_share` VALUES (19, '100000229186086');
INSERT INTO `card_share` VALUES (19, '100000222676856');
INSERT INTO `card_share` VALUES (19, '100000132496040');
INSERT INTO `card_share` VALUES (19, '100000103595777');
INSERT INTO `card_share` VALUES (19, '1836957518');
INSERT INTO `card_share` VALUES (19, '1802606545');
INSERT INTO `card_share` VALUES (19, '1783454900');
INSERT INTO `card_share` VALUES (19, '1342248170');
INSERT INTO `card_share` VALUES (15, '100000196684195');
INSERT INTO `card_share` VALUES (20, '100000196684195');
INSERT INTO `card_share` VALUES (20, '100000419426073');
INSERT INTO `card_share` VALUES (20, '100000438470243');
INSERT INTO `card_share` VALUES (20, '100000449854004');
INSERT INTO `card_share` VALUES (20, '100001118082648');
INSERT INTO `card_share` VALUES (20, '100001550508401');
INSERT INTO `card_share` VALUES (20, '100001950005002');
INSERT INTO `card_share` VALUES (20, '100001982086177');
INSERT INTO `card_share` VALUES (20, '100002041722306');
INSERT INTO `card_share` VALUES (20, '100002045471125');
INSERT INTO `card_share` VALUES (20, '100002149855807');
INSERT INTO `card_share` VALUES (20, '100002842159343');
INSERT INTO `card_share` VALUES (20, '100003814787470');
INSERT INTO `card_share` VALUES (9, '100000196684195');
INSERT INTO `card_share` VALUES (12, '100000196684195');
INSERT INTO `card_share` VALUES (11, '100000196684195');
INSERT INTO `card_share` VALUES (11, '100001950005002');
INSERT INTO `card_share` VALUES (21, '100000042069695');
INSERT INTO `card_share` VALUES (25, '100000196684195');
INSERT INTO `card_share` VALUES (17, '100007880203551');
