-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 19, 2014 at 06:59 PM
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fitness_inquirer`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `a_id` int(5) NOT NULL AUTO_INCREMENT,
  `q_id` int(5) NOT NULL,
  `a_text` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`a_id`, `q_id`, `a_text`) VALUES
(1, 1, 'Male'),
(2, 1, 'Female'),
(3, 2, '14-16'),
(4, 2, '16-18'),
(5, 2, '16-20'),
(6, 2, '20-30');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `q_id` int(5) NOT NULL AUTO_INCREMENT,
  `q_text` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`q_id`, `q_text`) VALUES
(1, 'Choose your gender, please'),
(2, 'Choose your age, please.');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE IF NOT EXISTS `results` (
  `r_id` int(10) NOT NULL AUTO_INCREMENT,
  `q_id` int(5) NOT NULL,
  `a_id` int(5) NOT NULL,
  `additional` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
