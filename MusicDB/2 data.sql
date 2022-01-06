Use MusicDB
go
delete rental 

insert rental(CustomerName, InstrumentName, InstrumentCatergory, MonthlyRentalFee, DateRented, DateReturned)
select 'Esther Shields', 'Flute', 'Wind', 30, '01/01/2021', '05/03/2021'
union select 'Mendy Weiss', 'Violin', 'String', 40, '06/07/2019', '02/16/2020'
union select 'Rochel Silber', 'French Horn', 'Brass', $70, '03/29/2021', '04/28/2021'
union select 'Sari Cohn', 'Clarinet', 'Wind', 35, '07/12/2020', '10/14/2020'
union select 'Yaakov Kleinman', 'Guitar', 'String', 42, '09/12/2020', '04/24/2021'
union select 'Shmuli David', 'Piano', 'Percussion', 65, '03/23/2019', '08/15/2019'
union select 'Baila Weitz', 'Trumpet', 'Wind', 53, '05/03/2020', '12/29/2020'
union select 'Hadassah Gruber', 'Guitar', 'String', 42, '01/03/2020', '09/28/2020'
union select 'Rivkala Scheiner', 'Violin', 'String', 40, '05/24/2021', '01/01/2022'
--union select 'Chaya Faiga Rothstein', 'Clarinet', 'Wind', 35, '10/18/2020', '09/16/2020'
union select 'Tehilah Katz', 'Guitar', 'String', 42, '02/13/2021', '04/12/2021'
union select 'Tehilah Katz', 'Guitar', 'String', 42, '02/13/2021', '02/14/2021'


select * from rental r 


select r.InstrumentName, TotalAmountOfInstruments = count(r.InstrumentName)
from rental r 
group by r.InstrumentName
order by TotalAmountOfInstruments desc

select *
from rental r 
where day(DateReturned) - day(DateRented) <= 30 and year(DateRented) = year(DateReturned) and month(DateReturned) - month(DateRented) <= 1
