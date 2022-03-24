-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 02, 2019 at 08:52 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamefreak`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `pincode` int(6) NOT NULL,
  `address1` varchar(60) NOT NULL,
  `address2` varchar(60) NOT NULL,
  `landmark` varchar(40) NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(20) NOT NULL,
  `address_type` varchar(6) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `user_id`, `full_name`, `phone`, `pincode`, `address1`, `address2`, `landmark`, `city`, `state`, `address_type`) VALUES
(5, 1, 'Nikhil Rana', 9760302923, 245878, 'St.George\'s College', 'Barlowganj', 'GP Hotel', 'Mussoorie', 'Uttarakhand', 'Office'),
(6, 4, 'Poonam', 8585971779, 110016, 'House No.8A', 'Ber Sarai', 'PNB ATM', 'South Delhi', 'Delhi', 'Home'),
(7, 12, 'Utsav Barnwal', 9661393915, 110003, 'Kyu batau', 'Game to bheja nahi', 'bhak', 'Pta nahi hai kya tujhe :|', 'Delhi', 'Home'),
(8, 12, 'edrftgy', 8848565652, 876, '787', '87', '87', '7', 'Sikkim', 'Home'),
(9, 12, 'Nikhil Rana', 9760302923, 110016, 'House No.11, F-63, Room No.401,', 'dgkj', 'Nice Paratha Center', 'New Delhi', 'Jharkhand', 'Office');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `platform` varchar(4) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `user_id` (`user_id`),
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `pc_name` varchar(70) DEFAULT NULL,
  `ps4_name` varchar(70) DEFAULT NULL,
  `xbox_name` varchar(70) DEFAULT NULL,
  `pc_price` int(11) NOT NULL,
  `pc_sale` int(11) NOT NULL,
  `ps4_price` int(11) NOT NULL,
  `ps4_sale` int(11) NOT NULL,
  `xbox_price` int(11) NOT NULL,
  `xbox_sale` int(11) NOT NULL,
  `pc_cover` varchar(50) DEFAULT NULL,
  `ps4_cover` varchar(50) DEFAULT NULL,
  `xbox_cover` varchar(50) DEFAULT NULL,
  `rating` float NOT NULL,
  `rated` varchar(3) NOT NULL,
  `disc_1` varchar(300) NOT NULL,
  `disc_2` varchar(300) NOT NULL,
  `disc_3` varchar(300) NOT NULL,
  `pc_stock` int(11) NOT NULL,
  `ps4_stock` int(11) NOT NULL,
  `xbox_stock` int(11) NOT NULL,
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`game_id`, `name`, `pc_name`, `ps4_name`, `xbox_name`, `pc_price`, `pc_sale`, `ps4_price`, `ps4_sale`, `xbox_price`, `xbox_sale`, `pc_cover`, `ps4_cover`, `xbox_cover`, `rating`, `rated`, `disc_1`, `disc_2`, `disc_3`, `pc_stock`, `ps4_stock`, `xbox_stock`) VALUES
(1, 'The Witcher 3: Wild Hunt', 'The Witcher 3: Wild Hunt', 'The Witcher 3: Wild Hunt', 'The Witcher 3: Wild Hunt', 2499, 1999, 1499, 1417, 2599, 2299, 'images/witcher3_pc.jpg', 'images/witcher3_ps4.jpg', 'images/witcher3_xbox.jpg', 5, '18', 'The Best Award Winning RPG of all time.', 'Step into the shoes of Geralt of Rivia and follow his footsteps as he slay monsters, battle enemies, complete contracts, and roams around the whole nation to find his daughter-like-apprentice Ciri.', 'Weave your own story and adventure from a world of different dialouges and choices and find your way to one of the 31 endings of The Witcher 3: Wild Hunt.', 6, 6, 6),
(2, 'The Elder Scrolls V: Skyrim', 'The Elder Scrolls V: Skyrim', 'The Elder Scrolls V: Skyrim || Special Edition', 'The Elder Scrolls V: Skyrim || Special Edition', 4999, 3484, 1999, 1925, 2999, 2225, 'images/skyrim_pc.jpg', 'images/skyrim_ps4.jpg', 'images/skyrim_xbox.jpg', 5, '18', 'Skyrim has a simple sandbox system i.e. if you can see it, you can step on it.', 'The Dragons are thought to be extinct and have not been for a century until now. And out of the dust appears a Dragonborn who stumbles unknowingly upon his destiny. Either this all is a big prophecy or a bad omen.', 'Roam the world of Skyrim. Complete quests, slay dragons, join guilds, study in college, get married, and much more as you walk the path of the dragonborn.', 7, 8, 10),
(3, 'Grand Theft Auto V', 'Grand Theft Auto V', 'Grand Theft Auto V', 'Grand Theft Auto V', 2490, 2299, 2695, 2459, 2647, 2499, 'images/gtaV_pc.jpg', 'images/gtaV_ps4.jpg', 'images/gtaV_xbox.jpg', 5, '18', 'GTA was always great with a single protagonist but what happens when comes 3? Experience a breathtaking gameplay with Michael, Franklin, and Trevor as they go around San Andreas and take down enemies, complete heists, and make money.', 'GTA V offers a whole different world for online multiplayers to walk in a whole new universe and face other live players.', 'With tons of gameplay hours and a whole lot side-quests to complete the player will always have something on hands.', 10, 10, 9),
(4, 'Far Cry 4', 'Far Cry 4', 'Far Cry 4', 'Far Cry 4 || Limited Edition', 2599, 2099, 1250, 1099, 2199, 1999, 'images/farcry4_pc.jpg', 'images/farcry4_ps4.jpg', 'images/farcry4_xbox.jpg', 4, '18', 'Expansive, immersive open-world first-person shooter. Features a vast array of weapons, vehicles and animals.', 'Based in Kyrat, a breathtaking region of the Himalayas. The region is struggling under a despotic self-appointed king.', 'Write your own story across an exotic open-world landscape.', 10, 9, 10),
(5, 'Dark Souls III', 'Dark Souls III || GOTY Edition', 'Dark Souls III || The Fire Fades Edition', 'Dark Souls III', 4299, 4099, 2499, 2299, 2490, 2440, 'images/darksouls3_pc.jpg', 'images/darksouls3_ps4.jpg', 'images/darksouls3_xbox.jpg', 4.5, '16', 'Atmospheric Visuals: dynamic lighting and particle effects immerse players into a dark fantasy world of ruin.', 'Interconnected World: expertly crafted world encourages players to explore vast and breathtaking landscapes.', 'Sword Action: diversifies combat action alloing players to craft their own unique play style.\r\nUnique Online System: evolution of trademark online multiplayer functionality that seamlessly integrates online interactions into single player story.', 10, 10, 10),
(6, 'Player Unknown\'s Battle Grounds - PUBG', 'Player Unknown\'s Battle Grounds - PUBG || PC Digital Code', NULL, NULL, 2999, 2399, 0, 0, 0, 0, 'images/pubg_pc.jpg', NULL, NULL, 4, '13', '100 players. 1 will remain. Simple procedure - Kill or Survive.', 'With a vast variety of guns, drops, landscape, vehicles, and so much more, the player is always gonna be thrilled everytime.', 'PUBG is a game that sent a spark across the gaming world. With millions of players playing everday, there are sure many to fight for that chicken dinner.', 10, 0, 0),
(7, 'Overwatch Origin Edition', 'Overwatch Origin Edition || Digitial Download', 'Overwatch || Origin Edition', 'Overwatch ||  Origin Edition', 3299, 2499, 3299, 2094, 3299, 2647, 'images/overwatch_pc.jpg', 'images/overwatch_ps4.jpg', 'images/overwatch_xbox.jpg', 4, '13', 'Experience the extraordinary.\r\nPlay as heroes, not classes.\r\nFight for the future. Together.', 'The world is your battlefield.', 'One of the best online multiplayer games with millions of players battling in the field.', 10, 10, 10),
(8, 'God of War', NULL, 'God of War', NULL, 0, 0, 3999, 3550, 0, 0, NULL, 'images/godofwar_ps4.jpg', NULL, 5, '18', '\r\nA New Beginning: His vengeance against the gods of Olympus far behind him, Kratos now lives as a man in the lands of Norse Gods and monsters, it is in this harsh, unforgiving world that he must fight to survive and teach his son to do the same.', 'Second Chances: As mentor and protector to a son determined to earn his respect, Kratos is faced with an unexpected opportunity to master the rage that has long defined him, questioning the dark lineage he\'s passed on to his son, he hopes to make amends for the shortcomings of his past.', 'Vicious, Physical Combat: With an intimate, over-the-shoulder free camera that brings the action closer than ever, combat in God of War is up close, frenetic and unflinching, kratos\' axe -powerful, magic and multi-faceted - is a brutal weapon as well as a versatile tool for exploration.', 0, 9, 0),
(9, 'Assassin\'s Creed: Odyssey', 'Assassins Creed: Odyssey', 'Assassins Creed: Odyssey || Gold Edition', 'Assassins Creed: Odyssey', 4299, 3599, 3999, 2599, 3460, 3185, 'images/assassin\'s_creed_odyssey_pc.jpg', 'images/assassin\'s_creed_odyssey_ps4.jpg', 'images/assassin\'s_creed_odyssey_xbox.jpg', 4, '18', 'First released in 2007, assassin’s creed is an award-winning video game series that has had multiple spin-offs; The series has been released amongst nearly all consoles including previous generations and is one of the biggest in the gaming industry.', 'Assassin’s creed has followed the story of the secret war that seems to be never-ending; The assassin brotherhood and the Templar order have been fighting in many different historical settings from around the world.', 'No more details have been released and ubisoft have promised to reveal more information at E3 2018; Tune back in for further information and pre-order assassin’s creed: odyssey today', 10, 7, 10),
(10, 'League of Legends', 'League of Legends || Collector\'s Pack', NULL, NULL, 1799, 1099, 0, 0, 0, 0, 'images/lol_pc.jpg', NULL, NULL, 4, '13', 'Take on the role of Summoner as you build your masteries, select your available spells, equip your Runes and call forth your Champions to battle.\r\nSelect one of over 40 unique Champions, each with unique special abilities and innovative gameplay mechanics.', 'Level your Champion from weak to powerful and make RPG-style advancement decisions from empower abilities to equipping items in fast paced battle scenarios.\r\nGo head-to-head in competitive multiplayer matches with and against your friends, or compete in solo matches against configurable AI bots.', 'Collector\'s Pack Content: One exclusive alternate Champion skin model -Kayle the Judicator; 20 playable Champions; 4 special Summoner Runes; $10 of Riot Points for use in the Store.', 10, 0, 0),
(11, 'DOTA 2', 'DOTA 2', NULL, NULL, 2380, 1599, 0, 0, 0, 0, 'images/dota2_pc.png', NULL, NULL, 4, '13', 'When it comes to diversity of heroes, abilities, and powerful items, Dota boasts an endless array—no two games are the same. Any hero can fill multiple roles, and there\'s an abundance of items to help meet the needs of each game.', 'Competitive balance is Dota\'s crown jewel, and to ensure everyone is playing on an even field, the core content of the game—like the vast pool of heroes—is available to all players.', 'Dota is deep, and constantly evolving, but it\'s never too late to join. \r\nLearn the ropes playing co-op vs. bots. Sharpen your skills in the hero demo mode. Jump into the behavior- and skill-based matchmaking system that ensures you\'ll \r\nbe matched with the right players each game.', 7, 0, 0),
(12, 'Counter-strike: Global Offensive', 'Counter-strike: Global Offensive', NULL, NULL, 1599, 399, 0, 0, 0, 0, 'images/csgo_pc.jpg', NULL, NULL, 4.5, '16', 'Counter-Strike: Global Offensive (CS:GO) expands upon the team-based first person shooter gameplay the original Counter-Strike pioneered when it launched in 1999. Two teams compete in multiple rounds of objective-based game modes with the goal of winning enough rounds to win the match.', 'CS:GO features new maps, characters, and weapons and delivers updated versions of the classic Counter-Strike maps like Dust, Inferno, Nuke, Train, and more.', 'Through each of its iterations – 1.6, Source, and Global Offensive – Counter-Strike has been the de facto benchmark of a player’s first person shooter skill.', 8, 0, 0),
(13, 'Tom Clancy\'s Rainbow Six Siege', 'Tom Clancy\'s Rainbow Six Siege || Art of Seige Edition', 'Tom Clancy\'s Rainbow Six Siege || Art of Seige Edition', 'Tom Clancy\'s Rainbow Six Siege || Advanced Edition', 2499, 1999, 1999, 1499, 2999, 1999, 'images/rainbowsixsiege_pc.jpg', 'images/rainbowsixsiege_ps4.jpg', 'images/rainbowsixsiege_xbox.jpg', 4, '18', 'Inspired by counter-terrorist operatives across the world, Rainbow Six Siege invites players to master the art of destruction.\r\nIntense close-quarters confrontations, high lethality, tactics, team play, and explosive action are at the centre of the experience.', 'The multiplayer gameplay of Rainbow Six Siege sets a new bar for intense firefights and expert strategy in Rainbow Six legacy.', 'Features sieges, a new style of assault in which enemies can transform their environments into strongholds to prevent breaches.\r\nEverything in the environment reacts realistically, dynamically, and uniquely based on ammo and explosives used by the players.', 8, 9, 10);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `platform` varchar(4) NOT NULL,
  `original_price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `cover` varchar(50) NOT NULL,
  `status` enum('delivery','delivered','cancelled','refund','return') NOT NULL,
  `refund` enum('n/a','pending','done') NOT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `user_id` (`user_id`),
  KEY `game_id` (`game_id`),
  KEY `address_id` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`purchase_id`, `user_id`, `address_id`, `game_id`, `name`, `platform`, `original_price`, `sale_price`, `cover`, `status`, `refund`) VALUES
(92, 12, 7, 1, 'The Witcher 3: Wild Hunt', 'PC', 2499, 1999, 'images/witcher3_pc.jpg', 'delivered', 'n/a'),
(93, 12, 9, 2, 'The Elder Scrolls V: Skyrim', 'PC', 4999, 3484, 'images/skyrim_pc.jpg', 'refund', 'pending'),
(94, 12, 8, 3, 'Grand Theft Auto V', 'Xbox', 2647, 2499, 'images/gtaV_xbox.jpg', 'delivered', 'n/a');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `phone` bigint(11) NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `password`) VALUES
(1, 'Nikhil', 'Rana', 'nightpredetor@gmail.com', 9760302923, 'Nikhil123'),
(2, 'Akhil', 'Rana', 'akhilalwaynian@gmail.com', 9997470247, 'Akhil123'),
(3, 'Ehsaan', 'Karim', 'ehsaan@gmail.com', 9205579102, 'Ehsaan123'),
(4, 'Anya', 'Saxena', 'poonam15kapoor@gmail.com', 8585971779, 'Anya123'),
(5, 'Bunty', 'Payal', 'deepakpayal@gmail.com', 7042809707, 'Bunty123'),
(9, 'Poonam', 'Rana', 'deepakpasadyal@gmail.com', 9760302923, 'ASDFsadf213'),
(10, 'Nikhil', 'Rana', 'nightprsadedetor@gmail.com', 9760302923, 'ASFsaff124'),
(12, 'Utsav', 'Barnwal', 'u.barnwal36@gmail.com', 9661393915, 'Koisivi@123');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `wishlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `platform` varchar(4) NOT NULL,
  PRIMARY KEY (`wishlist_id`),
  KEY `user_id` (`user_id`),
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`, `game_id`, `platform`) VALUES
(24, 4, 10, 'PC'),
(27, 1, 1, 'PC'),
(28, 12, 1, 'PC');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  ADD CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
