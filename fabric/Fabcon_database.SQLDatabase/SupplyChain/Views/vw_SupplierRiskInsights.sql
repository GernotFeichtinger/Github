-- Create view: SupplyChain.vw_SupplierRiskInsights
-- Purpose: Provides supplier risk insights by joining Suppliers and SupplierPerformance tables
-- Includes risk categorization based on RiskScore

CREATE VIEW SupplyChain.vw_SupplierRiskInsights AS
SELECT
    s.SupplierID,
    s.SupplierName,
    sp.OnTimeDeliveryRate,
    sp.QualityScore,
    sp.RiskScore,
    CASE 
        WHEN sp.RiskScore >= 40 THEN 'High Risk'
        WHEN sp.RiskScore >= 20 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS RiskCategory
FROM 
    SupplyChain.Suppliers s
    INNER JOIN SupplyChain.SupplierPerformance sp 
        ON s.SupplierID = sp.SupplierID;

GO

