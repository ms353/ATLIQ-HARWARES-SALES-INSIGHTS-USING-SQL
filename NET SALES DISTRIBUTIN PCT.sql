# here we cannogt generate another derived column from alredy generated derived column

#---------------------------------------
with cte1 as(


select
                     customer, 
                     round(sum(net_sales)/1000000,2) as net_sales_mln
        	from gdb0041.net_sales n 
        	join dim_customer c
                on n.customer_code=c.customer_code
        	where 
		    fiscal_year=2021
               
        	group by customer)
            select
            *,
     net_sales_mln*100/sum(net_sales_mln) over() as pct
     from cte1
        	order by net_sales_mln desc;
            
            
            