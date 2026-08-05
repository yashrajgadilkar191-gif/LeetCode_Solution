# Write your MySQL query statement below

-- SELECT * 
-- FROM products
-- WHERE description LIKE '%SN____-____' 
--    OR description LIKE '%SN____-____ %';

SELECT product_id, product_name, description
FROM products
WHERE REGEXP_LIKE(description, '\\bSN[0-9]{4}-[0-9]{4}\\b', 'c')
ORDER BY product_id ASC;
