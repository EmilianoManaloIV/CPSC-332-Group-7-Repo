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