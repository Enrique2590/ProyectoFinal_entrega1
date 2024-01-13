/*Luego de realizar un SELECT(*) de todas las tablas se llega a 
  la siguiente conclusion: */
---------------Parte #1-----------------------------------------
----------------------------------------------------------------
--ejercicio #1--------------------------------------------------
SELECT COUNT(DISTINCT invoice_no)
FROM customer_shopping;

/*la tabla customer_shopping es la tabla principal porque tienen 
  una fila por cada numero de factura y cuenta con 99,457 filas.*/

--Ejercicio #2---------------------------------------------------
SELECT COUNT(price), SUM(price),
       COUNT(price)*SUM(price)AS ventas_totales
FROM customer_shopping;

/*ventas totales de la tabla customer_shopping = $6817913199310.87*/

--Ejercicio #3---------------------------------------------------
SELECT invoice_date
FROM customer_shopping
ORDER BY invoice_date 
LIMIT 1;

SELECT invoice_date
FROM customer_shopping
ORDER BY invoice_date DESC 
LIMIT 1;

/*el rango de fechas de transacciones comprende el periodo de 
  01/01/2021 al 08/03/2023.*/

--Ejercicio #4------------------------------------------------------
SELECT invoice_date,invoice_no, customer_id, shopping_mall, district, gender,
       age, category, payment_method, price,TO_CHAR(invoice_date, 'YYYY')
FROM customer_shopping AS cs 
JOIN shopping_malls AS sm ON cs.shopping_mall_id = sm.shopping_mall_id
JOIN genders AS ge ON cs.gender_id = ge.gender_id
JOIN categories AS ca ON cs.category_id = ca.category_id
JOIN payment_methods AS pm ON cs.payment_method_id = pm.pmt_method_id
WHERE (cs.invoice_date >= '2021-01-01' AND cs.invoice_date <'2023-01-01')
      AND(district = 'Levent' OR district ='Besiktas')
      AND gender = 'Female'
      AND age BETWEEN 18 AND 25  
      AND(category = 'Clothing' OR category = 'Shoes' OR category = 'Cosmetics') 
	  AND (payment_method = 'Credit Card' OR payment_method = 'Debit Card')  
	  AND price >= '10000';
	  

--Ejercicio #5-----------------------------------------------------

SELECT TO_CHAR(invoice_date, 'YYYY/MM'),
       SUM(quantity)AS t_unidades_vendidas,
       COUNT(invoice_no)AS t_transacciones_facturadas,
	   COUNT(price)*SUM(price)AS ventas_totales
FROM customer_shopping
GROUP BY TO_CHAR(invoice_date, 'YYYY/MM')   
ORDER BY TO_CHAR(invoice_date, 'YYYY/MM');
    
	
--Ejercicio #6----------------------------------------------------

SELECT sm.shopping_mall,COUNT(price)*SUM(price)AS total_venta
FROM customer_shopping AS cs
JOIN shopping_malls AS sm ON cs.shopping_mall_id = sm.shopping_mall_id 
GROUP BY sm.shopping_mall
ORDER BY  sm.shopping_mall;


--Ejercicio #7--------------------------------------------------

SELECT gender, age, COUNT(price)*SUM(price)AS V_TOTALES
FROM customer_shopping AS cs
JOIN genders AS ge ON cs.gender_id = ge.gender_id
GROUP BY gender, age
ORDER BY gender, age;


--Ejercicio #8--------------------------------------------------

SELECT TO_CHAR (invoice_date,'YYYY/MM')AS año_mes, 
       COUNT(quantity)AS recuento, 
       AVG(price)AS precio_promedio
FROM customer_shopping  
GROUP BY TO_CHAR (invoice_date,'YYYY/MM')
ORDER BY TO_CHAR (invoice_date,'YYYY/MM');


--Ejercicio #9-----------------------------------------------

SELECT TO_CHAR(invoice_date,'YYYY/MM')AS año_mes,
	   AVG(price*quantity)AS promedio_facturado
FROM customer_shopping
GROUP BY TO_CHAR(invoice_date,'YYYY/MM')
ORDER BY TO_CHAR(invoice_date,'YYYY/MM');


--Ejercicio #10-----------------------------------------------

SELECT invoice_date, price*quantity AS ventas,category,
       shopping_mall, district, payment_method, age, gender
FROM customer_shopping AS cs
JOIN categories AS ca ON cs.category_id = ca.category_id
JOIN shopping_malls sm ON sm.shopping_mall_id = cs.shopping_mall_id
JOIN payment_methods pm ON cs.payment_method_id = pm.pmt_method_id
JOIN genders AS ge ON cs.gender_id = ge.gender_id
ORDER BY invoice_date;

--------------------------------------------------------------
--------------------------------------------------------------
                   /*Parte #2*/
----------------------------------------------------------------			   

SELECT invoice_no, invoice_date, shopping_mall, district,
       customer_id, gender, age, category, payment_method, 
	   quantity, price
FROM customer_shopping AS cs
JOIN categories AS ca ON cs.category_id = ca.category_id
JOIN shopping_malls sm ON sm.shopping_mall_id = cs.shopping_mall_id
JOIN payment_methods pm ON cs.payment_method_id = pm.pmt_method_id
JOIN genders AS ge ON cs.gender_id = ge.gender_id
ORDER BY invoice_date;

