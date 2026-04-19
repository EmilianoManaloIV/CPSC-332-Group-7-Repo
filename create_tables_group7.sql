-- ============================================
-- CPSC 332 - Project
-- File: create_tables_group7.sql
-- Group: Group 7
-- Members: [List all member names]
-- Date: [Date]
-- ============================================


-- ============================================
-- SECTION 1: DATABASE SETUP
-- ============================================

DROP DATABASE IF EXISTS world_group7;
CREATE DATABASE world_group7;
USE world_group7;


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
-- ============================================

ALTER TABLE City
    ADD CONSTRAINT fk_city_country
    FOREIGN KEY (CountryCode) REFERENCES Country(Code);

ALTER TABLE CountryLanguage
    ADD CONSTRAINT fk_countryLanguage_country
    FOREIGN KEY (CountryCode) REFERENCES Country(Code);


-- ============================================
-- SECTION 4: YOUR NEW TABLES (MODIFY THIS SECTION)
-- ============================================

-- ============================================
-- New Table 1: Energy_Production
-- Purpose: Tracks annual national energy production by type.
-- ============================================

CREATE TABLE Energy_Production (
    country_code CHAR(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
    year YEAR NOT NULL,
    total_energy_produced BIGINT,
    renewable_percentage DECIMAL(5,2),
    fossil_fuel_percentage DECIMAL(5,2),
    nuclear_percentage DECIMAL(5,2),

    PRIMARY KEY (country_code, year),

    CONSTRAINT fk_energy_country
        FOREIGN KEY (country_code) REFERENCES Country(Code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ============================================
-- New Table 2: Climate_Data
-- Purpose: Tracks climate indicators for each country per year.
-- ============================================

CREATE TABLE Climate_Data (
    country_code CHAR(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
    year YEAR NOT NULL,
    avg_temperature DECIMAL(4,1),
    avg_rainfall DECIMAL(8,2),
    drought_index DECIMAL(5,2),
    co2_emissions DECIMAL(10,2),

    PRIMARY KEY (country_code, year),

    CONSTRAINT fk_climate_country
        FOREIGN KEY (country_code) REFERENCES Country(Code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ============================================
-- New Table 3: Education_Indicators
-- Purpose: Tracks education-related statistics for each country.
-- ============================================

CREATE TABLE Education_Indicators (
    country_code CHAR(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
    education_id INT NOT NULL AUTO_INCREMENT,
    year YEAR NOT NULL,
    literacy_percentage DECIMAL(5,2) DEFAULT NULL,
    primary_enrollment_pct DECIMAL(5,2) DEFAULT NULL,
    secondary_enrollment_pct DECIMAL(5,2) DEFAULT NULL,
    education_gdp_pct DECIMAL(5,2) DEFAULT NULL,

    PRIMARY KEY (education_id),

    CONSTRAINT fk_education_country
        FOREIGN KEY (country_code) REFERENCES Country(Code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
