CREATE TABLE [SupplyChain].[PurchaseOrderLines] (
    [PurchaseOrderLineID] INT             IDENTITY (1, 1) NOT NULL,
    [PurchaseOrderID]     INT             NOT NULL,
    [ProductID]           INT             NOT NULL,
    [OrderedQuantity]     INT             NOT NULL,
    [UnitCost]            DECIMAL (18, 2) NOT NULL,
    [LineTotal]           AS              ([OrderedQuantity]*[UnitCost]) PERSISTED,
    PRIMARY KEY CLUSTERED ([PurchaseOrderLineID] ASC),
    CONSTRAINT [FK_POL_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID]),
    CONSTRAINT [FK_POL_PurchaseOrders] FOREIGN KEY ([PurchaseOrderID]) REFERENCES [SupplyChain].[PurchaseOrders] ([PurchaseOrderID])
);


GO

