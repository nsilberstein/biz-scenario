use InstrumentDB 
go
drop table if exists Instrument
go 
create table dbo.Instrument(
InstrumentID int not null identity primary key ,
CustomerFirstName varchar (50) not null constraint ck_Customer_First_Name_cannot_be_blank check (CustomerFirstName<>''),
CustomerLastName varchar (50) not null constraint ck_Customer_Last_Name_cannot_be_blank check (CustomerLastName <>''),
InstrumentName varchar(50) not null constraint ck_Instrument_Name_cannot_be_blank check(InstrumentName<>''),
Category varchar(50) not null constraint ck_Instrument_Category_Cannot_be_blank check (Category<>''),
InstrumentCode as concat (substring(CustomerFirstName,1,3),substring(Category,1,3)) persisted,
MonthlyRentalFee decimal (5,2) not null constraint ck_Monthly_Rental_Fee_must_be_greater_then_zero check (MonthlyRentalFee >0),
DateRented datetime  not null,
Datereturned datetime,
Profit as case when Datereturned is null then null
                when DateReturned is not null then DATEDIFF(month,DateRented,Datereturned) * MonthlyRentalFee
                 end persisted,
NumberOfMonthsRented as DATEDIFF(month,DateRented,Datereturned) persisted,
Constraint Ck_DateRented_must_be_before_DateReturned check (DateRented< DateReturned),
Constraint ck_DateReturned_and_profit_must_either_both_be_null_or_both_not check ((Datereturned is null and Profit is null) or (Datereturned is not null and Profit is not null)),
Constraint ck_Number_Of_Months_Rented_between_1_and_12 check (DATEDIFF(month,DateRented,Datereturned) between 1 and 12)

)