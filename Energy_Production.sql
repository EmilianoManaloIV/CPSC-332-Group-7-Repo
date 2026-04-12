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
