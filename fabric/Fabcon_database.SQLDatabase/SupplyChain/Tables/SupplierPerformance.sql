CREATE TABLE [SupplyChain].[SupplierPerformance] (
    [SupplierPerformanceID] INT            IDENTITY (1, 1) NOT NULL,
    [SupplierID]            INT            NOT NULL,
    [EvaluationDate]        DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [OnTimeDeliveryRate]    DECIMAL (5, 2) NULL,
    [QualityScore]          DECIMAL (5, 2) NULL,
    [AverageLeadTimeDays]   INT            NULL,
    [RiskScore]             DECIMAL (5, 2) NULL,
    [AIInsight]             NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([SupplierPerformanceID] ASC),
    CONSTRAINT [FK_SupplierPerformance_Supplier] FOREIGN KEY ([SupplierID]) REFERENCES [SupplyChain].[Suppliers] ([SupplierID])
);


GO

