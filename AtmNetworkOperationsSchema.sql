CREATE DATABASE IF NOT EXISTS `atm_network_operations_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `atm_network_operations_db`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

-- Drop tables if they exist
DROP TABLE IF EXISTS `financial_transaction_capture`;
DROP TABLE IF EXISTS `financial_document_handling`;
DROP TABLE IF EXISTS `device_tracking`;
DROP TABLE IF EXISTS `cash_distribution`;
DROP TABLE IF EXISTS `network_operation`;
DROP TABLE IF EXISTS `atm_network_operations`;

-- Table 1: ATM Network Operations
CREATE TABLE `atm_network_operations` (
  `atm_network_operations_id` INT AUTO_INCREMENT NOT NULL,
  `operating_session_details` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'ACTIVE',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`atm_network_operations_id`)
);

-- Table 2: Network Operation
CREATE TABLE `network_operation` (
  `network_operation_id` INT AUTO_INCREMENT NOT NULL,
  `atm_network_operations_id` INT NOT NULL,
  `operation_details` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`network_operation_id`),
  FOREIGN KEY (`atm_network_operations_id`) REFERENCES `atm_network_operations` (`atm_network_operations_id`) ON DELETE CASCADE
);

-- Table 3: Cash Distribution
CREATE TABLE `cash_distribution` (
  `cash_distribution_id` INT AUTO_INCREMENT NOT NULL,
  `atm_network_operations_id` INT NOT NULL,
  `distribution_details` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cash_distribution_id`),
  FOREIGN KEY (`atm_network_operations_id`) REFERENCES `atm_network_operations` (`atm_network_operations_id`) ON DELETE CASCADE
);

-- Table 4: Device Tracking
CREATE TABLE `device_tracking` (
  `device_tracking_id` INT AUTO_INCREMENT NOT NULL,
  `atm_network_operations_id` INT NOT NULL,
  `tracking_details` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`device_tracking_id`),
  FOREIGN KEY (`atm_network_operations_id`) REFERENCES `atm_network_operations` (`atm_network_operations_id`) ON DELETE CASCADE
);

-- Table 5: Financial Document Handling
CREATE TABLE `financial_document_handling` (
  `financial_document_handling_id` INT AUTO_INCREMENT NOT NULL,
  `atm_network_operations_id` INT NOT NULL,
  `document_details` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`financial_document_handling_id`),
  FOREIGN KEY (`atm_network_operations_id`) REFERENCES `atm_network_operations` (`atm_network_operations_id`) ON DELETE CASCADE
);

-- Table 6: Financial Transaction Capture
CREATE TABLE `financial_transaction_capture` (
  `financial_transaction_capture_id` INT AUTO_INCREMENT NOT NULL,
  `atm_network_operations_id` INT NOT NULL,
  `transaction_details` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`financial_transaction_capture_id`),
  FOREIGN KEY (`atm_network_operations_id`) REFERENCES `atm_network_operations` (`atm_network_operations_id`) ON DELETE CASCADE
);

/*!40101 SET character_set_client = @saved_cs_client */;