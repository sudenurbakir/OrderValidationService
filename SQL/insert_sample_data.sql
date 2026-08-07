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
