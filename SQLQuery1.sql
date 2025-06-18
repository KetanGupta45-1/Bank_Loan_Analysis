use
    Bank_Loan_DB

select*
    from bank_loan_dataset;

--total application
select 
    count(id)
as total_applications
    from bank_loan_dataset

--total application by month
select 
    year(issue_date) as year,
    datename(month, issue_date) as month,
    count(id) as total_loan_applications_by_month
from 
    bank_loan_dataset
group by 
    year(issue_date), datename(month, issue_date)
order by 
    year(issue_date), month(issue_date);

--total capital given as loan by bank
select
sum(loan_amount) as total_fund_raised
from 
bank_loan_dataset;

--total capital given by bank per month as loan
select
    sum(loan_amount) as total_fund_raised,
    year(issue_date) as year,
    datename(month, issue_date) as month
from 
    bank_loan_dataset
group by
    year(issue_date), datename(month, issue_date), month(issue_date)
order by
    year(issue_date), month(issue_date);

-- total capital received by months
select
    sum(total_payment) as total_fund_received,
    year(issue_date) as year,
    datename(month, issue_date) as month
from 
    bank_loan_dataset
group by
    year(issue_date), datename(month, issue_date), month(issue_date)
order by
    year(issue_date), month(issue_date);

-- Average interest rate over the  months
select
    round(avg(int_rate), 4)*100 as Average_Inetrest_Rate,
    year(issue_date) as year,
    datename(month, issue_date) as month
from 
    bank_loan_dataset
group by
    year(issue_date), datename(month, issue_date), month(issue_date)
order by
    year(issue_date), month(issue_date);

-- Average debt to interest rate over the  months
select
    round(avg(dti), 4)*100 as Average_Debt_To_Interest_Rate,
    year(issue_date) as year,
    datename(month, issue_date) as month
from 
    bank_loan_dataset
group by
    year(issue_date), datename(month, issue_date), month(issue_date)
order by
    year(issue_date), month(issue_date);

--total good and bad application
select
    count(id) as total,
    count(case when loan_status in ('Fully Paid', 'Current') then 1 end) as good_application,
    count(case when loan_status not in ('Fully Paid', 'Current') then 1 end) as good_application
from
    bank_loan_dataset

-- good and bad application percentage
select
    count(id) as total,
    round(100.0 * count(case when loan_status in ('Fully Paid', 'Current') then 1 end) / count(id), 5) as good_application,
    round(100.0 * count(case when loan_status not in ('Fully Paid', 'Current') then 1 end) / count(id), 5) as bad_application
from
    bank_loan_dataset

-- total capital funded in good and bad application
select
    sum(loan_amount) as total_amount,
    sum(case when loan_status in ('Fully Paid', 'Current') then loan_amount else 0 end) as total_capital_in_good_application,
    sum(case when loan_status = 'Charged Off' then loan_amount else 0 end) as total_capital_in_bad_application,
    100.0 * sum(case when loan_status IN ('Fully Paid', 'Current') then loan_amount else 0 end) / sum(loan_amount) AS good_capital_percent,
    100.0 * sum(case when loan_status = 'Charged Off' then loan_amount else 0 end) / sum(loan_amount) AS bad_capital_percent
FROM
    bank_loan_dataset

-- total capital received in food and bad application
select
    sum(total_payment) as total_amount,
    sum(case when loan_status in ('Fully Paid', 'Current') then total_payment else 0 end) as total_capital_in_good_application,
    sum(case when loan_status = 'Charged Off' then total_payment else 0 end) as total_capital_in_bad_application,
    100.0 * sum(case when loan_status IN ('Fully Paid', 'Current') then total_payment else 0 end) / sum(total_payment) AS good_capital_percent,
    100.0 * sum(case when loan_status = 'Charged Off' then total_payment else 0 end) / sum(total_payment) AS bad_capital_percent
FROM
    bank_loan_dataset

-- overall analysis by months
select
    loan_status,
    year(issue_date) as year,
    datename(month, issue_date) as month,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_capital,
    sum(total_payment) as total_received_capital,
    avg(int_rate * 100) as average_interest_rate,
    avg(dti * 100) as average_dti_rate
from
    bank_loan_dataset
group by
    loan_status, year(issue_date), datename(month, issue_date), month(issue_date)
order by
    year, month(issue_date)



select
    datename(month, issue_date) as month,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_capital,
    sum(total_payment) as total_received_capital
from
    bank_loan_dataset
group by
    month(issue_date), datename(month, issue_date)
order by
    month(issue_date)



select
    address_state,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_capital,
    sum(total_payment) as total_received_capital
from
    bank_loan_dataset
group by
    address_state
order by
    sum(loan_amount) desc



select
    emp_length,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_capital,
    sum(total_payment) as total_received_capital
from
    bank_loan_dataset
group by
    emp_length
order by
     count(id) desc


select
    purpose,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_capital,
    sum(total_payment) as total_received_capital
from
    bank_loan_dataset
group by
    purpose
order by
     count(id) desc 


select
    purpose,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_capital,
    sum(total_payment) as total_received_capital
from
    bank_loan_dataset
group by
    purpose
order by
     sum(loan_amount) desc 



select
    home_ownership,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_capital,
    sum(total_payment) as total_received_capital
from
    bank_loan_dataset
group by
    home_ownership
order by
     sum(loan_amount) desc
     


select
    home_ownership,
    count(id) as total_loan_application,
    sum(loan_amount) as total_funded_capital,
    sum(total_payment) as total_received_capital
from
    bank_loan_dataset
group by
    home_ownership
order by
     count(id) desc 
