CREATE DEFINER=`root`@`localhost` PROCEDURE `proc`()
BEGIN
select report.supplier_id,report.supp_name,report.Average,
case
when report.Average = 5 then 'Excellent Service'
when report.Average >4 then 'Good Service'
when report.Average >2 then 'Average Service'
else 'Poor Service'
END as Type_of_Service from (select final.supplier_id, supplier.supp_name,final.Average from 
(select test2.supplier_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from 
(select supplierpricing.supplier_id, test.ord_id,test.rat_ratstars from supplierpricing inner join
(select orders.pricing_id, rating.ord_id, rating.rat_ratstars from orders inner join rating on rating.ord_id = orders.ord_id)
as test on test.pricing_id = supplierpricing.pricing_id)
as test2 group by supplierpricing.supplier_id)
as final inner join supplier where final.supplier_id = supplier.supplier_id) as report;
END