CREATE EXTERNAL TABLE [SalesLT].[ext_salesorder] (
    [SalesOrderID] INT NULL,
    [SalesOrderDetailID] INT NULL,
    [OrderQty] INT NULL,
    [ProductID] INT NULL,
    [UnitPrice] FLOAT (53) NULL,
    [UnitPriceDiscount] FLOAT (53) NULL,
    [rowguid] NVARCHAR (1000) NULL,
    [ModifiedDate] NVARCHAR (1000) NULL
)
    WITH (
    DATA_SOURCE = [Cold_Lake],
    LOCATION = N'/SaleOrder.parquet',
    FILE_FORMAT = [ParquetFF]
    );


GO

