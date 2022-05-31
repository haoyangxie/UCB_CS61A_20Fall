.read data.sql


CREATE TABLE average_prices AS
  SELECT category, avg(MSRP) as average_price
  FROM products
  GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, min(price) as lowest_price
  FROM inventory
  GROUP BY item;
  
CREATE TABLE helper AS
  SELECT name
  FROM products
  GROUP BY category
  HAVING min(MSRP / rating);


CREATE TABLE shopping_list AS
  SELECT helper.name, store
  FROM helper, lowest_prices
  WHERE helper.name = lowest_prices.item;


CREATE TABLE total_bandwidth AS
  SELECT sum(b.Mbs)
  From shopping_list as a, stores as b
  where a.store = b.store;