-- ============================================
-- CPSC 332 - Project
-- File: create_tables_groupX.sql
--       (rename: replace X with your group number)
-- Group: [Replace with your group number, e.g., Group1]
-- Members: [List all member names]
-- Date: [Date]
-- ============================================


-- ============================================
-- SECTION 1: DATABASE SETUP
-- ============================================

DROP DATABASE IF EXISTS world_group7; -- Replace X with your group number
CREATE DATABASE world_group7;         -- Replace X with your group number
USE world_group7;                     -- Replace X with your group number


-- ============================================
-- SECTION 2: WORLD DB TABLES (DO NOT MODIFY)
-- These three tables are copied from world.sql
-- ============================================

-- Country table

CREATE TABLE Country (
  Code CHAR(3) NOT NULL DEFAULT '',
  Name CHAR(52) NOT NULL DEFAULT '',
  Continent ENUM('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL default 'Asia',
  Region CHAR(26) NOT NULL DEFAULT '',
  SurfaceArea FLOAT(10,2) NOT NULL DEFAULT '0.00',
  IndepYear SMALLINT(6) DEFAULT NULL,
  Population INT(11) DEFAULT NULL,
  LifeExpectancy FLOAT(3,1) DEFAULT NULL,
  GNP FLOAT(10,2) DEFAULT NULL,
  GNPOld FLOAT(10,2) DEFAULT NULL,
  LocalName CHAR(45) NOT NULL DEFAULT '',
  GovernmentForm CHAR(45) NOT NULL DEFAULT '',
  HeadOfState CHAR(60) DEFAULT NULL,
  Capital INT(11) DEFAULT NULL,
  Code2 CHAR(2) NOT NULL DEFAULT '',
  PRIMARY KEY  (Code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- City table

CREATE TABLE City (
  ID INT(11) NOT NULL auto_increment,
  Name CHAR(35) NOT NULL DEFAULT '',
  CountryCode CHAR(3) NOT NULL DEFAULT '',
  District CHAR(20) NOT NULL DEFAULT '',
  Population INT(11) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- CountryLanguage table

CREATE TABLE CountryLanguage (
  CountryCode CHAR(3) NOT NULL DEFAULT '',
  Language CHAR(30) NOT NULL DEFAULT '',
  IsOfficial ENUM('T','F') NOT NULL DEFAULT 'F',
  Percentage FLOAT(4,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY  (CountryCode,Language)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ============================================
-- SECTION 3: WORLD DB FOREIGN KEYS (DO NOT MODIFY)
-- These FK constraints are provided for you.
-- The original world.sql does not include them.
-- ============================================

ALTER TABLE City
    ADD CONSTRAINT fk_city_country
    FOREIGN KEY (CountryCode) REFERENCES Country(Code);

ALTER TABLE CountryLanguage
    ADD CONSTRAINT fk_countryLanguage_country
    FOREIGN KEY (CountryCode) REFERENCES Country(Code);


-- ============================================
-- SECTION 4: YOUR NEW TABLES (MODIFY THIS SECTION)
-- Add exactly 3 new tables below.
-- Requirements for each table:
--   - At least one PRIMARY KEY
--   - At least one FOREIGN KEY referencing an existing table
--   - Appropriate data types and NOT NULL constraints
-- ============================================

-- EXAMPLE (delete this before submitting):
-- CREATE TABLE Economic_Indicators (
--     indicator_id  INT          NOT NULL AUTO_INCREMENT,
--     country_code  CHAR(3)      NOT NULL,
--     year          YEAR         NOT NULL,
--     gdp_billion   DECIMAL(15,2),
--     inflation_rate DECIMAL(5,2),
--     PRIMARY KEY (indicator_id),
--     CONSTRAINT fk_econ_country
--         FOREIGN KEY (country_code) REFERENCES Country(Code)
-- );

-- New Table 1: [TableName]
-- Purpose: [Briefly describe what this table represents]
-- CREATE TABLE [TableName] (
--     -- your columns here
-- );

-- -- New Table 2: [TableName]
-- -- Purpose: [Briefly describe what this table represents]
-- CREATE TABLE [TableName] (
--     -- your columns here
-- );

-- -- New Table 3: [TableName]
-- -- Purpose: [Briefly describe what this table represents]
-- CREATE TABLE [TableName] (
--     -- your columns here
-- );

