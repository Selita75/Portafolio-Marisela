WITH total_max_table AS (SELECT sub.region_name reg_name, MAX(total_by_srep_and_region) max_by_region
                         FROM (SELECT r.name region_name, s.name reps_name, SUM(o.total_amt_usd) total_by_srep_and_region
						 		FROM orders o
								JOIN accounts a
								ON o.account_id = a.id
								JOIN sales_reps s
								ON a.sales_rep_id = s.id
								JOIN region r
								ON s.region_id = r.id
								GROUP BY region_name, reps_name
								ORDER BY SUM(o.total_amt_usd) DESC)sub
						  GROUP BY 1),

	 total_sum_table AS (SELECT r.name region_name, s.name reps_name, SUM(o.total_amt_usd) total_by_srep_and_region
	 					 FROM orders o
						 JOIN accounts a
						 ON o.account_id = a.id
						 JOIN sales_reps s
						 ON a.sales_rep_id = s.id
						 JOIN region r
						 ON s.region_id = r.id
						 GROUP BY region_name, reps_name
						 ORDER BY SUM(o.total_amt_usd) DESC)

SELECT reg_name, reps_name, max_by_region
FROM total_max_table
JOIN total_sum_table
ON total_sum_table.region_name = total_max_table.reg_name AND total_sum_table.total_by_srep_and_region = total_max_table.max_by_region
GROUP BY 1,2,3
ORDER BY 3 DESC
;