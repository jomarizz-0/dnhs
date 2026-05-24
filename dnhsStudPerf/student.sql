-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2026 at 02:02 PM
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
-- Database: `dnhs_stud_perf_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stud_lrn` char(12) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birth_date` date NOT NULL,
  `address_barangay` varchar(100) NOT NULL,
  `address_municipality` varchar(100) NOT NULL,
  `personnel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stud_lrn`, `first_name`, `middle_name`, `last_name`, `gender`, `birth_date`, `address_barangay`, `address_municipality`, `personnel_id`) VALUES
('20260001', 'Aljon', 'Belen', 'Borja', 'Male', '2008-03-14', 'Gogon', 'Legazpi', 1025),
('20260002', 'Maria Salve', '', 'Reondanga', 'Female', '2007-11-09', 'Cruzada', 'Legazpi', 1025),
('20260003', 'John Paul', 'Mirasol', 'Imperial', 'Male', '2008-06-21', 'Bitano', 'Legazpi', 1025),
('20260004', 'Rica', 'Belleza', 'Baldoza', 'Female', '2007-01-30', 'Bonot', 'Legazpi', 1025),
('20260005', 'Jerico', 'Dela Cruz', 'Bañares', 'Male', '2008-09-12', 'Rawis', 'Legazpi', 1025),
('20260006', 'Angelica', 'Nuñez', 'Ariola', 'Female', '2007-04-18', 'EM\'s Barrio', 'Legazpi', 1025),
('20260007', 'Marvin', 'Toledo', 'Berces', 'Male', '2008-12-05', 'Puro', 'Legazpi', 1025),
('20260008', 'Christine', 'Llorin', 'Bardon', 'Female', '2007-07-27', 'Ilawod West', 'Legazpi', 1025),
('20260009', 'Renz', 'Pajarillo', 'Belleza', 'Male', '2008-02-11', 'Market Site', 'Daraga', 1025),
('20260010', 'Jessa', 'Ofrin', 'Rabino', 'Female', '2007-10-03', 'San Roque', 'Daraga', 1025),
('20260011', 'Mark Anthony', 'Fajardo', 'Resurreccion', 'Male', '2008-05-19', 'Kimantong', 'Daraga', 1025),
('20260012', 'Princess', 'Llaguno', 'Romano', 'Female', '2007-08-26', 'Binitayan', 'Daraga', 1025),
('20260013', 'Carlo', 'Belleza', 'Biazon', 'Male', '2008-01-15', 'Cullat', 'Daraga', 1025),
('20260014', 'Hazel', 'Oasay', 'Balce', 'Female', '2007-12-08', 'Bascaran', 'Daraga', 1025),
('20260015', 'Nathaniel', 'Perdigon', 'Barrios', 'Male', '2008-04-02', 'Busay', 'Daraga', 1025),
('20260016', 'Sheila', 'Corvera', 'Buenafe', 'Female', '2007-06-17', 'Mi-isi', 'Daraga', 1025),
('20260017', 'Vincent', 'Paner', 'Briones', 'Male', '2008-11-24', 'Anislag', 'Daraga', 1025),
('20260018', 'Kyla', 'Mae', 'Abad', 'Female', '2007-05-12', 'Albay District', 'Legazpi', 1025),
('20260019', 'Joshua', 'Reyes', 'Alegre', 'Male', '2008-08-25', 'Arimbay', 'Legazpi', 1025),
('20260020', 'Beatrix', 'Lara', 'Baldo', 'Female', '2007-12-01', 'Bagong Abre', 'Legazpi', 1025),
('20260021', 'Christian', 'Paul', 'Calleja', 'Male', '2008-01-15', 'Banquerohan', 'Legazpi', 1025),
('20260022', 'Dianne', 'Grace', 'Diaz', 'Female', '2007-09-18', 'Binanuahan', 'Legazpi', 1025),
('20260023', 'Ethan', 'James', 'Espinas', 'Male', '2008-02-28', 'Bogtong', 'Legazpi', 1025),
('20260024', 'Fiona', 'Rose', 'Floranza', 'Female', '2007-03-10', 'Capantawan', 'Legazpi', 1025),
('20260025', 'Gabriel', 'Ivan', 'Garcia', 'Male', '2008-11-20', 'Dap-dap', 'Legazpi', 1025),
('20260026', 'Hannah', 'Nicole', 'Hernandez', 'Female', '2007-06-05', 'Homapon', 'Legazpi', 1025),
('20260027', 'Ian', 'Gabriel', 'Ibañez', 'Male', '2008-04-14', 'Mabinit', 'Legazpi', 1025),
('20260028', 'Jasmine', 'Joy', 'Jimenez', 'Female', '2007-10-30', 'Oro Site', 'Legazpi', 1025),
('20260029', 'Kevin', 'Lee', 'Luces', 'Male', '2008-07-22', 'Pawa', 'Legazpi', 1025),
('20260030', 'Lianne', 'Marie', 'Millena', 'Female', '2007-01-08', 'Sagpon', 'Legazpi', 1025),
('20260031', 'Marcus', 'Anton', 'Nimo', 'Male', '2008-05-19', 'Tula-tula', 'Legazpi', 1025),
('20260032', 'Nathalie', 'Hope', 'Orea', 'Female', '2007-08-11', 'Bañag', 'Daraga', 1025),
('20260033', 'Oliver', 'Grant', 'Paguia', 'Male', '2008-03-27', 'Bagumbayan', 'Daraga', 1025),
('20260034', 'Patricia', 'Ann', 'Quintana', 'Female', '2007-11-04', 'Canlubang', 'Daraga', 1025),
('20260035', 'Quentin', 'Xavier', 'Ramos', 'Male', '2008-06-15', 'Dinoronan', 'Daraga', 1025),
('20260036', 'Rochelle', 'Mae', 'Sayson', 'Female', '2007-02-21', 'Gabawan', 'Daraga', 1011),
('20260037', 'Samuel', 'David', 'Tuazon', 'Male', '2008-09-09', 'Inarado', 'Daraga', 1011),
('20260038', 'Trisha', 'Gail', 'Vallarez', 'Female', '2007-04-17', 'Kilicao', 'Daraga', 1011),
('20260039', 'Ulysses', 'Cesar', 'Zamora', 'Male', '2008-10-02', 'Malabog', 'Daraga', 1011),
('20260040', 'Vanessa', 'C.', 'Almayda', 'Female', '2007-07-24', 'Matnog', 'Daraga', 1011),
('20260041', 'Wyatt', 'Ross', 'Basabe', 'Male', '2008-12-30', 'Salvacion', 'Daraga', 1011),
('20260042', 'Xandra', 'Yvonne', 'Cardano', 'Female', '2007-05-13', 'Tagas', 'Daraga', 1011),
('20260043', 'Yusuf', 'Ali', 'Dioneda', 'Male', '2008-01-22', 'Anislag', 'Daraga', 1011),
('20260044', 'Zoe', 'Isabelle', 'Estipona', 'Female', '2007-08-04', 'Binitayan', 'Daraga', 1011),
('20260045', 'Aidan', 'Drake', 'Frondoza', 'Male', '2008-04-19', 'Busay', 'Daraga', 1011),
('20260046', 'Brianna', 'Claire', 'Goyena', 'Female', '2007-03-29', 'Cullat', 'Daraga', 1011),
('20260047', 'Cedrick', 'John', 'Honrado', 'Male', '2008-11-11', 'Inarado', 'Daraga', 1011),
('20260048', 'Danica', 'Faye', 'Icaro', 'Female', '2007-06-18', 'Kimantong', 'Daraga', 1011),
('20260049', 'Elijah', 'Kent', 'Jalmanzar', 'Male', '2008-02-05', 'Lacag', 'Daraga', 1011),
('20260050', 'Francine', 'G.', 'Lanuza', 'Female', '2007-10-12', 'Malabog', 'Daraga', 1011),
('20260051', 'Gerald', 'M.', 'Manansala', 'Male', '2008-07-31', 'Matnog', 'Daraga', 1011),
('20260052', 'Hazel', 'Anne', 'Navarro', 'Female', '2007-01-25', 'Mayon', 'Daraga', 1011),
('20260053', 'Isaac', 'Newton', 'Ocampo', 'Male', '2008-05-08', 'Pandora', 'Daraga', 1011),
('20260054', 'Juliana', 'Marie', 'Perez', 'Female', '2007-08-16', 'Peñafrancia', 'Daraga', 1011),
('20260055', 'Kurt', 'Russell', 'Quinto', 'Male', '2008-03-03', 'Sagpon', 'Daraga', 1011),
('20260056', 'Leila', 'Sofia', 'Reyes', 'Female', '2007-12-28', 'Salvacion', 'Daraga', 1011),
('20260057', 'Nathan', 'Jake', 'Santos', 'Male', '2008-06-10', 'San Roque', 'Daraga', 1011),
('20260058', 'Olivia', 'Kate', 'Tiongson', 'Female', '2007-02-14', 'Tagas', 'Daraga', 1011),
('20260059', 'Patrick', 'Star', 'Ubaldo', 'Male', '2008-09-20', 'Villahermosa', 'Daraga', 1011),
('20260060', 'Queenie', 'Rose', 'Valdez', 'Female', '2007-04-26', 'Bascaran', 'Daraga', 1011),
('20260061', 'Renz', 'Mikel', 'Wong', 'Male', '2008-10-15', 'Bogtong', 'Legazpi', 1011),
('20260062', 'Sofia', 'Bianca', 'Yanto', 'Female', '2007-07-01', 'Gogon', 'Legazpi', 1011),
('20260063', 'Tyler', 'Durden', 'Zuniga', 'Male', '2008-12-05', 'Rawis', 'Legazpi', 1011),
('20260064', 'Abigail', 'Mae', 'Arandia', 'Female', '2007-05-19', 'Bitano', 'Legazpi', 1011),
('20260065', 'Brandon', 'Cole', 'Belmonte', 'Male', '2008-01-30', 'Bonot', 'Legazpi', 1011),
('20260066', 'Chloe', 'Isabel', 'Casas', 'Female', '2007-08-22', 'Cruzada', 'Legazpi', 1011),
('20260067', 'Dominic', 'Savio', 'Dela Torre', 'Male', '2008-04-10', 'Dap-dap', 'Legazpi', 1011),
('20260068', 'Erica', 'Jane', 'Flores', 'Female', '2007-03-05', 'Ilawod', 'Legazpi', 1011),
('20260069', 'Felix', 'The Cat', 'Gomez', 'Male', '2008-11-27', 'Maoyod', 'Legazpi', 1011),
('20260070', 'Giselle', 'Lao', 'Hidalgo', 'Female', '2007-06-14', 'Pinaric', 'Legazpi', 1011);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stud_lrn`),
  ADD KEY `Student_FK2` (`personnel_id`),
  ADD KEY `idx_student_name` (`last_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `Student_FK2` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
