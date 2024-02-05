-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2024 at 01:26 PM
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
(1, 'BCA', 6, 1, 1),
(6, 'BSC', 6, 1, 1),
(7, 'B.com', 6, 2, 1);

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
(5, 1, 'embcs@gmail.com', '9264857395', 'DepartmentPhoto_1247.jpg', 'Room 130', '12345', 3);

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
(1, 'university public', '2024-01-15', 'Post_1252.jpg', 1, NULL, NULL, NULL, 0),
(2, 'university privet', '2024-01-15', 'Post_1010.jpg', 1, NULL, NULL, NULL, 1),
(3, 'college public', '2024-01-15', 'Post_2084.jpeg', NULL, 2, NULL, NULL, 2),
(4, 'college privet', '2024-01-15', 'Post_1475.jpeg', NULL, 2, NULL, NULL, 3),
(5, 'department public', '2024-01-15', 'Post_2083.jpg', NULL, NULL, 2, NULL, 4),
(6, 'Department Privet', '2024-01-15', 'Post_1256.jpg', NULL, NULL, 2, NULL, 5),
(8, 'checking private', '2024-01-20', 'Post_1835.webp', NULL, 2, NULL, NULL, 3),
(9, 'college public', '2024-01-22', 'Post_1398.webp', NULL, 3, NULL, NULL, 2),
(10, 'university public', '2024-01-22', 'Post_1590.png', 2, NULL, NULL, NULL, 0),
(11, 'Department Privet', '2024-01-22', 'Post_1400.jpeg', NULL, NULL, 4, NULL, 5),
(12, 'Department Public', '2024-01-22', 'Post_1487.jpeg', NULL, NULL, 4, NULL, 4);

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
(1, 'melbin', 'student@gmail.com', 'StudentPhoto_1319.jpg', 'addresss', 1234567832, 'male', '2003-08-19', 1, 1, 1, 2, '12345');

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
(5, 1, 1, 'English');

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
-- Table structure for table `tbl_university`
--

CREATE TABLE `tbl_university` (
  `university_id` int(11) NOT NULL,
  `university_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_university`
--

INSERT INTO `tbl_university` (`university_id`, `university_name`) VALUES
(1, 'MGU'),
(2, 'KTU');

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
-- AUTO_INCREMENT for table `tbl_course`
--
ALTER TABLE `tbl_course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_semester`
--
ALTER TABLE `tbl_semester`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_teacher`
--
ALTER TABLE `tbl_teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_university`
--
ALTER TABLE `tbl_university`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
