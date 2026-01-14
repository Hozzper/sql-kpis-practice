-- Preparação da data
CREATE TABLE pizza_sales AS SELECT * FROM "data/pizza_sales.csv";
SHOW TABLES;

SELECT * FROM pizza_sales LIMIT 5;

/* pizza_id: A unique identifier assigned to each distinct pizza variant available for ordering.
order_id: A unique identifier for each order made, which links to multiple pizzas.
pizza_name_id: An identifier linking to a specific name of the pizza.
quantity: The number of units of a specific pizza variant ordered within an order.
order_date: The date when the order was placed.
order_time: The time when the order was placed.
unit_price: The cost of a single unit of the specific pizza variant.
total_price: The aggregated cost of all units of a specific pizza variant in an order.
pizza_size: Represents the size of the pizza (e.g., small, medium, large).
pizza_category: Indicates the category of the pizza, such as vegetarian, non-vegetarian, etc.
pizza_ingredients: Provides a list or description of the ingredients used in the pizza.
pizza_name: Specifies the name of the specific pizza variant ordered. */

-- Funções Agregadas
SELECT MIN(unit_price) AS SmallestPrice 
FROM pizza_sales;

SELECT MAX(unit_price) AS MaxPrice 
FROM pizza_sales;

SELECT COUNT(pizza_name) FROM pizza_sales;

SELECT COUNT(DISTINCT pizza_name) AS CountDiferentsPizzas FROM pizza_sales;
SELECT DISTINCT pizza_name FROM pizza_sales;

SELECT SUM(unit_price) FROM pizza_sales;
SELECT AVG(unit_price) FROM pizza_sales;

--Preço médio de cada pizza
SELECT pizza_name, AVG(unit_price)
FROM pizza_sales
GROUP BY pizza_name;

SELECT DISTINCT pizza_name_id, unit_price FROM pizza_sales;


--Preço médio do cardapio de pizzas
SELECT AVG(MeanUnitPrice) AS MeanPricePerPizza
FROM (
    SELECT 
      pizza_name, AVG(unit_price) AS MeanUnitPrice
    FROM pizza_sales
    GROUP BY pizza_name
    );

--Contagem das ordens de cada pizza
SELECT COUNT(*), pizza_name 
FROM pizza_sales
GROUP BY pizza_name;

SELECT pizza_name, AVG(unit_price) FROM pizza_sales
GROUP BY pizza_name
ORDER BY pizza_name;

