-- Sipariş Tablosuna Örnek Veri Ekleme
INSERT INTO Orders (TotalAmount, StockCount, IsCustomerActive)
VALUES 
(450.50, 12, 1), -- TC01: Başarılı Senaryo
(50.00, 10, 1),  -- TC02: Minimum Tutar Altı
(300.00, 0, 1),  -- TC03: Stok Yok
(200.00, 5, 0);  -- TC04: Müşteri Pasif

-- Kupon Tablosuna Örnek Veri Ekleme
INSERT INTO Coupons (CouponCode, IsActive, ExpiryDate, MinBasketAmount)
VALUES 
('BAHAR20', 1, '2026-12-31', 300.00), -- Geçerli Kupon
('ESKI10', 0, '2025-01-01', 100.00);  -- Süresi Dolmuş/Pasif Kupon

-- Mağaza Kargo Ayarları Örnek Verileri
INSERT INTO MerchantShippingConfigs (MerchantId, Strategy, FixedFee, FreeShippingThreshold, PricePerDesi)
VALUES 
(101, 2, 49.90, 500.00, 0.00), -- Mağaza 101: 500 TL Üzeri Bedava (BasketThreshold)
(102, 1, 39.90, 0.00, 0.00),   -- Mağaza 102: Sabit Kargo Ücretli (FlatRate)
(103, 3, 0.00, 0.00, 10.00),   -- Mağaza 103: Desi Başına 10 TL (DesiBased)
(104, 0, 0.00, 0.00, 0.00);    -- Mağaza 104: Kargo Yok / Mağazadan Teslim (Disabled)
