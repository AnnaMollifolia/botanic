CREATE TABLE latin_binomen (
 short_name VARCHAR(50) NOT NULL CHECK(LENGTH(short_name) >= 1) PRIMARY KEY,
 genus VARCHAR(50) NOT NULL CHECK(LENGTH(genus) >= 1),
 species VARCHAR(500) NOT NULL CHECK(LENGTH(species) >= 1)
);

CREATE TABLE rus_binomen (
 short_rus_name VARCHAR(50) NOT NULL CHECK(LENGTH(short_rus_name) >= 1) PRIMARY KEY,
 rus_genus VARCHAR(50) NOT NULL CHECK(LENGTH(rus_genus) >= 1),
 rus_species VARCHAR(500) NOT NULL CHECK(LENGTH(rus_species) >= 1)
);

CREATE TABLE genus_taxon (
 genus VARCHAR(50) NOT NULL CHECK(LENGTH(genus) >= 1) PRIMARY KEY,
 life-form VARCHAR(50) NOT NULL CHECK(LENGTH(life-form) >= 1),
 phyllotaxy VARCHAR(50) NOT NULL CHECK(LENGTH(phyllotaxy) >= 1),
 fruit VARCHAR(50) NOT NULL CHECK(LENGTH(fruit) >= 1),
 family VARCHAR(50) NOT NULL CHECK(LENGTH(family) >= 1)
);

CREATE TABLE rus_genus_taxon (
 genus VARCHAR(50) NOT NULL CHECK(LENGTH(genus) >= 1) PRIMARY KEY,
 rus_genus VARCHAR(50) NOT NULL CHECK(LENGTH(rus_genus) >= 1)
);

CREATE TABLE family_taxon (
 family VARCHAR(50) NOT NULL CHECK(LENGTH(family) >= 1) PRIMARY KEY,
 class VARCHAR(50) NOT NULL CHECK(LENGTH(class) >= 1)
);

CREATE TABLE rus_family_taxon (
 family VARCHAR(50) NOT NULL CHECK(LENGTH(family) >= 1) PRIMARY KEY,
 rus_family VARCHAR(50) NOT NULL CHECK(LENGTH(rus_family) >= 1)
);

CREATE TABLE red_list (
 short_name VARCHAR(50) NOT NULL CHECK(LENGTH(short_name) >= 1) PRIMARY KEY,
 status VARCHAR(50) NOT NULL CHECK(LENGTH(status) >= 1)
);

CREATE TABLE version_history_of_red_list (
 short_name VARCHAR(50) NOT NULL CHECK(LENGTH(short_name) >= 1) PRIMARY KEY,
 status VARCHAR(50) NOT NULL CHECK(LENGTH(status) >= 1),
 entry_year YEAR NOT NULL,
 leaving_year YEAR NOT NULL
);