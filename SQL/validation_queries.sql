-- 1. Pasif Müşterilerin Verdiği İptal Edilecek Siparişleri Bulma
SELECT * FROM Orders 
WHERE IsCustomerActive = 0;

-- 2. Minimum Sepet Limitinin (100 TL) Altında Kalan Siparişleri Listeleme
SELECT * FROM Orders 
WHERE TotalAmount < 100.00;

-- 3. Kullanım Süresi Dolmuş veya Pasif Kuponları Sorgulama
SELECT * FROM Coupons 
WHERE IsActive = 0 OR ExpiryDate < GETDATE();
