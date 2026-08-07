-- ====================================================================
-- ORDER VALIDATION SERVICE - İŞ ANALİSTİ DENETİM & DOĞRULAMA SORGU KÜTÜPHANESİ
-- ====================================================================

-- 1. TEMEL KURAL KONTROLLERİ (BASIC RULES)
----------------------------------------------------------------------
-- Pasif Müşterilerin Verdiği İptal Edilecek Siparişler
SELECT OrderId, TotalAmount, IsCustomerActive, CreatedDate
FROM Orders 
WHERE IsCustomerActive = 0;

-- Minimum Sepet Limitinin (100 TL) Altında Kalan Siparişler
SELECT OrderId, TotalAmount, CreatedDate
FROM Orders 
WHERE TotalAmount < 100.00;

-- Kullanım Süresi Dolmuş veya Pasif Kuponlar
SELECT CouponCode, IsActive, ExpiryDate, MinBasketAmount
FROM Coupons 
WHERE IsActive = 0 OR ExpiryDate < GETDATE();


-- 2. RISK VE ANOMALİ TESPİTİ (RISK & ANOMALY DETECTION)
----------------------------------------------------------------------
-- Stok Sınırında Olan veya Stok Yetersizliği Yaşayabilecek Ürün/Siparişler
SELECT OrderId, StockCount, TotalAmount
FROM Orders
WHERE StockCount <= 2 AND StockCount > 0;

-- Sınır Değer (Boundary) Kontrolü: 99 TL ile 101 TL Arasındaki Siparişler
-- (İş Kurallarının Sınır Testlerinde Analistlerin En Çok Baktığı Tutar Aralığı)
SELECT OrderId, TotalAmount, IsCustomerActive
FROM Orders
WHERE TotalAmount BETWEEN 99.00 AND 101.00;


-- 3. PERFORMANS VE METRİK RAPORLAMA (ANALYTICS & AGGREGATIONS)
----------------------------------------------------------------------
-- Günlük Toplam Sipariş Hacmi ve Ortalama Sepet Tutarı
SELECT 
    CAST(CreatedDate AS DATE) AS SiparisTarihi,
    COUNT(OrderId) AS ToplamSiparisSayisi,
    AVG(TotalAmount) AS OrtalamaSepetTutari,
    SUM(TotalAmount) AS ToplamCiro
FROM Orders
GROUP BY CAST(CreatedDate AS DATE)
ORDER BY SiparisTarihi DESC;

-- Geçerli ve Yakında Süresi Dolacak Kuponların Listesi (Önümüzdeki 30 Gün)
SELECT CouponCode, ExpiryDate, MinBasketAmount
FROM Coupons
WHERE IsActive = 1 
  AND ExpiryDate BETWEEN GETDATE() AND DATEADD(day, 30, GETDATE());
