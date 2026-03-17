CREATE TABLE [SupplyChain].[PurchaseOrders] (
    [PurchaseOrderID]      INT             IDENTITY (1, 1) NOT NULL,
    [SupplierID]           INT             NOT NULL,
    [OrderDate]            DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [ExpectedDeliveryDate] DATETIME2 (7)   NULL,
    [Status]               NVARCHAR (50)   DEFAULT ('Open') NOT NULL,
    [TotalAmount]          DECIMAL (18, 2) NULL,
    PRIMARY KEY CLUSTERED ([PurchaseOrderID] ASC),
    CONSTRAINT [FK_PurchaseOrders_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [SupplyChain].[Suppliers] ([SupplierID])
);


GO

