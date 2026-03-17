CREATE TABLE [SupplyChain].[Warehouse] (
    [ProductID]          INT NOT NULL,
    [ComponentID]        INT NULL,
    [SupplierID]         INT NULL,
    [SupplierLocationID] INT NULL,
    [QuantityOnHand]     INT NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC)
);


GO

