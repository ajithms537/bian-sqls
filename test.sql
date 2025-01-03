CREATE DATABASE IF NOT EXISTS `sample_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sample_db`;
 
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
 
-- Drop tables if they exist
DROP TABLE IF EXISTS `AccountRecoveryProcedure`;
DROP TABLE IF EXISTS `Negotiation`;
DROP TABLE IF EXISTS `Writedown`;
DROP TABLE IF EXISTS `Planning`;
DROP TABLE IF EXISTS `Restructuring`;
DROP TABLE IF EXISTS `Assessment`;
 
-- Table 1: AccountRecoveryProcedure
CREATE TABLE `AccountRecoveryProcedure` (
  `AccountRecoveryCaseType` VARCHAR(255) DEFAULT NULL,
  `ProductInstanceReference` VARCHAR(255) DEFAULT NULL,
  `LinkedProductInstanceReference` VARCHAR(255) DEFAULT NULL,
  `CustomerReference` VARCHAR(255) DEFAULT NULL,
  `EmployeeBusinessUnitReference` VARCHAR(255) DEFAULT NULL,
  `AccountNumber` VARCHAR(255) DEFAULT NULL,
  `BankBranchLocationReference` VARCHAR(255) DEFAULT NULL,
  `DateType` VARCHAR(255) DEFAULT NULL,
  `Date` VARCHAR(255) DEFAULT NULL,
  `InvolvedPartyReference` VARCHAR(255) DEFAULT NULL,
  `InvolvedPartyObligationEntitlement` VARCHAR(255) DEFAULT NULL,
  `AccountType` VARCHAR(255) DEFAULT NULL,
  `AccountCurrency` VARCHAR(255) DEFAULT NULL,
  `AccountLimitType` VARCHAR(255) DEFAULT NULL,
  `AccountLimit` VARCHAR(255) DEFAULT NULL,
  `AllowedAccess` VARCHAR(255) DEFAULT NULL,
  `TaxReference` VARCHAR(255) DEFAULT NULL,
  `AccountStatus` VARCHAR(255) DEFAULT NULL,
  `CollateralAssetAllocationProfile` VARCHAR(255) DEFAULT NULL,
  `CollateralType` VARCHAR(255) DEFAULT NULL,
  `CollateralAssetDescription` VARCHAR(255) DEFAULT NULL,
  `TransactionRecord` VARCHAR(255) DEFAULT NULL,
  `AccountRecoveryCaseWorkProducts` VARCHAR(255) DEFAULT NULL,
  `DocumentReference` VARCHAR(255) DEFAULT NULL,
  `CustomerCommentary` VARCHAR(255) DEFAULT NULL,
  `AccountRecoveryCaseResolutionSchedule` VARCHAR(255) DEFAULT NULL,
  `AccountRecoveryCaseStatus` VARCHAR(255) DEFAULT NULL
);
 
-- Table 2: Negotiation
CREATE TABLE `Negotiation` (
  `AccountRecoveryGuidelines` VARCHAR(255) DEFAULT NULL,
  `CorrespondenceReference` VARCHAR(255) DEFAULT NULL,
  `CorrespondenceContent` VARCHAR(255) DEFAULT NULL,
  `DocumentReference` VARCHAR(255) DEFAULT NULL,
  `DocumentContent` VARCHAR(255) DEFAULT NULL,
  `AccountRecoveryCaseNegotiationTaskRecord` VARCHAR(255) DEFAULT NULL
);
 
-- Table 3: Writedown
CREATE TABLE `Writedown` (
  `Accountwrite-downtransaction` VARCHAR(255) DEFAULT NULL,
  `AccountRecoveryCaseWrite-downTaskRecord` VARCHAR(255) DEFAULT NULL
);
 
-- Table 4: Planning
CREATE TABLE `Planning` (
  `AccountRecoveryPlan` VARCHAR(255) DEFAULT NULL,
  `AccountRecoveryCasePlanningTaskRecord` VARCHAR(255) DEFAULT NULL
);
 
-- Table 5: Restructuring
CREATE TABLE `Restructuring` (
  `AccountRecoveryRestructuringSchedule` VARCHAR(255) DEFAULT NULL,
  `AccountRecoveryCaseRestructuringTaskRecord` VARCHAR(255) DEFAULT NULL
);
 
-- Table 6: Assessment
CREATE TABLE `Assessment` (
  `AccountRecoveryCaseAssessmentTaskRecord` VARCHAR(255) DEFAULT NULL
);
 
/*!40101 SET character_set_client = @saved_cs_client */;
