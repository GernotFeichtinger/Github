CREATE TABLE [SupplyChain].[Suppliers] (
    [SupplierID]         INT            IDENTITY (1, 1) NOT NULL,
    [SupplierName]       NVARCHAR (100) NOT NULL,
    [ContactName]        NVARCHAR (100) NULL,
    [Phone]              NVARCHAR (25)  NULL,
    [Email]              NVARCHAR (100) NULL,
    [SupplierLocationID] INT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NOT NULL,
    [CreatedDate]        DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([SupplierID] ASC)
);


GO

