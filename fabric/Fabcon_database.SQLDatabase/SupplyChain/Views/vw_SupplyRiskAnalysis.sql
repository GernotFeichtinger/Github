CREATE VIEW SupplyChain.vw_SupplyRiskAnalysis AS
SELECT
    w.ProductID,
    s.SupplierName,
    w.QuantityOnHand,
    sp.RiskScore,
    CASE
        WHEN w.QuantityOnHand < 20 AND sp.RiskScore > 30 THEN 'High Supply Risk'
        WHEN w.QuantityOnHand < 50 THEN 'Potential Risk'
        ELSE 'Stable'
    END AS SupplyRiskLevel
FROM
    SupplyChain.Warehouse w
    INNER JOIN SupplyChain.Suppliers s ON w.SupplierID = s.SupplierID
    INNER JOIN SupplyChain.SupplierPerformance sp ON s.SupplierID = sp.SupplierID;

GO

