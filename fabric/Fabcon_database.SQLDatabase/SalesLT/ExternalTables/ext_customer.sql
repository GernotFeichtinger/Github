CREATE EXTERNAL TABLE [SalesLT].[ext_customer] (
    [CustomerID] INT NULL,
    [NameStyle] INT NULL,
    [Title] VARCHAR (10) NULL,
    [FirstnName] VARCHAR (100) NULL,
    [MiddleName] NVARCHAR (100) NULL,
    [LastName] VARCHAR (100) NULL,
    [Suffix] VARCHAR (10) NULL,
    [CompanyName] VARCHAR (256) NULL,
    [SalesPerson] VARCHAR (100) NULL,
    [EmailAddress] VARCHAR (256) NULL,
    [Phone] VARCHAR (50) NULL,
    [PasswordHash] NCHAR (256) NULL,
    [rowguid] NVARCHAR (100) NULL,
    [ModifiedDate] VARCHAR (100) NULL
)
    WITH (
    DATA_SOURCE = [Cold_Lake],
    LOCATION = N'/Customer.parquet',
    FILE_FORMAT = [ParquetFF]
    );


GO

