use MusicDB
go
drop table if exists Rental
go 

create table dbo.Rental (
    RentalId int not null primary key identity,
    CustomerName varchar(50) not null constraint rental_Customer_Name_cannot_be_blank check(CustomerName <> ''),
    InstrumentName varchar(20) not null constraint rental_Instrument_Name_cannot_be_blank check(InstrumentName <> ''),
    InstrumentCatergory varchar(20) not null constraint rental_Instrument_Catergory_cannot_be_blank check(InstrumentCatergory <> ''),
    InstrumentCode as concat(SUBSTRING(InstrumentName, 1,3), SUBSTRING(InstrumentCatergory,1,3)),
    MonthlyRentalFee decimal(2,0) not null constraint ck_rental_Monthly_rental_fee_must_be_greater_than_zero check(MonthlyRentalFee > 0),
    DateRented date not null,
    DateReturned date null,
    --TotalProfit as (datepart(month, DateReturned) -  datepart(month, DateRented)) * MonthlyRentalFee,
    DateInserted datetime default GETDATE(),
    constraint ck_Date_Returned_must_be_after_Date_Rented check(DateReturned between DateRented and getdate()),
    --Need to fix this constraint.
    --constraint ck_rental_Date_Returned_is_greater_than_a_month_and_less_then_a_year check(datepart(month, DateReturned) > datepart(month, DateRented))
)

go

--insert rental(CustomerName, InstrumentName, InstrumentCatergory, MonthlyRentalFee, DateRented, DateReturned)
--select 'Esther Shields', 'Flute', 'Wind', 30, '01/01/2021', '01/03/2022'


insert rental(CustomerName, InstrumentName, InstrumentCatergory, MonthlyRentalFee, DateRented, DateReturned)
select 'Esther Shields', 'Flute', 'Wind', 30, '01/01/2021', '05/03/2021'
union select 'Mendy Weiss', 'Violin', 'String', 40, '06/07/2019', '02/16/2020'
union select 'Rochel Silber', 'French Horn', 'Brass', $70, '03/29/2021', '04/28/2021'
union select 'Sari Cohn', 'Clarinet', 'Wind', 35, '07/12/2020', '10/14/2020'
union select 'Yaakov Kleinman', 'Guitar', 'String', 42, '09/12/2020', '04/24/2021'
union select 'Shmuli David', 'Piano', 'Percussion', 65, '03/23/2019', '08/15/2019'
union select 'Baila Weitz', 'Trumpet', 'Wind', 53, '05/03/2020', '12/29/2020'
union select 'Hadassah Gruber', 'Guitar', 'String', 42, '01/03/2020', '09/28/2020'
--union select 'Rivkala Scheiner', 'Violin', 'String', 40, '05/24/2021', '01/01/2022'
--union select 'Chaya Faiga Rothstein', 'Clarinet', 'Wind', 35, '10/18/2020', '09/16/2020'
union select 'Tehilah Katz', 'Guitar', 'String', 42, '02/13/2021', '04/12/2021'
union select 'Tehilah Katz', 'Guitar', 'String', 42, '02/13/2021', '02/14/2021'


select * from rental r 
