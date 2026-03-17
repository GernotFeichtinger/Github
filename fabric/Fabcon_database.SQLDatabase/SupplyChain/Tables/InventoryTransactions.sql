CREATE TABLE [SupplyChain].[InventoryTransactions] (
    [InventoryTransactionID] INT           IDENTITY (1, 1) NOT NULL,
    [ProductID]              INT           NOT NULL,
    [WarehouseID]            INT           NULL,
    [TransactionType]        NVARCHAR (50) NOT NULL,
    [Quantity]               INT           NOT NULL,
    [TransactionDate]        DATETIME2 (7) DEFAULT (sysdatetime()) NOT NULL,
    [ReferenceID]            INT           NULL,
    PRIMARY KEY CLUSTERED ([InventoryTransactionID] ASC),
    CONSTRAINT [FK_Inventory_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);


GO

