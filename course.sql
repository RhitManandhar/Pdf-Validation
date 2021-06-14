-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2021 at 10:44 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course`
--

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `college_id` int(11) NOT NULL,
  `college_name` text DEFAULT NULL,
  `college_location` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`college_id`, `college_name`, `college_location`) VALUES
(1, 'ATMC Federation University', 'Sydney'),
(2, 'ATMC University of Sunshine Coast', 'Melbourne');

-- --------------------------------------------------------

--
-- Table structure for table `college_program`
--

CREATE TABLE `college_program` (
  `id` int(11) NOT NULL,
  `college_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `college_program`
--

INSERT INTO `college_program` (`id`, `college_id`, `program_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 1),
(4, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` text DEFAULT NULL,
  `week1` text DEFAULT NULL,
  `week2` text DEFAULT NULL,
  `week3` text DEFAULT NULL,
  `week4` text DEFAULT NULL,
  `week5` text DEFAULT NULL,
  `week6` text DEFAULT NULL,
  `week7` text DEFAULT NULL,
  `week8` text DEFAULT NULL,
  `week9` text DEFAULT NULL,
  `week10` text DEFAULT NULL,
  `week11` text DEFAULT NULL,
  `week12` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `week1`, `week2`, `week3`, `week4`, `week5`, `week6`, `week7`, `week8`, `week9`, `week10`, `week11`, `week12`) VALUES
(1, 'User Experience', 'HCI, Human Computer Interaction, Design as architecture, Universal usability, Human factors', 'Design theories, Principles for the design of user interfaces, Affordance, Visibility, Standards and guidelines', 'Norman\'s seven stages of actions, Affective design, Consistency, Eight golden rules', 'Menu design, Online form design, Icon design', 'Direct manipulation, Interaction devices, New technologies and their challenges', 'Importance of evaluation, Design of a usability test, Scenarios', 'Evaluating systems, Expert review, Heuristic evaluation, Cognitive walkthrough, Field studies', 'User centered design, Object Action Model, Task matrix, Data gathering techniques, Low level prototyping', 'Principles and categories, Key design elements, Universal usability, Accessibility, Top 10 mistakes in web design', 'Different forms of user information, Impact and cost of poor quality user information, Online help, System messages', 'Design principles for mobile, Key elements, Approaches to ensure usability, Context of use', 'Course review'),
(2, 'Dynamic Web Development', 'The HTTP Request/Response cycle, Apache, MySQL/MariaDB and PHP', 'Where to write PHP code, Syntax, Variables, Functions, Arrays, Conditions, Loops', 'PHP Variable scoping, Include files, HTML forms, Cookies and sessions', 'Why use a DB?, MySQL, Connecting to MySQL from PHP', 'Database security and permissions, SQL injection, User Authentication', 'Client-side coding', 'Encapsulation, inheritance, polymorphism in PHP and JS', 'Representing data using XML, DTD, XML Document Object Model (DOM)', 'JSON - JavaScript Object Notation, Using XmlHttpRequest and AJAX to communicate with the server', 'RESTful APIs', 'Common web vulnerabilities and how to fix them', 'Course review');

-- --------------------------------------------------------

--
-- Table structure for table `course_program`
--

CREATE TABLE `course_program` (
  `uniqueID` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_program`
--

INSERT INTO `course_program` (`uniqueID`, `course_id`, `program_id`) VALUES
(1, 2, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `programID` int(11) NOT NULL,
  `program_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`programID`, `program_name`) VALUES
(1, 'Bachelors of IT'),
(2, 'Master of IT');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `student_name` text DEFAULT NULL,
  `student_email` text DEFAULT NULL,
  `student_college` text DEFAULT NULL,
  `student_program` text DEFAULT NULL,
  `student_file` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_name`, `student_email`, `student_college`, `student_program`, `student_file`) VALUES
(5, 'Rhit Manandhar', 'manandharhit@gmail.com', '1', 'Bachelors of IT', 0x53616d706c6520436f757273652e706466);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`college_id`);

--
-- Indexes for table `college_program`
--
ALTER TABLE `college_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_collegeID` (`college_id`),
  ADD KEY `FK_programID` (`program_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `course_program`
--
ALTER TABLE `course_program`
  ADD PRIMARY KEY (`uniqueID`),
  ADD KEY `FK_course` (`course_id`),
  ADD KEY `FK_program` (`program_id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`programID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `college`
--
ALTER TABLE `college`
  MODIFY `college_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `college_program`
--
ALTER TABLE `college_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_program`
--
ALTER TABLE `course_program`
  MODIFY `uniqueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `programID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `college_program`
--
ALTER TABLE `college_program`
  ADD CONSTRAINT `FK_collegeID` FOREIGN KEY (`college_id`) REFERENCES `college` (`college_id`),
  ADD CONSTRAINT `FK_programID` FOREIGN KEY (`program_id`) REFERENCES `program` (`programID`);

--
-- Constraints for table `course_program`
--
ALTER TABLE `course_program`
  ADD CONSTRAINT `FK_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `FK_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`programID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
