-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2024 at 05:11 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ed-book`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assignteacher`
--

CREATE TABLE `tbl_assignteacher` (
  `assign_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_assignteacher`
--

INSERT INTO `tbl_assignteacher` (`assign_id`, `teacher_id`, `subject_id`) VALUES
(1, 3, 1),
(3, 4, 2),
(4, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_batch`
--

CREATE TABLE `tbl_batch` (
  `batch_id` int(11) NOT NULL,
  `batch_name` varchar(10) NOT NULL,
  `college_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_batch`
--

INSERT INTO `tbl_batch` (`batch_id`, `batch_name`, `college_id`) VALUES
(1, '2021', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_college`
--

CREATE TABLE `tbl_college` (
  `college_id` int(11) NOT NULL,
  `college_name` varchar(100) NOT NULL,
  `college_contact` varchar(15) NOT NULL,
  `college_email` varchar(100) NOT NULL,
  `college_address` varchar(100) NOT NULL,
  `college_photo` varchar(100) NOT NULL,
  `college_password` varchar(80) NOT NULL,
  `place_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `college_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_college`
--

INSERT INTO `tbl_college` (`college_id`, `college_name`, `college_contact`, `college_email`, `college_address`, `college_photo`, `college_password`, `place_id`, `university_id`, `college_status`) VALUES
(2, 'IGCAS', '9607452126', 'igcas@gmail.com', 'address of college', 'CollegePhoto_1856.jpeg', '12345', 3, 1, 1),
(3, 'Eldho Mar Baselios', '8765349828', 'emb@gmail.com', 'address of Eldho Mar Baselios', 'CollegePhoto_1796.jpg', '12345', 3, 1, 1),
(4, 'MBCET College of engineering', '9476285375', 'mbcet@gmail.com', 'address of MBCET', 'CollegePhoto_1497.jpeg', '12345', 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `comment_id` int(11) NOT NULL,
  `comment_date` varchar(30) NOT NULL,
  `comment_content` varchar(200) NOT NULL,
  `post_id` int(11) NOT NULL,
  `college_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`comment_id`, `comment_date`, `comment_content`, `post_id`, `college_id`, `department_id`, `teacher_id`, `student_id`) VALUES
(1, '2024-02-27', 'first comment\r\n', 15, 2, NULL, NULL, NULL),
(2, '2024-02-27', 'first comment\r\n', 15, 2, NULL, NULL, NULL),
(3, '2024-02-27', 'nice', 15, 2, NULL, NULL, NULL),
(4, '2024-02-27', 'super', 15, 2, NULL, NULL, NULL),
(5, '2024-02-27', 'good\r\n', 15, 2, NULL, NULL, NULL),
(6, '2024-03-04', 'first comment\r\n', 18, 2, NULL, NULL, NULL),
(7, '2024-03-04', 'ok good', 15, 4, NULL, NULL, NULL),
(8, '2024-03-04', 'nice', 15, NULL, NULL, NULL, 2),
(9, '2024-03-04', 'good one', 17, NULL, NULL, NULL, 2),
(10, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(11, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(12, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(13, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(14, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(15, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(16, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(17, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(18, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(19, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(20, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(21, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(22, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(23, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(24, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(25, '2024-03-11', 'last one', 18, NULL, NULL, NULL, 1),
(26, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(27, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(28, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(29, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(30, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(31, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(32, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(33, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(34, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(35, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(36, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(37, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(38, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(39, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(40, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(41, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(42, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(43, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(44, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(45, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(46, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(47, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(48, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(49, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(50, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(51, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(52, '2024-03-11', 'null', 19, NULL, NULL, NULL, 1),
(53, '2024-03-11', 'null', 19, NULL, NULL, NULL, 1),
(54, '2024-03-11', 'null', 19, NULL, NULL, NULL, 1),
(55, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(56, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(57, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(58, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(59, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(60, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(61, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(62, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(63, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(64, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(65, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(66, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(67, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(68, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(69, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(70, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(71, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(72, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(73, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(74, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(75, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(76, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(77, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(78, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(79, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(80, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(81, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(82, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(83, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(84, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(85, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(86, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(87, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(88, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(89, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(90, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(91, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(92, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(93, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(94, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(95, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(96, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(97, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(98, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(99, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(100, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(101, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(102, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(103, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(104, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(105, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(106, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(107, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(108, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(109, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(110, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(111, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(112, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(113, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(114, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(115, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(116, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(117, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(118, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(119, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(120, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(121, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(122, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(123, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(124, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(125, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(126, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(127, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(128, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(129, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(130, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(131, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(132, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(133, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(134, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(135, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(136, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(137, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(138, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(139, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(140, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(141, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(142, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(143, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(144, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(145, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(146, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(147, '2024-03-11', 'null', 18, NULL, NULL, NULL, 1),
(148, '2024-03-11', 'nice', 17, NULL, NULL, NULL, 1),
(149, '2024-03-11', 'nice', 17, NULL, NULL, NULL, 1),
(150, '2024-03-11', 'hello', 17, NULL, NULL, NULL, 1),
(151, '2024-03-11', '😊', 17, NULL, NULL, NULL, 1),
(152, '2024-03-11', '😅', 19, NULL, NULL, NULL, 1),
(153, '2024-03-11', 'hello', 19, NULL, NULL, NULL, 1),
(154, '2024-03-11', 'hi', 19, NULL, NULL, NULL, 1),
(155, '2024-03-11', 'nice', 19, NULL, NULL, NULL, 1),
(156, '2024-03-11', 'super ', 19, NULL, NULL, NULL, 1),
(157, '2024-03-11', 'ydgd', 19, NULL, NULL, NULL, 1),
(158, '2024-03-12', '👍🏻', 17, NULL, NULL, NULL, 1),
(159, '2024-03-14', 'hi', 15, NULL, NULL, NULL, 1),
(160, '2024-03-14', 'Arjun 😅', 15, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(80) NOT NULL,
  `sem_count` int(11) NOT NULL,
  `departmenttype_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_course`
--

INSERT INTO `tbl_course` (`course_id`, `course_name`, `sem_count`, `departmenttype_id`, `university_id`) VALUES
(1, 'BCA', 65454, 1, 1),
(6, 'BSC', 6, 1, 1),
(7, 'B.com', 6, 2, 1),
(10, 'BTeach cs ', 8, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `department_id` int(11) NOT NULL,
  `departmenttype_id` int(11) NOT NULL,
  `department_email` varchar(80) NOT NULL,
  `department_contact` varchar(20) NOT NULL,
  `department_photo` varchar(100) NOT NULL,
  `department_landmark` varchar(100) NOT NULL,
  `department_password` varchar(50) NOT NULL,
  `college_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`department_id`, `departmenttype_id`, `department_email`, `department_contact`, `department_photo`, `department_landmark`, `department_password`, `college_id`) VALUES
(2, 1, 'igcascs@gmail.com', '9857435276', 'DepartmentPhoto_1707.jpeg', 'RoomNo:203', '12345', 2),
(4, 2, 'igcascommerce@gmail.com', '9674536542', 'DepartmentPhoto_1811.jpeg', 'RoomNo:200', '12345', 2),
(5, 1, 'embcs@gmail.com', '9264857395', 'DepartmentPhoto_1247.jpg', 'Room 130', '12345', 3),
(6, 1, 'mbcetcs@gmail.com', '7684539868', 'DepartmentPhoto_1583.png', 'Room 112', '12345', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departmenttype`
--

CREATE TABLE `tbl_departmenttype` (
  `departmenttype_id` int(11) NOT NULL,
  `departmenttype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_departmenttype`
--

INSERT INTO `tbl_departmenttype` (`departmenttype_id`, `departmenttype_name`) VALUES
(1, 'computer science'),
(2, 'Commerce'),
(3, 'Mathematics'),
(4, 'Statistics');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
(1, 'Pathanamthitta'),
(2, 'Eranakulam');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lecture`
--

CREATE TABLE `tbl_lecture` (
  `lecture_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `lecture_content` varchar(100) NOT NULL,
  `lecture_date` date NOT NULL,
  `lecture_file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_lecture`
--

INSERT INTO `tbl_lecture` (`lecture_id`, `teacher_id`, `subject_id`, `lecture_content`, `lecture_date`, `lecture_file`) VALUES
(1, 3, 3, 'Java', '2023-12-26', 'LectureFile_1108.pdf'),
(2, 3, 4, 'java programs', '2023-12-26', 'LectureFile_1351.pdf'),
(6, 3, 1, 'MOOC', '2023-12-27', 'LectureFile_1859.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `place_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `district_id`, `place_name`) VALUES
(1, 1, 'Ranni'),
(2, 2, 'Muvattupuzha'),
(3, 2, 'Kothamangalam');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `post_id` int(11) NOT NULL,
  `post_content` varchar(100) NOT NULL,
  `post_date` date NOT NULL,
  `post_file` varchar(100) NOT NULL,
  `university_id` int(11) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `post_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_post`
--

INSERT INTO `tbl_post` (`post_id`, `post_content`, `post_date`, `post_file`, `university_id`, `college_id`, `department_id`, `teacher_id`, `post_status`) VALUES
(15, 'igcas public', '2024-02-22', 'Post_1122.png', NULL, 2, NULL, NULL, 2),
(17, 'igcas public', '2024-02-22', 'Post_1464.jpg', NULL, 2, NULL, NULL, 2),
(18, 'cs department public 18', '2024-02-22', 'Post_1766.jpg', NULL, NULL, 2, NULL, 4),
(19, 'MGU public', '2024-02-22', 'Post_1058.jpeg', 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_semester`
--

CREATE TABLE `tbl_semester` (
  `semester_id` int(11) NOT NULL,
  `semester_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_semester`
--

INSERT INTO `tbl_semester` (`semester_id`, `semester_count`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `student_email` varchar(100) NOT NULL,
  `student_photo` varchar(100) NOT NULL,
  `student_address` varchar(100) NOT NULL,
  `student_contact` int(11) NOT NULL,
  `student_gender` varchar(20) NOT NULL,
  `student_dob` date NOT NULL,
  `course_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `student_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`student_id`, `student_name`, `student_email`, `student_photo`, `student_address`, `student_contact`, `student_gender`, `student_dob`, `course_id`, `batch_id`, `place_id`, `department_id`, `student_password`) VALUES
(1, 'melbin', 'student@gmail.com', 'StudentPhoto_1319.jpg', 'addresss', 1234567832, 'male', '2003-08-19', 1, 1, 1, 2, '12345'),
(2, 'babu', 'babu@gmail.com', 'StudentPhoto_1932.webp', 'address of babu', 768475368, 'male', '2006-04-01', 10, 1, 2, 6, '12345');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subject`
--

CREATE TABLE `tbl_subject` (
  `subject_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_subject`
--

INSERT INTO `tbl_subject` (`subject_id`, `course_id`, `semester_id`, `subject_name`) VALUES
(1, 1, 1, 'Maths'),
(2, 1, 2, 'Maths'),
(3, 1, 1, 'C++'),
(4, 7, 1, 'Banking'),
(5, 1, 1, 'English'),
(6, 10, 1, 'maths');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_teacher`
--

CREATE TABLE `tbl_teacher` (
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_contact` varchar(13) NOT NULL,
  `teacher_email` varchar(50) NOT NULL,
  `teacher_gender` varchar(20) NOT NULL,
  `teacher_address` varchar(100) NOT NULL,
  `teacher_about` varchar(100) NOT NULL,
  `teacher_photo` varchar(100) NOT NULL,
  `teacher_dob` date NOT NULL,
  `teacher_password` varchar(50) NOT NULL,
  `department_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_teacher`
--

INSERT INTO `tbl_teacher` (`teacher_id`, `teacher_name`, `teacher_contact`, `teacher_email`, `teacher_gender`, `teacher_address`, `teacher_about`, `teacher_photo`, `teacher_dob`, `teacher_password`, `department_id`, `place_id`) VALUES
(3, 'fathima', '9087564567', 'fathima@gmail.com', 'female', 'address', 'teacher', 'TeacherPhoto_1359.jpg', '1999-12-22', '12345', 2, 2),
(4, 'shena', '8374628346', 'shena@gmail.com', 'female', 'address of shena', 'teacher', 'TeacherPhoto_1085.jpeg', '1997-12-19', '12345', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_teacher_student_chat`
--

CREATE TABLE `tbl_teacher_student_chat` (
  `chat_id` int(10) NOT NULL,
  `chat_content` varchar(3500) NOT NULL,
  `from_teacher_id` int(10) UNSIGNED DEFAULT 0,
  `to_teacher_id` int(10) UNSIGNED DEFAULT 0,
  `to_student_id` int(10) UNSIGNED DEFAULT 0,
  `from_student_id` int(10) UNSIGNED DEFAULT 0,
  `chat_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_teacher_student_chat`
--

INSERT INTO `tbl_teacher_student_chat` (`chat_id`, `chat_content`, `from_teacher_id`, `to_teacher_id`, `to_student_id`, `from_student_id`, `chat_date`) VALUES
(1, 'hello hi', 3, 0, 1, 0, '2024-02-19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_university`
--

CREATE TABLE `tbl_university` (
  `university_id` int(11) NOT NULL,
  `university_name` varchar(100) NOT NULL,
  `university_photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_university`
--

INSERT INTO `tbl_university` (`university_id`, `university_name`, `university_photo`) VALUES
(1, 'MGU', 'UniversityPhoto_1120.png'),
(2, 'KTU', 'UniversityPhoto_1122.png'),
(5, 'Calicut', 'UniversityPhoto_1119.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_assignteacher`
--
ALTER TABLE `tbl_assignteacher`
  ADD PRIMARY KEY (`assign_id`);

--
-- Indexes for table `tbl_batch`
--
ALTER TABLE `tbl_batch`
  ADD PRIMARY KEY (`batch_id`);

--
-- Indexes for table `tbl_college`
--
ALTER TABLE `tbl_college`
  ADD PRIMARY KEY (`college_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `tbl_departmenttype`
--
ALTER TABLE `tbl_departmenttype`
  ADD PRIMARY KEY (`departmenttype_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_lecture`
--
ALTER TABLE `tbl_lecture`
  ADD PRIMARY KEY (`lecture_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `tbl_semester`
--
ALTER TABLE `tbl_semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `tbl_teacher`
--
ALTER TABLE `tbl_teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `tbl_teacher_student_chat`
--
ALTER TABLE `tbl_teacher_student_chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `tbl_university`
--
ALTER TABLE `tbl_university`
  ADD PRIMARY KEY (`university_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_assignteacher`
--
ALTER TABLE `tbl_assignteacher`
  MODIFY `assign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_batch`
--
ALTER TABLE `tbl_batch`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_college`
--
ALTER TABLE `tbl_college`
  MODIFY `college_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `tbl_course`
--
ALTER TABLE `tbl_course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_departmenttype`
--
ALTER TABLE `tbl_departmenttype`
  MODIFY `departmenttype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_lecture`
--
ALTER TABLE `tbl_lecture`
  MODIFY `lecture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_semester`
--
ALTER TABLE `tbl_semester`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_teacher`
--
ALTER TABLE `tbl_teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_teacher_student_chat`
--
ALTER TABLE `tbl_teacher_student_chat`
  MODIFY `chat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_university`
--
ALTER TABLE `tbl_university`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
