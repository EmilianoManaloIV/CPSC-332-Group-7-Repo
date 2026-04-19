-- ============================================
-- CPSC 332 - Project
-- File: queries_groupX.sql
--       (rename: replace X with your group number)
-- Group: [Replace with your group number, e.g., Group1]
-- Members: [List all member names]
-- Date: [Date]
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

-- EXAMPLE (delete this before submitting):
-- Query 0: Find the GDP of countries specifically in the 'Caribbean' region
-- SELECT Country.Name, Economic_Indicators.gdp_billion
-- FROM Country
-- JOIN Economic_Indicators ON Country.Code = Economic_Indicators.country_code
-- WHERE Country.Region = 'Caribbean';
-- ============================================

-- Query 1 (Category: JOIN): [Describe your query here]


-- Query 2 (Category: JOIN): [Describe your query here]


-- Query 3 (Category: JOIN): [Describe your query here]


-- Query 4 (Category: JOIN): [Describe your query here]


-- ============================================
-- PART 2: SUBQUERIES (3 queries)
-- Must include at least one EXISTS or NOT EXISTS
-- Must include at least one IN, NOT IN, or correlated subquery

-- EXAMPLE (delete this before submitting):
-- Query 0: Find countries that are major tourist hubs (over 20 million visitors) using IN
-- SELECT Country.Name
-- FROM Country
-- WHERE Country.Code IN (
--     SELECT Tourism_Statistics.country_code
--     FROM Tourism_Statistics
--     WHERE Tourism_Statistics.visitors_mil > 20
-- );
-- ============================================

-- Query 5 (Category: SUBQUERIES): [Describe your query here]


-- Query 6 (Category: SUBQUERIES): [Describe your query here]


-- Query 7 (Category: SUBQUERIES): [Describe your query here]


-- ============================================
-- PART 3: AGGREGATION QUERIES (3 queries)
-- Must use GROUP BY; at least one must use HAVING

-- EXAMPLE (delete this before submitting):
-- Query 0: Show total tourism revenue by continent (only continents above 100 billion)
-- SELECT Country.Continent, SUM(Tourism_Statistics.revenue_billion) AS total_revenue
-- FROM Country
-- JOIN Tourism_Statistics ON Country.Code = Tourism_Statistics.country_code
-- GROUP BY Country.Continent
-- HAVING SUM(Tourism_Statistics.revenue_billion) > 100;
-- ============================================

-- Query 8 (Category: AGGREGATION QUERIES): [Describe your query here]


-- Query 9 (Category: AGGREGATION QUERIES): [Describe your query here]


-- Query 10 (Category: AGGREGATION QUERIES): [Describe your query here]


-- ============================================
-- PART 4: RANKING QUERIES (2 queries)
-- Must use ORDER BY; LIMIT is optional
-- Must involve at least two tables

-- EXAMPLE (delete this before submitting):
-- Query 0: Top 5 countries by number of tourist visitors
-- SELECT Country.Name, Tourism_Statistics.visitors_mil
-- FROM Country
-- JOIN Tourism_Statistics ON Country.Code = Tourism_Statistics.country_code
-- ORDER BY Tourism_Statistics.visitors_mil DESC
-- LIMIT 5;
-- ============================================

-- Query 11 (Category: RANKING QUERIES): [Describe your query here]


-- Query 12 (Category: RANKING QUERIES): [Describe your query here]
