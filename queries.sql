1. Получить все бинарные названия, сокращённая форма которых равна 'G. uralensis'.
SELECT latin_binomen.*
FROM latin_binomen
WHERE short_name = 'G. uralensis'

2. Добавить в таблицу с русским бинарным названием сокращённую форму
UPDATE rus_binomen
SET short_name = CONCAT(LEFT(rus_genus, 1), '. ', rus_species)

3. На основании rus_binomen_short_name создаёт таблицу с сокращёнными названиями для растений с видовым эпитетом 'uralensis'
CREATE TABLE rus_binomen_short_name AS
SELECT *, CONCAT(LEFT(rus_genus, 1), '. ', rus_species) AS short_name
FROM rus_binomen
WHERE species = 'uralensis'

4. Считает разницу между бинарным названием и его сокращённой формой в новом столбце таблицы и сортирует по убыванию
ALTER TABLE latin_binomen
ADD COLUMN length_difference INT

UPDATE latin_binomen
SET length_difference = LENGTH(genus) + LENGTH(species) - LENGTH(short_name);

SELECT genus, species, short_name, length_difference
FROM latin_binomen
ORDER BY length_difference DESC

5. Считает, сколько в каждом семействе родов
SELECT f.family, COUNT(DISTINCT g.genus) AS num_genus
FROM family_taxon f
JOIN genus_taxon g ON f.family = g.family
GROUP BY f.family

6. Как п.5, но выводит только те семейства, в который больше одного рода
SELECT f.family, COUNT(DISTINCT g.genus) AS num_genus
FROM family_taxon f
JOIN genus_taxon g ON f.family = g.family
GROUP BY f.family
HAVING COUNT(DISTINCT g.genus) > 1

7. Считает, сколько раз встречается каждый статус
SELECT status, COUNT(*) AS count
FROM red_list
GROUP BY status

8. Выбирает те растения, которыев 1970 году входили в Красную книгу
SELECT genus, species
FROM version_history_of_red_list
WHERE entry_year < 1970
AND leaving_year > 1970
AND status = 'in'

9. Выбирает те растения, которые не встречаются в записях Красной книги
SELECT genus, species
FROM latin_binomen
WHERE (genus, species) NOT IN (
    SELECT genus, species
    FROM version_history_of_red_list
);

10. Для каждого рода пишет через запятую все соответсвующие ему виды
SELECT genus, GROUP_CONCAT(species SEPARATOR ', ') AS all_species
FROM latin_binomen
GROUP BY genus




