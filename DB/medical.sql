-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2024 at 09:23 AM
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
-- Database: `medical`
--

-- --------------------------------------------------------

--
-- Table structure for table `app1_appointment`
--

CREATE TABLE `app1_appointment` (
  `appid` int(11) NOT NULL,
  `appmadeon` date NOT NULL,
  `appdate` date NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app1_appointment`
--

INSERT INTO `app1_appointment` (`appid`, `appmadeon`, `appdate`, `doctor_id`, `patient_id`) VALUES
(1, '2024-05-22', '2024-05-26', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `app1_department`
--

CREATE TABLE `app1_department` (
  `deptid` int(11) NOT NULL,
  `deptname` varchar(255) NOT NULL,
  `deptdesc` longtext NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app1_department`
--

INSERT INTO `app1_department` (`deptid`, `deptname`, `deptdesc`, `image`) VALUES
(1, 'Cardiology', 'Cardiology is the study of the heart. Cardiology is a branch of medicine that deals with disorders of the heart and the cardiovascular system. The field includes medical diagnosis and treatment of congenital heart defects, coronary artery disease, heart failure, valvular heart disease, and electrophysiology.', 'dept_img/Screenshot_2024-05-16_125720.png'),
(2, 'Gastroenterology', 'Gastroenterology is the branch of medicine focused on the digestive system and its disorders. The digestive system consists of the gastrointestinal tract, sometimes referred to as the GI tract,', 'dept_img/Screenshot_2024-05-21_125807.png');

-- --------------------------------------------------------

--
-- Table structure for table `app1_doctor`
--

CREATE TABLE `app1_doctor` (
  `did` int(11) NOT NULL,
  `dname` varchar(150) NOT NULL,
  `dqua` varchar(255) NOT NULL,
  `aboutdoc` longtext NOT NULL,
  `dspec` varchar(255) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app1_doctor`
--

INSERT INTO `app1_doctor` (`did`, `dname`, `dqua`, `aboutdoc`, `dspec`, `dept_id`) VALUES
(1, 'S Sandhuka', 'MBBS', '..sd,sd ,. sd., sd', 'MD, MS', 2),
(2, 'Rahul Debnath', 'MBBS', 'slksd lklsdafn', 'MD, MS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app1_pataient`
--

CREATE TABLE `app1_pataient` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `age` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app1_pataient`
--

INSERT INTO `app1_pataient` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `gender`, `mobile`, `age`) VALUES
(1, 'pbkdf2_sha256$600000$MY2DNq1rdyawpr2iRrPjXY$f8+9r6fhtgwq5XDV8YB3sgyOSSVbZ85Fm1VFVl0fUZc=', '2024-05-22 07:05:30.205961', 1, 'admin', '', '', 'saumitra@euphoriagenx.com', 1, 1, '2024-05-21 05:28:42.671981', '', '', ''),
(2, 'pbkdf2_sha256$600000$gt6xehEuMHLpRzxsuK7JGc$etXtrodtuncgCIkL3LoqivGDG9I8/2SpP+ZQwzMUDU8=', '2024-05-22 07:16:19.800094', 0, 'saumitra', 'Saumitra', 'Das', 'sau@gmail.com', 0, 1, '2024-05-22 07:15:42.363761', 'Male', '9876543210', '20');

-- --------------------------------------------------------

--
-- Table structure for table `app1_pataient_groups`
--

CREATE TABLE `app1_pataient_groups` (
  `id` bigint(20) NOT NULL,
  `pataient_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app1_pataient_user_permissions`
--

CREATE TABLE `app1_pataient_user_permissions` (
  `id` bigint(20) NOT NULL,
  `pataient_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app1_schedule`
--

CREATE TABLE `app1_schedule` (
  `sid` int(11) NOT NULL,
  `days` varchar(200) NOT NULL,
  `t_slot` varchar(200) NOT NULL,
  `noofpp` varchar(2) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app1_schedule`
--

INSERT INTO `app1_schedule` (`sid`, `days`, `t_slot`, `noofpp`, `doctor_id`) VALUES
(1, 'Sunday', '3:00 PM to 5:00 PM', '20', 2),
(2, 'Saturday', '7:30PM to 9:00PM', '15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add doctor', 1, 'add_doctor'),
(2, 'Can change doctor', 1, 'change_doctor'),
(3, 'Can delete doctor', 1, 'delete_doctor'),
(4, 'Can view doctor', 1, 'view_doctor'),
(5, 'Can add schedule', 2, 'add_schedule'),
(6, 'Can change schedule', 2, 'change_schedule'),
(7, 'Can delete schedule', 2, 'delete_schedule'),
(8, 'Can view schedule', 2, 'view_schedule'),
(9, 'Can add user', 3, 'add_pataient'),
(10, 'Can change user', 3, 'change_pataient'),
(11, 'Can delete user', 3, 'delete_pataient'),
(12, 'Can view user', 3, 'view_pataient'),
(13, 'Can add department', 4, 'add_department'),
(14, 'Can change department', 4, 'change_department'),
(15, 'Can delete department', 4, 'delete_department'),
(16, 'Can view department', 4, 'view_department'),
(17, 'Can add appointment', 5, 'add_appointment'),
(18, 'Can change appointment', 5, 'change_appointment'),
(19, 'Can delete appointment', 5, 'delete_appointment'),
(20, 'Can view appointment', 5, 'view_appointment'),
(21, 'Can add log entry', 6, 'add_logentry'),
(22, 'Can change log entry', 6, 'change_logentry'),
(23, 'Can delete log entry', 6, 'delete_logentry'),
(24, 'Can view log entry', 6, 'view_logentry'),
(25, 'Can add permission', 7, 'add_permission'),
(26, 'Can change permission', 7, 'change_permission'),
(27, 'Can delete permission', 7, 'delete_permission'),
(28, 'Can view permission', 7, 'view_permission'),
(29, 'Can add group', 8, 'add_group'),
(30, 'Can change group', 8, 'change_group'),
(31, 'Can delete group', 8, 'delete_group'),
(32, 'Can view group', 8, 'view_group'),
(33, 'Can add content type', 9, 'add_contenttype'),
(34, 'Can change content type', 9, 'change_contenttype'),
(35, 'Can delete content type', 9, 'delete_contenttype'),
(36, 'Can view content type', 9, 'view_contenttype'),
(37, 'Can add session', 10, 'add_session'),
(38, 'Can change session', 10, 'change_session'),
(39, 'Can delete session', 10, 'delete_session'),
(40, 'Can view session', 10, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-05-22 07:06:55.788627', '1', 'Cardiology', 1, '[{\"added\": {}}]', 4, 1),
(2, '2024-05-22 07:08:50.998729', '2', 'Gastroenterology', 1, '[{\"added\": {}}]', 4, 1),
(3, '2024-05-22 07:09:58.983678', '1', 'S Sandhuka', 1, '[{\"added\": {}}]', 1, 1),
(4, '2024-05-22 07:10:36.202657', '2', 'Rahul Debnath', 1, '[{\"added\": {}}]', 1, 1),
(5, '2024-05-22 07:13:28.538552', '1', 'Schedule object (1)', 1, '[{\"added\": {}}]', 2, 1),
(6, '2024-05-22 07:14:19.358818', '2', 'Schedule object (2)', 1, '[{\"added\": {}}]', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'admin', 'logentry'),
(5, 'app1', 'appointment'),
(4, 'app1', 'department'),
(1, 'app1', 'doctor'),
(3, 'app1', 'pataient'),
(2, 'app1', 'schedule'),
(8, 'auth', 'group'),
(7, 'auth', 'permission'),
(9, 'contenttypes', 'contenttype'),
(10, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-05-21 05:27:15.520592'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-05-21 05:27:15.593303'),
(3, 'auth', '0001_initial', '2024-05-21 05:27:16.037199'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-05-21 05:27:16.133206'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-05-21 05:27:16.147208'),
(6, 'auth', '0004_alter_user_username_opts', '2024-05-21 05:27:16.160209'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-05-21 05:27:16.173211'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-05-21 05:27:16.178210'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-05-21 05:27:16.192211'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-05-21 05:27:16.208213'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-05-21 05:27:16.224216'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-05-21 05:27:16.250215'),
(13, 'auth', '0011_update_proxy_permissions', '2024-05-21 05:27:16.291217'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-05-21 05:27:16.316219'),
(15, 'app1', '0001_initial', '2024-05-21 05:27:16.892959'),
(16, 'admin', '0001_initial', '2024-05-21 05:27:17.086357'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-05-21 05:27:17.100356'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-21 05:27:17.113137'),
(19, 'app1', '0002_department_alter_pataient_gender_doctor_dept', '2024-05-21 05:27:17.236279'),
(20, 'app1', '0003_appointment', '2024-05-21 05:27:17.509785'),
(21, 'app1', '0004_department_image', '2024-05-21 05:27:17.542508'),
(22, 'sessions', '0001_initial', '2024-05-21 05:27:17.603512');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app1_appointment`
--
ALTER TABLE `app1_appointment`
  ADD PRIMARY KEY (`appid`),
  ADD KEY `app1_appointment_doctor_id_23bf4c8d_fk_app1_doctor_did` (`doctor_id`),
  ADD KEY `app1_appointment_patient_id_560a6026_fk_app1_pataient_id` (`patient_id`);

--
-- Indexes for table `app1_department`
--
ALTER TABLE `app1_department`
  ADD PRIMARY KEY (`deptid`);

--
-- Indexes for table `app1_doctor`
--
ALTER TABLE `app1_doctor`
  ADD PRIMARY KEY (`did`),
  ADD KEY `app1_doctor_dept_id_83ebc278_fk_app1_department_deptid` (`dept_id`);

--
-- Indexes for table `app1_pataient`
--
ALTER TABLE `app1_pataient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `app1_pataient_groups`
--
ALTER TABLE `app1_pataient_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app1_pataient_groups_pataient_id_group_id_63485230_uniq` (`pataient_id`,`group_id`),
  ADD KEY `app1_pataient_groups_group_id_0bbdacb2_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `app1_pataient_user_permissions`
--
ALTER TABLE `app1_pataient_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app1_pataient_user_permi_pataient_id_permission_i_7c3fe1a8_uniq` (`pataient_id`,`permission_id`),
  ADD KEY `app1_pataient_user_p_permission_id_f223e2b5_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `app1_schedule`
--
ALTER TABLE `app1_schedule`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `app1_schedule_doctor_id_e0d2da95_fk_app1_doctor_did` (`doctor_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_app1_pataient_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app1_appointment`
--
ALTER TABLE `app1_appointment`
  MODIFY `appid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app1_department`
--
ALTER TABLE `app1_department`
  MODIFY `deptid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app1_doctor`
--
ALTER TABLE `app1_doctor`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app1_pataient`
--
ALTER TABLE `app1_pataient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app1_pataient_groups`
--
ALTER TABLE `app1_pataient_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app1_pataient_user_permissions`
--
ALTER TABLE `app1_pataient_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app1_schedule`
--
ALTER TABLE `app1_schedule`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app1_appointment`
--
ALTER TABLE `app1_appointment`
  ADD CONSTRAINT `app1_appointment_doctor_id_23bf4c8d_fk_app1_doctor_did` FOREIGN KEY (`doctor_id`) REFERENCES `app1_doctor` (`did`),
  ADD CONSTRAINT `app1_appointment_patient_id_560a6026_fk_app1_pataient_id` FOREIGN KEY (`patient_id`) REFERENCES `app1_pataient` (`id`);

--
-- Constraints for table `app1_doctor`
--
ALTER TABLE `app1_doctor`
  ADD CONSTRAINT `app1_doctor_dept_id_83ebc278_fk_app1_department_deptid` FOREIGN KEY (`dept_id`) REFERENCES `app1_department` (`deptid`);

--
-- Constraints for table `app1_pataient_groups`
--
ALTER TABLE `app1_pataient_groups`
  ADD CONSTRAINT `app1_pataient_groups_group_id_0bbdacb2_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `app1_pataient_groups_pataient_id_2a4f0c8b_fk_app1_pataient_id` FOREIGN KEY (`pataient_id`) REFERENCES `app1_pataient` (`id`);

--
-- Constraints for table `app1_pataient_user_permissions`
--
ALTER TABLE `app1_pataient_user_permissions`
  ADD CONSTRAINT `app1_pataient_user_p_pataient_id_97981ca9_fk_app1_pata` FOREIGN KEY (`pataient_id`) REFERENCES `app1_pataient` (`id`),
  ADD CONSTRAINT `app1_pataient_user_p_permission_id_f223e2b5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `app1_schedule`
--
ALTER TABLE `app1_schedule`
  ADD CONSTRAINT `app1_schedule_doctor_id_e0d2da95_fk_app1_doctor_did` FOREIGN KEY (`doctor_id`) REFERENCES `app1_doctor` (`did`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app1_pataient_id` FOREIGN KEY (`user_id`) REFERENCES `app1_pataient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
