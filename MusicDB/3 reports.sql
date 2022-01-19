use MusicRentalDB
go 

--1) I need to know if I have any repeat customers and what they rented
select CountOfCustomersPerInstrument = count(*), i.CustomerName, i.InstrumentName
from Instrument i 
group by i.CustomerName, i.InstrumentName

--2) I need to know the most popular category of instrument that has ever been rented
select top 1 CountOfInstrumentCatergory = count(*), i.InstrumentCatergory
from Instrument i
group by i.InstrumentCatergory
order by CountOfInstrumentCatergory desc

--3) I need to know which instrument (that is not being currently rented) made the most profit
select i.InstrumentName, i.InstrumentCatergory, i.DateRented, i.DateReturned, i.TotalProfit
from Instrument i 
where i.DateReturned is not null
order by i.TotalProfit desc

--4) I need to know which instruments were rented for only one month (so I could know if I should just sell them off)
select *
from Instrument i 
where datediff(month, DateRented, DateReturned) = 1