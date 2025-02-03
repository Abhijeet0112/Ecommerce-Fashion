CREATE DATABASE  IF NOT EXISTS `ecommerce_fashion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce_fashion`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_fashion
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `type` enum('Men','Women','Boy','Girl') NOT NULL,
  `image_url` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (8,'Hoddies','\"Stay cozy and stylish with our women’s hoodies, crafted from premium, soft-touch fabrics for all-day comfort. Featuring a relaxed fit, adjustable drawstring hood, and spacious pockets, these hoodies are perfect for layering or lounging. Available in trendy colors and sizes, they’re the ideal mix of warmth and casual flair for any season.\"',450.00,'Men','https://images.pexels.com/photos/1666779/pexels-photo-1666779.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(9,'Hoddies','\"Elevate your casual style with our women’s hoodies, designed for ultimate comfort and fashion. Made from soft, durable fabric, these hoodies feature a cozy fit, adjustable drawstring hood, and practical pockets. Perfect for layering or lounging, they come in a variety of chic colors and sizes, offering the perfect blend of warmth and versatility.\"',450.00,'Boy','https://images.pexels.com/photos/1035692/pexels-photo-1035692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(10,'dungrees','\"Adorable and comfy, our little girls’ dungarees are perfect for playtime and outings. Crafted from soft, durable fabric, they feature adjustable straps, handy pockets, and a relaxed fit for all-day comfort. Available in vibrant colors and cute patterns, these dungarees are designed to keep your little one stylish and free to explore!\"',650.00,'Boy','https://images.pexels.com/photos/17710992/pexels-photo-17710992/free-photo-of-small-child-in-a-bucket-hat-and-dungarees-among-the-strawberry-beds-in-the-greenhouse.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(14,'Formal Shirt','Elevate your style with our premium formal shirt, crafted from high-quality fabric for unmatched comfort and durability. Featuring a classic fit, sharp collar, and crisp cuffs, it\'s perfect for office wear or formal occasions. Available in a range of versatile colors, this timeless piece ensures you look polished and professional. Pair it with trousers for a sophisticated ensemble.',599.00,'Men','https://images.unsplash.com/photo-1603252110481-7ba873bf42ab?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(15,'T-Shirt','Stay stylish and comfortable with our classic t-shirt, made from soft, breathable fabric for all-day ease. Designed with a modern fit and available in vibrant colors, it\'s perfect for casual outings, gym sessions, or lounging at home. Durable stitching ensures long-lasting wear. Pair it with jeans or shorts for a versatile, laid-back look. Your go-to essential for everyday style!',399.00,'Women','https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(16,'Casual T-Shirt','Turn heads at any casual party with our trendy party-wear t-shirt. Made from premium, breathable fabric, it features a modern slim fit and eye-catching patterns or prints to elevate your look. Perfect for pairing with jeans or chinos, this t-shirt combines comfort with style, ensuring you make a statement effortlessly. Step into the spotlight with confidence and flair!',299.00,'Boy','https://images.unsplash.com/photo-1716951988375-37d5793385d0?q=80&w=1990&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(17,'Sweat-Shirt','\"Stay cozy and stylish with our premium sweatshirt! Crafted from soft, breathable fabric, it’s perfect for everyday wear. Durable, versatile, and available in trendy colors for all seasons.\"',499.00,'Men','https://images.unsplash.com/photo-1562157873-818bc0726f68?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(18,'Jeans for Boy','\"Upgrade your style with our trendy boys\' jeans! Made from durable, stretchable denim, they offer maximum comfort and flexibility for everyday adventures. Featuring a slim-fit design, classic pockets, and a modern look, these jeans are perfect for casual outings or special occasions. Available in various washes to suit any vibe.\"',999.00,'Boy','https://images.unsplash.com/photo-1623120389902-6c846c80f4c8?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `rating` int NOT NULL,
  `comment` text,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (15,'Vikas Shinde',5,'average to good',8),(30,'ABHIJEET BHINGARDEVE',5,'Elevate your casual style with our women’s hoodies, designed for ultimate comfort and fashion. Made from soft, durable fabric, these hoodies feature a cozy fit, adjustable drawstring hood, and practical pockets. Perfect for layering or lounging, they come in a variety of chic colors and sizes, offering the perfect blend of warmth and versatility.',9),(33,'abhijeet bhingardeve',5,'Very Good And Comfortable',10),(34,'Dhiraj Kumar Prajapati',3,'good',9);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-31 14:34:10
