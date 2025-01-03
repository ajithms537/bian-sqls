CREATE DATABASE IF NOT EXISTS `ach_operations_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ach_operations_db`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

-- Drop tables if they exist
DROP TABLE IF EXISTS `reconciliation`;
DROP TABLE IF EXISTS `clearing_and_settlement`;
DROP TABLE IF EXISTS `warehousing`;
DROP TABLE IF EXISTS `outbound_ach`;
DROP TABLE IF EXISTS `inbound_ach`;
DROP TABLE IF EXISTS `ach_operations`;

-- Table 1: ACH Operations
CREATE TABLE `ach_operations` (
  `ach_operations_id` INT AUTO_INCREMENT NOT NULL,
  `operating_schedule` JSON DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ach_operations_id`)
);

-- Table 2: Inbound ACH
CREATE TABLE `inbound_ach` (
  `inbound_ach_id` INT AUTO_INCREMENT NOT NULL,
  `ach_operations_id` INT NOT NULL,
  `transaction_batch` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inbound_ach_id`),
  FOREIGN KEY (`ach_operations_id`) REFERENCES `ach_operations` (`ach_operations_id`) ON DELETE CASCADE
);

-- Table 3: Outbound ACH
CREATE TABLE `outbound_ach` (
  `outbound_ach_id` INT AUTO_INCREMENT NOT NULL,
  `ach_operations_id` INT NOT NULL,
  `transaction_batch` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`outbound_ach_id`),
  FOREIGN KEY (`ach_operations_id`) REFERENCES `ach_operations` (`ach_operations_id`) ON DELETE CASCADE
);

-- Table 4: Warehousing
CREATE TABLE `warehousing` (
  `warehousing_id` INT AUTO_INCREMENT NOT NULL,
  `ach_operations_id` INT NOT NULL,
  `transaction_batch` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`warehousing_id`),
  FOREIGN KEY (`ach_operations_id`) REFERENCES `ach_operations` (`ach_operations_id`) ON DELETE CASCADE
);

-- Table 5: Clearing and Settlement
CREATE TABLE `clearing_and_settlement` (
  `clearing_and_settlement_id` INT AUTO_INCREMENT NOT NULL,
  `ach_operations_id` INT NOT NULL,
  `transaction_batch` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`clearing_and_settlement_id`),
  FOREIGN KEY (`ach_operations_id`) REFERENCES `ach_operations` (`ach_operations_id`) ON DELETE CASCADE
);

-- Table 6: Reconciliation
CREATE TABLE `reconciliation` (
  `reconciliation_id` INT AUTO_INCREMENT NOT NULL,
  `ach_operations_id` INT NOT NULL,
  `transaction_batch` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reconciliation_id`),
  FOREIGN KEY (`ach_operations_id`) REFERENCES `ach_operations` (`ach_operations_id`) ON DELETE CASCADE
);

/*!40101 SET character_set_client = @saved_cs_client */;