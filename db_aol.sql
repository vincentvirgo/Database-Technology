-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2024 at 03:42 PM
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
-- Database: `db_aol`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` char(5) NOT NULL CHECK (`CustomerID` regexp '^C[0-9]{3}$'),
  `CustomerName` varchar(50) NOT NULL,
  `CustomerAddress` varchar(100) NOT NULL,
  `CustomerEmail` varchar(50) NOT NULL,
  `CustomerType` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `CustomerName`, `CustomerAddress`, `CustomerEmail`, `CustomerType`) VALUES
('C001', 'PT Antareja Logistik', 'Jakarta, Indonesia', 'info@antareja-logistics.com', 'Business'),
('C002', 'Muhammad Rizky Pratama', 'Semarang, Indonesia', 'muhammad_rizky@gmail.com', 'Individual'),
('C003', 'Teguh Saputra', 'Yogyakarta, Indonesia', 'teguh_saputra@gmail.com', 'Individual'),
('C004', 'Sulaiman Tariq', 'Semarang, Indonesia', 'sulaiman_tariq@gmail.com', 'Individual'),
('C005', 'Indah Sari', 'Jakarta, Indonesia', 'indah_sari@gmail.com', 'Individual'),
('C006', 'Rendy Cahyadi', 'Bandung, Indonesia', 'rendy_cahyadi@gmail.com', 'Individual');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `DeliveryID` char(4) NOT NULL CHECK (`DeliveryID` regexp '^D[0-9]{3}$'),
  `OrderID` char(6) NOT NULL CHECK (`OrderID` regexp '^ORD[0-9]{3}$'),
  `DeliveryDate` date NOT NULL,
  `DeliveryStatus` varchar(15) NOT NULL,
  `WarehouseID` char(4) NOT NULL CHECK (`WarehouseID` regexp '^WH[0-9]{2}$'),
  `DriverID` char(5) NOT NULL CHECK (`DriverID` regexp '^DR[0-9]{3}$'),
  `ShippingDetails` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`DeliveryID`, `OrderID`, `DeliveryDate`, `DeliveryStatus`, `WarehouseID`, `DriverID`, `ShippingDetails`) VALUES
('D001', 'ORD001', '2024-11-03', 'Pending', 'WH01', 'DR001', 'Packed, Shipped'),
('D002', 'ORD002', '2024-11-04', 'Delivered', 'WH02', 'DR002', 'Packed, Delivered'),
('D003', 'ORD003', '2024-11-05', 'Pending', 'WH03', 'DR003', 'Packed, Delivered'),
('D004', 'ORD004', '2024-11-06', 'Pending', 'WH02', 'DR004', 'Packed, Shipped'),
('D005', 'ORD005', '2024-11-07', 'Pending', 'WH01', 'DR005', 'Packed, Delivered'),
('D006', 'ORD006', '2024-11-08', 'In Transit', 'WH04', 'DR002', 'Packed, Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `DriverID` char(5) NOT NULL CHECK (`DriverID` regexp '^DR[0-9]{3}$'),
  `DriverName` varchar(50) NOT NULL,
  `DriverPhone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`DriverID`, `DriverName`, `DriverPhone`) VALUES
('DR001', 'Aditya Pratama', '+62 812-3456-7890'),
('DR002', 'Rizky Maulana', '+62 812-7896-5432'),
('DR003', 'Putri Andini', '+62 821-3456-7891'),
('DR004', 'Budi Santoso', '+62 813-4567-8912'),
('DR005', 'Dewi Kartika', '+ 62 819-8765-4321'),
('DR006', 'Fajar Rahman', '+62 821-7654-3210');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` char(6) NOT NULL CHECK (`OrderID` regexp '^ORD[0-9]{3}$'),
  `OrderDate` date NOT NULL,
  `CustomerID` char(5) NOT NULL CHECK (`CustomerID` regexp '^C[0-9]{3}$'),
  `PaymentMethod` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `OrderDate`, `CustomerID`, `PaymentMethod`) VALUES
('ORD001', '2024-11-01', 'C001', 'Bank Transfer'),
('ORD002', '2024-11-02', 'C002', 'Cash'),
('ORD003', '2024-11-03', 'C003', 'Cash'),
('ORD004', '2024-11-04', 'C004', 'Bank Transfer'),
('ORD005', '2024-11-05', 'C005', 'Cash'),
('ORD006', '2024-11-06', 'C006', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `OrderID` char(6) NOT NULL CHECK (`OrderID` regexp '^ORD[0-9]{3}$'),
  `ProductID` char(5) NOT NULL CHECK (`ProductID` regexp '^PR[0-9]{3}$'),
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `TotalPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`OrderID`, `ProductID`, `Quantity`, `Price`, `TotalPrice`) VALUES
('ORD001', 'PR001', 62, 50000, 3100000),
('ORD001', 'PR002', 80, 13000, 1040000),
('ORD001', 'PR003', 82, 29000, 2378000),
('ORD002', 'PR001', 99, 50000, 4950000),
('ORD002', 'PR002', 100, 13000, 1300000),
('ORD002', 'PR003', 29, 29000, 841000),
('ORD003', 'PR001', 39, 50000, 1950000),
('ORD004', 'PR002', 60, 13000, 780000),
('ORD005', 'PR002', 59, 13000, 767000),
('ORD005', 'PR003', 58, 29000, 1682000),
('ORD006', 'PR002', 98, 13000, 1274000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` char(5) NOT NULL CHECK (`ProductID` regexp '^PR[0-9]{3}$'),
  `ProductName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`) VALUES
('PR001', 'Beras'),
('PR002', 'Jagung'),
('PR003', 'Kopi');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `WarehouseID` char(4) NOT NULL CHECK (`WarehouseID` regexp '^WH[0-9]{2}$'),
  `WarehouseLocation` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`WarehouseID`, `WarehouseLocation`) VALUES
('WH01', 'Jakarta, Indonesia'),
('WH02', 'Semarang, Indonesia'),
('WH03', 'Yogyakarta, Indonesia'),
('WH04', 'Bandung, Indonesia'),
('WH05', 'Surabaya, Indonesia'),
('WH06', 'Medan, Indonesia'),
('WH07', 'Makassar, Indonesia'),
('WH08', 'Denpasar, Indonesia'),
('WH09', 'Balikpapan, Indonesia'),
('WH10', 'Palembang, Indonesia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`DeliveryID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `DriverID` (`DriverID`),
  ADD KEY `WarehouseID` (`WarehouseID`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`DriverID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`WarehouseID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`DriverID`) REFERENCES `drivers` (`DriverID`),
  ADD CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
