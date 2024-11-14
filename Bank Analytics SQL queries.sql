create database bankanalyst ;

use  bankanalyst ;
show tables;
select * from finance_1;
select * from finance_2;

alter table finance_1 rename column ï»¿id to id;

alter table finance_2 rename column ï»¿id to id;

/*1. year wise loan amount
2. Grade-Subgrade wise revolution balance
3. Total Payment for Verified status vs non verified status
4. state wise last credit pull_d wise loan status
5. Home Ownership vs last payment date stats.*/

-- kpi1

select year(issue_D) as Year_of_issue_d, sum(loan_amnt) as Total_loan_amnt
from finance_1
group by Year_of_issue_d
order by Year_of_issue_d;

-- kpi2

select
grade,sub_grade, sum(revol_bal) as total_revol_bal
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by grade,sub_grade
order by grade,sub_grade;

-- kpi3

select verification_status,round(sum(total_pymnt),2) as total_payment
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by verification_status;

-- kpi4

select addr_state,last_Credit_pull_D,loan_Status
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by addr_state,last_Credit_pull_D,loan_Status
order by last_Credit_pull_D;

-- kpi5

select home_ownership,last_pymnt_d
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by
home_ownership,last_pymnt_d
order by
home_ownership,last_pymnt_d;





