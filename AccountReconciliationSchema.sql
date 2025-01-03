CREATE DATABASE IF NOT EXISTS `account_reconciliation_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `account_reconciliation_db`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

-- Drop tables if they exist
DROP TABLE IF EXISTS `account_resolution`;
DROP TABLE IF EXISTS `account_assessment`;
DROP TABLE IF EXISTS `account_reconciliation`;

-- Table 1: Account Reconciliation
CREATE TABLE `account_reconciliation` (
  `account_reconciliation_id` INT AUTO_INCREMENT NOT NULL,
  `procedure_details` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'ACTIVE',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_reconciliation_id`)
);

-- Table 2: Account Assessment
CREATE TABLE `account_assessment` (
  `account_assessment_id` INT AUTO_INCREMENT NOT NULL,
  `account_reconciliation_id` INT NOT NULL,
  `assessment_details` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_assessment_id`),
  FOREIGN KEY (`account_reconciliation_id`) REFERENCES `account_reconciliation` (`account_reconciliation_id`) ON DELETE CASCADE
);

-- Table 3: Account Resolution
CREATE TABLE `account_resolution` (
  `account_resolution_id` INT AUTO_INCREMENT NOT NULL,
  `account_reconciliation_id` INT NOT NULL,
  `resolution_details` JSON DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT 'PENDING',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_resolution_id`),
  FOREIGN KEY (`account_reconciliation_id`) REFERENCES `account_reconciliation` (`account_reconciliation_id`) ON DELETE CASCADE
);

/*!40101 SET character_set_client = @saved_cs_client */;