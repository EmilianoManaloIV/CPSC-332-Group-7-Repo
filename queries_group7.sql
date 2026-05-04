-- ============================================
-- CPSC 332 - Project
-- File: queries_group7.sql
--       (rename: replace X with your group number)
-- Group: Group7
-- Members: Zeus Salinas, Ava Saltzman, Emiliano Manalo, Sean Lowry
-- Date: 04/08/2026
-- ============================================

-- ============================================
-- SECTION 1: DATABASE SETUP (DO NOT MODIFY)
-- ============================================
USE world_group7;                     -- Replace X with your group number

-- ============================================
-- SECTION 2: QUERIES (MODIFY THIS SECTION)
-- Table names used in queries must match exactly what you defined in create_tables_groupX.sql

-- Write 12 queries total:
--   - 4 JOIN queries       (Queries 1-4)
--   - 3 Subqueries         (Queries 5-7)
--   - 3 Aggregation queries(Queries 8-10)  must use GROUP BY; at least one must use HAVING
--   - 2 Ranking queries    (Queries 11-12) must use ORDER BY
--
-- Requirements & Self-Check:
--   - Valid MySQL syntax
--   - No trivial SELECT *
--   - Each query must have a one-line comment describing its purpose
--   - Use fully qualified column names in JOIN conditions (e.g., City.CountryCode)
--   - Each query counts toward only ONE category
--   - NO PIGGYBACKING: Do not copy a previous query, add an ORDER BY, and submit it twice.
--   - NO TRIVIAL QUERIES: Every query must answer a distinct, real-world analytical question.
--   - All queries must return at least one row using your inserted data
-- ============================================

-- ============================================
-- PART 1: JOIN QUERIES (4 queries)
-- Must involve two or more tables
-- At least one must be an OUTER JOIN (LEFT JOIN or RIGHT JOIN)
--=============================================

-- Query 1 (Category: JOIN - OUTER JOIN): Compare temperature data even when energy data is missing (the original one you wanted).
SELECT 
    c.country_code,
    c.avg_temperature,
    e.total_energy_produced
FROM Climate_Data c
LEFT JOIN Energy_Production e
    ON c.country_code = e.country_code
    AND e.year = 2020
WHERE c.year = 2020;

-- Query 2 (Category: JOIN): Shows the co2 emissions of countries with a high primary enrollment percentage. (shows dependency on fossil fuels in a highly educated country)
SELECT 
    ei.country_code, ei.year,
    ei.primary_enrollment_pct,
    c.co2_emissions
FROM Education_Indicators ei
JOIN Climate_Data c
    ON ei.country_code = c.country_code
   AND ei.year = c.year
WHERE ei.primary_enrollment_pct > 90;

-- Query 3 (Category: JOIN): Shows literacy percentage for each country in 2020.
SELECT 
    c.Name,
    ei.literacy_percentage
FROM Country c
JOIN Education_Indicators ei
    ON c.Code = ei.country_code
WHERE ei.year = 2020;

-- Query 4 (Category: JOIN): Shows renewable energy percentage for each country in 2020.
SELECT 
    c.Name AS country,
    e.renewable_percentage
FROM Country c
JOIN Energy_Production e
    ON c.Code = e.country_code
WHERE e.year = 2020;

-- ============================================
-- PART 2: SUBQUERIES (3 queries)
-- Must include at least one EXISTS or NOT EXISTS
-- Must include at least one IN, NOT IN, or correlated subquery
-- ============================================

-- Query 5 (Category: Subquery - IN): 
-- Find countries whose renewable percentage is above the global average.
SELECT 
    country_code,
    renewable_percentage
FROM Energy_Production
WHERE year = 2020
  AND renewable_percentage > (
        SELECT AVG(renewable_percentage)
        FROM Energy_Production
        WHERE year = 2020
      );

-- Query 6 (Category: SUBQUERIES): Finds countries with the highest primary school enrollment percentage.
SELECT 
    country_code,
    primary_enrollment_pct,
    literacy_percentage
FROM Education_Indicators
WHERE primary_enrollment_pct IN (
    SELECT MAX(primary_enrollment_pct)
    FROM Education_Indicators
);

-- Query 7 (Category: SUBQUERIES - EXISTS): Find countries with high climate stress that also exceed the global average literacy rate.
SELECT 
    c.country_code,
    c.climate_stress_index,
    ei.literacy_percentage
FROM Climate_Data c
JOIN Education_Indicators ei
    ON c.country_code = ei.country_code
WHERE c.year = 2020
  AND c.climate_stress_index > 0.5
  AND ei.literacy_percentage > (
        SELECT AVG(literacy_percentage)
        FROM Education_Indicators
        WHERE year = 2020
      );




-- ============================================
-- PART 3: AGGREGATION QUERIES (3 queries)
-- Must use GROUP BY; at least one must use HAVING
-- ============================================

-- Query 8 (Category: Aggregation): Compute average renewable energy share by climate stress category.
SELECT 
    CASE 
        WHEN c.climate_stress_index >= 0.5 THEN 'High Stress'
        WHEN c.climate_stress_index >= 0 THEN 'Moderate Stress'
        ELSE 'Low Stress'
    END AS stress_group,
    AVG(e.renewable_percentage) AS avg_renewables
FROM Climate_Data c
JOIN Energy_Production e
    ON c.country_code = e.country_code
WHERE e.year = 2020
GROUP BY stress_group;

-- Query 9 (Category: AGGREGATION QUERIES): Shows the average literacy rate and education gdp percentage spent. (Shows payoff of investments into education)
SELECT 
    c.Region,
    COUNT(ei.country_code)              AS num_countries,
    ROUND(AVG(ei.literacy_percentage), 1)    AS avg_literacy_pct,
    ROUND(AVG(ei.education_gdp_pct), 2)      AS avg_education_gdp_pct,
    ROUND(AVG(ei.secondary_enrollment_pct), 1) AS avg_secondary_enrollment
FROM Education_Indicators ei
JOIN Country c ON ei.country_code = c.Code
GROUP BY c.Region
ORDER BY avg_literacy_pct DESC;

-- Query 10 (Category: AGGREGATION QUERIES - GROUP BY, HAVING): Identify continents whose average renewable energy percentage is below the global average.
SELECT 
    c.Continent,
    ROUND(AVG(e.renewable_percentage), 2) AS avg_continent_renewables
FROM Energy_Production e
JOIN Country c 
    ON e.country_code = c.Code
WHERE e.year = 2020
GROUP BY c.Continent
HAVING AVG(e.renewable_percentage) < (
        SELECT AVG(renewable_percentage)
        FROM Energy_Production
        WHERE year = 2020
      );


-- ============================================
-- PART 4: RANKING QUERIES (2 queries)
-- Must use ORDER BY; LIMIT is optional
-- Must involve at least two tables

-- ============================================

-- Query 11 (Category: Ranking): Rank countries by lowest CO2 emissions, breaking ties with highest renewable energy.
SELECT 
    e.country_code,
    c.co2_emissions,
    e.renewable_percentage
FROM Energy_Production e
JOIN Climate_Data c
    ON e.country_code = c.country_code
WHERE e.year = 2020
ORDER BY c.co2_emissions ASC,
         e.renewable_percentage DESC;


-- Query 12 (Category: RANKING QUERIES): Ranks countries' literacy rate within each continent.
SELECT 
    c.Continent,
    c.Name                                          AS country,
    ROUND(ei.literacy_percentage, 1)               AS literacy_pct,
    ROUND(ei.primary_enrollment_pct, 1)            AS primary_enrollment_pct,
    ROUND(ei.education_gdp_pct, 2)                 AS education_gdp_pct
FROM Education_Indicators ei
JOIN Country c ON ei.country_code = c.Code
ORDER BY c.Continent ASC, ei.literacy_percentage DESC;
