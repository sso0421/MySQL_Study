CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;

CREATE TABLE IF NOT EXISTS teddyproducts (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, #UNSIGNED는 0을 포함한 양의 정수라는 뜻
    title VARCHAR(200) NOT NULL, 
    category VARCHAR(20) NOT NULL
);

DESC teddyproducts;

SELECT * FROM teddyproducts;

SELECT COUNT(*) total_product FROM teddyproducts;

SELECT category, COUNT(*) product_count FROM teddyproducts GROUP BY category ORDER BY product_count DESC;

SELECT * FROM teddyproducts WHERE title LIKE "%순면%";