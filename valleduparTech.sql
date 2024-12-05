-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2023 at 09:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `valledupar_tech`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nombre`, `correo`, `avatar`, `pass`) VALUES
(1, 'abdo', 'abdo@gmail.com', 'logo after 3d_2.png', '$2y$10$M/A/r5j/GSeJrAZxI8NtRu9eG5yNltfgTrfQVoClfSIF/pzNUXa2W');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `marcas` (
  `id_marcas` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `marcas` (`id_marcas`, `titulo`) VALUES
(1, 'Canon'),
(2, 'Lenovo'),
(3, 'Sony'),
(4, 'Dell'),
(5, 'Asus'),
(6, 'Hp'),
(7, 'Apple'),
(8, 'Xiaomi'),
(9, 'Other'),
(10, 'Samsung'),
(13, 'Nokia');

-- --------------------------------------------------------

--
-- Table structure for table `card_details`
--

CREATE TABLE `detalles_tarjeta` (
  `id_detalles` int(11) NOT NULL,
  `direccion_ip` varchar(255) NOT NULL,
  `cantidad` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `titulo_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categoria` (`id_categoria`, `titulo_categoria`) VALUES
(1, 'Mobiles'),
(2, 'Tables'),
(3, 'Computadores'),
(4, 'SmartWatch'),
(5, 'Auriculares'),
(6, 'Electronics'),
(7, 'Accessorios');

-- --------------------------------------------------------

--
-- Table structure for table `orders_pending`
--

CREATE TABLE `orden_pendiente` (
  `id_orden_pen` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `numero_factura` int(255) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(255) NOT NULL,
  `estado_orden` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_pending`
--

INSERT INTO `orden_pendiente` (`id_orden_pen`, `id_usuario`, `numero_factura`, `id_producto`, `cantidad`, `estado_orden`) VALUES
(1, 1, 312346784, 1, 3, 'pendiente'),
(2, 1, 312346784, 2, 1, 'pendiente'),
(3, 1, 312346784, 4, 1, 'pendiente'),
(4, 1, 1918753782, 3, 2, 'pendiente'),
(5, 1, 351837813, 1, 2, 'pendiente');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `titulo_producto` varchar(120) NOT NULL,
  `descripcion_producto` varchar(255) NOT NULL,
  `keywords_producto` varchar(255) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `id_marcas` int(11) NOT NULL,
  `imagen_producto_uno` varchar(255) NOT NULL,
  `imagen_producto_dos` varchar(255) NOT NULL,
  `imagen_producto_tres` varchar(255) NOT NULL,
  `precio_producto` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `producto` (`id_producto`, `titulo_producto`, `descripcion_producto`, `keywords_producto`, `categoria_id`, `id_marcas`, `imagen_producto_uno`, `imagen_producto_dos`, `imagen_producto_tres`, `precio_producto`, `fecha`, `estado`) VALUES
(1, 'HAVIT HV-G92 Gamepad', 'allows you to use the familiar layout and buttons to enjoy console control when playing games on your PC The Havit HV-G92 also has multiple game profiles for pressure and controller settings', 'gamepad , havit , hv-g92 , logistech', 6, 9, 'havit1.png', 'havit2.png', 'havit1.png', 120, '2023-08-29 18:05:15', 'true'),
(2, 'ASUS FHD Gaming Laptop', 'Laptop ASUS TUF Gaming F15 FX506HF-HN001W(11th Intel® Core™ i5 11400H - Ram 8GB - Hard 512 GB SSD - GPU Nvidia Geforce RTX™ 2050 4GB - Display 15.6 4k', 'Laptop , gaming , asus , intell 11', 6, 2, 'lap1.png', 'lap2.png', 'lap3.png', 700, '2023-10-25 02:06:58', 'true'),
(3, 'CANON EOS DSLR Camera', 'High Image Quality with 32.5 Megapixel CMOS (APS-C) Sensor DIGIC 8 Image Processor. High-Speed Continuous Shooting of up to 10 fps with no Time Lag during OVF Shooting. 4K (UHD) 30fps / FHD 120fps Video', 'Canon, camera , high quality, 4k', 6, 1, 'camera1.png', 'camera2.png', 'camera3.png', 380, '2023-08-29 18:13:22', 'true'),
(4, 'Breed Dry Dog Food', 'Chicken, chicken by-product meal, corn, wheat, chicken fat, ground grain sorghum, natural flavors, dried plain beet pulp, egg product, potassium chloride, sodium hexametaphosphate, salt, cat food, dog food', 'food, dog food, cat food', 3, 9, 'food1.png', 'food2.png', 'food3.png', 100, '2023-10-25 01:41:31', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `orden_usuario` (
  `id_orden` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `cantidad_adecuada` int(255) NOT NULL,
  `numero_factura` int(255) NOT NULL,
  `total_productos` int(255) NOT NULL,
  `fecha_orden` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado_orden` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `orden_usuario` (`id_orden`, `id_usuario`, `cantidad_adecuada`, `numero_factura`, `total_productos`, `fecha_orden`, `estado_orden`) VALUES
(1, 1, 1160, 312346784, 3, '2023-10-22 15:31:20', 'paid'),
(2, 1, 760, 1918753782, 1, '2023-10-24 00:25:10', 'pending'),
(3, 1, 240, 351837813, 1, '2023-10-24 18:41:02', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `user_payments`
--

CREATE TABLE `pago_usuario` (
  `id_pago` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `metodo_pago` varchar(255) NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pago_usuario`
--

INSERT INTO `pago_usuario` (`id_pago`, `id_orden`, `numero_factura`, `monto`, `metodo_pago`, `fecha_pago`) VALUES
(1, 1, 312346784, 1160, 'paypal', '2023-10-24 00:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_tabl`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `correo_usuario` varchar(100) NOT NULL,
  `pass_usuario` varchar(255) NOT NULL,
  `imagen_usuario` varchar(255) NOT NULL,
  `ip_usuario` varchar(100) NOT NULL,
  `direccion_usuario` varchar(255) NOT NULL,
  `movil_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tabl`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `correo_usuario`, `pass_usuario`, `imagen_usuario`, `ip_usuario`, `direccion_usuario`, `movil_usuario`) VALUES
(1, 'abdo', 'abdo@gmail.com', '$2y$10$5ynby9fq7wf2ZmHlkvehu.JGbK6r7zZLtLzuJz9Jt5FP03rGZ9Mj.', 'new logo after Edit1920.png', '::1', 'Cairo', '123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `brands`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marcas`);

--
-- Indexes for table `card_details`
--
ALTER TABLE `detalles_tarjeta`
  ADD PRIMARY KEY (`id_detalles`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `orders_pending`
--
ALTER TABLE `orden_pendiente`
  ADD PRIMARY KEY (`id_orden_pen`);

--
-- Indexes for table `products`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `orden_usuario`
  ADD PRIMARY KEY (`id_orden`);

--
-- Indexes for table `pago_usuario`
--
ALTER TABLE `pago_usuario`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `marcas`
  MODIFY `id_marcas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders_pending`
--
ALTER TABLE `orden_pendiente`
  MODIFY `id_orden_pen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `orden_usuario`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_payments`
--
ALTER TABLE `pago_usuario`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;