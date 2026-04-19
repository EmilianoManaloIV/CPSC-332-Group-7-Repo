CREATE TABLE Education_Indicators (
    country_code              CHAR(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
    education_id              INT NOT NULL AUTO_INCREMENT,
    year                      YEAR NOT NULL,
    literacy_percentage       DECIMAL(5,2) DEFAULT NULL,
    primary_enrollment_pct    DECIMAL(5,2) DEFAULT NULL,
    secondary_enrollment_pct  DECIMAL(5,2) DEFAULT NULL,
    education_gdp_pct         DECIMAL(5,2) DEFAULT NULL,

    PRIMARY KEY (education_id),

    CONSTRAINT fk_education_country
        FOREIGN KEY (country_code) REFERENCES Country(Code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
