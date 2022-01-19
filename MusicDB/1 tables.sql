use MusicRentalDB
go
drop table if exists Instrument
go 
create table dbo.Instrument(
    InstrumentId int not null primary key identity,
    CustomerName varchar(50) not null constraint instrument_Customer_Name_cannot_be_blank check(CustomerName <> ''),
    InstrumentName varchar(20) not null constraint instrument_InstrumentName_cannot_be_blank check(InstrumentName <> ''),
    InstrumentCatergory varchar(20) not null constraint instrument_InstrumentCatergory_cannot_be_blank check(InstrumentCatergory <> ''),
    InstrumentCode as concat(substring(InstrumentName, 1,3), substring(InstrumentCatergory,1,3)),
    MonthlyRentalFee decimal(6,2) not null constraint ck_instrument_Monthlyrentalfee_must_be_greater_than_zero check(MonthlyRentalFee > 0),
    DateRented date not null constraint ck_instrument_daterented_cannot_be_in_the_future check(DateRented <= getdate()),
    DateReturned date null constraint ck_instrument_datereturned_cannot_be_in_the_future check(DateReturned <= getdate()),
    TotalProfit as datediff(month, DateRented, DateReturned) * MonthlyRentalFee,
    DateInserted datetime not null default getdate(),
    constraint ck_Date_Returned_must_be_after_Date_Rented check(DateReturned between DateRented and getdate()),
    constraint ck_instrument_min_month_rental_is_1_and_max_is_12 check(datediff(month, DateRented, DateReturned) between 1 and 12),
    constraint u_instrument_customername_daterented_instrumentname_instrumentcategory unique (CustomerName, DateRented, InstrumentName, InstrumentCatergory)
)
go
