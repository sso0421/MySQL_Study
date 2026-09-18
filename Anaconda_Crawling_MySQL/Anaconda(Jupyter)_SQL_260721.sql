CREATE DATABASE IF NOT EXISTS marketing_projects
CHARACTER SET utf8mb4  # utf8는 한국어 인식 가능, mb4는 이모지까지도 인식해서 넣겠다
COLLATE utf8mb4_unicode_ci; # Case Insentive : 대소문자를 식별하지 않겠다 
# Apple = APPLE = apple
#만약, 다른 값으로 구문하고 싶다면 _cs : Case Snsentive

USE marketing_projects;

CREATE TABLE IF NOT EXISTS product_catalog(
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price_text VARCHAR(30) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    price_band VARCHAR(50) NOT NULL,
    products_url VARCHAR(255) NOT NULL,
    crawled_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESC product_catalog;
SELECT * FROM product_catalog;
DESC product_catalog;

SELECT * FROM product_catalog;
SELECT
	COUNT(*) AS total_products,
  SUM(
		CASE
			WHEN price <= 25 THEN 1
       ELSE 0
		END
    ) AS low_price_products,
    ROUND(
		SUM(
		CASE
			WHEN price <= 25 THEN 1
      ELSE 0
		END
		)
		/ COUNT(*) * 100,
      2
    ) AS low_price_ratio_pct
FROM product_catalog;


SELECT
	price_band,
    COUNT(*) AS product_count,
    ROUND(AVG(price), 2) AS average_price,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM  product_catalog
GROUP BY price_band;

SELECT * FROM product_catalog;

SELECT
	CASE
		WHEN LOWER(product_name) REGEXP 'sweatshirt|tee|pullover' THEN 'Apparel'
        ELSE 'Non-Apparel'
	END AS product_type,
    COUNT(*) AS product_count,
    AVG(price) AS average_price
FROM product_catalog
GROUP BY product_type;
    