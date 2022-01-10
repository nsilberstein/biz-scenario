--Reports:
--1) I need to know if I have any repeat customers and what they rented
select FullName=concat(i.CustomerFirstName,' ',i.CustomerLastName),NumberOfTimesCustomerRented= count(*)
from Instrument i 
group by concat(i.CustomerFirstName,' ',i.CustomerLastName)
--if u would have customers that came more than once you would see who and what they rented
having count(*) >1





--2)I need to know the most popular category of instrument that has ever been rented


select top 1  TotalMonthsRented=sum(i.NumberOfMonthsRented),i.Category
from instrument i 
group by Category
order by TotalMonthsRented desc



--3) I need to know which instrument (that is not being currently rented) made the most profit
select top 1  i.InstrumentName,TotalProfitPerInsrument=sum(i.Profit)
from Instrument i 
where i.Datereturned is not null 
group by InstrumentName
order by TotalProfitPerInsrument desc 






--4) I need to know which instruments were rented for only one month (so I could know if I should just sell
--them off)
select *
from Instrument i 
where i.NumberOfMonthsRented = 1 