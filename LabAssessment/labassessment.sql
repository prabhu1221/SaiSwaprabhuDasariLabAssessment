--  Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
-- solution:
SELECT 
    *
FROM
    orders
WHERE
    ord_amount >= 3000;
SELECT 
    COUNT(customer.cus_gender)
FROM
    customer
        JOIN
    orders ON customer.cus_id = orders.cus_id
        AND ord_amount >= 3000
GROUP BY customer.cus_gender;

--  Display all the orders along with product name ordered by a customer having Customer_Id=2
-- solution:
SELECT 
    pro.pro_name, o.ord_amount, o.ord_date
FROM
    orders o
        JOIN
    supplierpricing sp ON o.pricing_id = sp.pricing_id
        JOIN
    product pro ON sp.pro_id = pro.pro_id
WHERE
    o.cus_id = 2;

-- Display the Supplier details who can supply more than one product.
-- solution:
SELECT 
    *
FROM
    supplier
WHERE
    supplier_id IN (SELECT 
            supplier_id
        FROM
            supplierpricing
        GROUP BY (supplier_id)
        HAVING COUNT(supplier_id) > 1);
        
--  Find the least expensive product from each category and print the table with category id, name, product name and price of the product
-- solution:
SELECT 
    cat.cat_id, MIN(t2.supp_price)
FROM
    category cat
        INNER JOIN
    (SELECT 
        *
    FROM
        product p
    INNER JOIN (SELECT 
        pro_id AS id, supp_price
    FROM
        supplierpricing
    GROUP BY (id)
    HAVING MIN(supp_price)) AS t1 ON t1.id = p.pro_id) AS t2 ON t2.cat_id = cat.cat_id
GROUP BY cat.cat_id
ORDER BY cat_id;

-- Display the Id and Name of the Product ordered after “2021-10-05”
-- solution:

SELECT 
    pro_name, pro_desc
FROM
    product AS prod
        INNER JOIN
    (SELECT 
        o.ord_date, sp.pro_id
    FROM
        orders AS o
    INNER JOIN supplierpricing AS sp ON sp.pricing_id = o.pricing_id
        AND ord_date >= '2021-10-05') AS p1 ON prod.pro_id = p1.pro_id
GROUP BY p1.pro_id;

-- Display customer name and gender whose names start or end with character 'A'.
-- solution:

SELECT 
    cus_name
FROM
    customer
WHERE
    cus_name LIKE 'a%' OR cus_name LIKE '%a';