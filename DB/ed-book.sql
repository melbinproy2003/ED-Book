-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2024 at 07:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_batch`
--

CREATE TABLE `tbl_batch` (
  `batch_id` int(11) NOT NULL,
  `batch_name` varchar(10) NOT NULL,
  `college_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_college`
--

CREATE TABLE `tbl_college` (
  `college_id` int(10) UNSIGNED NOT NULL,
  `college_name` varchar(50) NOT NULL,
  `college_contact` varchar(50) NOT NULL,
  `college_email` varchar(50) NOT NULL,
  `college_address` varchar(50) NOT NULL,
  `college_photo` longtext NOT NULL,
  `college_password` varchar(50) NOT NULL,
  `place_id` int(10) UNSIGNED NOT NULL,
  `college_status` int(10) UNSIGNED DEFAULT 0,
  `university_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_college_department_chat`
--

CREATE TABLE `tbl_college_department_chat` (
  `cdc_id` int(10) UNSIGNED NOT NULL,
  `cdc_content` varchar(3500) NOT NULL,
  `to_college_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `from_college_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `from_department_id` int(11) NOT NULL DEFAULT 0,
  `cdc_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `comment_content` varchar(200) NOT NULL,
  `comment_date` varchar(50) NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `college_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `college_name` varchar(50) NOT NULL DEFAULT '0',
  `college_photo` longtext NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `department_name` varchar(50) NOT NULL DEFAULT '0',
  `department_photo` longtext NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `teacher_name` varchar(50) NOT NULL DEFAULT '0',
  `teacher_photo` longtext NOT NULL,
  `student_id` int(11) NOT NULL DEFAULT 0,
  `student_name` varchar(50) NOT NULL DEFAULT '0',
  `student_photo` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(10) UNSIGNED NOT NULL,
  `complaint_content` varchar(50) NOT NULL,
  `complaint_date` varchar(50) NOT NULL,
  `complaint_reply` varchar(50) NOT NULL DEFAULT 'Not Yet Reply',
  `complaint_reply_date` varchar(50) NOT NULL DEFAULT '0',
  `complaint_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `college_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `department_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `teacher_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `student_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `course_id` int(10) UNSIGNED NOT NULL,
  `department_type_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `sem_count` int(11) NOT NULL,
  `university_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `department_id` int(11) NOT NULL,
  `department_type_id` int(11) NOT NULL,
  `department_email` varchar(80) NOT NULL,
  `department_contact` varchar(20) NOT NULL,
  `department_photo` varchar(100) NOT NULL,
  `department_landmark` varchar(100) NOT NULL,
  `department_password` varchar(50) NOT NULL,
  `college_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department_chat`
--

CREATE TABLE `tbl_department_chat` (
  `dc_id` int(10) UNSIGNED NOT NULL,
  `dc_content` varchar(3500) NOT NULL,
  `dc_date` varchar(50) NOT NULL,
  `to_department_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `from_department_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `from_teacher_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `from_student_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department_type`
--

CREATE TABLE `tbl_department_type` (
  `department_type_id` int(11) NOT NULL,
  `department_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(10) UNSIGNED NOT NULL,
  `feedback_content` varchar(50) NOT NULL,
  `feedback_date` varchar(50) NOT NULL,
  `college_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `department_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `teacher_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `student_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_like`
--

CREATE TABLE `tbl_like` (
  `like_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `college_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `college_name` varchar(50) NOT NULL DEFAULT '0',
  `college_photo` longtext NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `department_name` varchar(50) NOT NULL DEFAULT '0',
  `department_photo` longtext NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `teacher_name` varchar(50) NOT NULL DEFAULT '0',
  `teacher_photo` longtext NOT NULL,
  `student_id` int(11) NOT NULL DEFAULT 0,
  `student_name` varchar(50) NOT NULL DEFAULT '0',
  `student_photo` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_phishingurls`
--

CREATE TABLE `tbl_phishingurls` (
  `phishing_id` int(10) UNSIGNED NOT NULL,
  `phishing_url` longtext NOT NULL,
  `phishing_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `place_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `post_content` varchar(200) NOT NULL,
  `post_date` varchar(50) NOT NULL,
  `college_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `post_file` longtext DEFAULT NULL,
  `college_name` varchar(50) NOT NULL DEFAULT '0',
  `college_photo` longtext NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `department_name` varchar(50) NOT NULL DEFAULT '0',
  `department_photo` longtext NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `teacher_name` varchar(50) NOT NULL DEFAULT '0',
  `teacher_photo` longtext NOT NULL,
  `student_id` int(11) NOT NULL DEFAULT 0,
  `student_name` varchar(50) NOT NULL DEFAULT '0',
  `student_photo` longtext NOT NULL,
  `privacy_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `university_id` int(11) NOT NULL DEFAULT 0,
  `university_photo` longtext NOT NULL,
  `university_name` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_semester`
--

CREATE TABLE `tbl_semester` (
  `semester_id` int(10) UNSIGNED NOT NULL,
  `semester_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_teacher_assign`
--

CREATE TABLE `tbl_teacher_assign` (
  `assign_id` int(11) NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_teacher_student_chat`
--

CREATE TABLE `tbl_teacher_student_chat` (
  `chat_id` int(10) UNSIGNED NOT NULL,
  `chat_content` varchar(3500) NOT NULL,
  `from_teacher_id` int(10) UNSIGNED DEFAULT 0,
  `to_teacher_id` int(10) UNSIGNED DEFAULT 0,
  `to_student_id` int(10) UNSIGNED DEFAULT 0,
  `from_student_id` int(10) UNSIGNED DEFAULT 0,
  `chat_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_university`
--

CREATE TABLE `tbl_university` (
  `university_id` int(11) NOT NULL,
  `university_name` varchar(100) NOT NULL,
  `university_photo` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

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
-- Indexes for table `tbl_college_department_chat`
--
ALTER TABLE `tbl_college_department_chat`
  ADD PRIMARY KEY (`cdc_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

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
-- Indexes for table `tbl_department_chat`
--
ALTER TABLE `tbl_department_chat`
  ADD PRIMARY KEY (`dc_id`);

--
-- Indexes for table `tbl_department_type`
--
ALTER TABLE `tbl_department_type`
  ADD PRIMARY KEY (`department_type_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_lecture`
--
ALTER TABLE `tbl_lecture`
  ADD PRIMARY KEY (`lecture_id`);

--
-- Indexes for table `tbl_like`
--
ALTER TABLE `tbl_like`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `tbl_phishingurls`
--
ALTER TABLE `tbl_phishingurls`
  ADD PRIMARY KEY (`phishing_id`);

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
-- Indexes for table `tbl_teacher_assign`
--
ALTER TABLE `tbl_teacher_assign`
  ADD PRIMARY KEY (`assign_id`);

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
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_batch`
--
ALTER TABLE `tbl_batch`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_college`
--
ALTER TABLE `tbl_college`
  MODIFY `college_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_college_department_chat`
--
ALTER TABLE `tbl_college_department_chat`
  MODIFY `cdc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_course`
--
ALTER TABLE `tbl_course`
  MODIFY `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_department_chat`
--
ALTER TABLE `tbl_department_chat`
  MODIFY `dc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_department_type`
--
ALTER TABLE `tbl_department_type`
  MODIFY `department_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_lecture`
--
ALTER TABLE `tbl_lecture`
  MODIFY `lecture_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_like`
--
ALTER TABLE `tbl_like`
  MODIFY `like_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_phishingurls`
--
ALTER TABLE `tbl_phishingurls`
  MODIFY `phishing_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_semester`
--
ALTER TABLE `tbl_semester`
  MODIFY `semester_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_teacher`
--
ALTER TABLE `tbl_teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_teacher_assign`
--
ALTER TABLE `tbl_teacher_assign`
  MODIFY `assign_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_teacher_student_chat`
--
ALTER TABLE `tbl_teacher_student_chat`
  MODIFY `chat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_university`
--
ALTER TABLE `tbl_university`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
