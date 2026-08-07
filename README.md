# Order Validation Service

Bu proje, bir e-ticaret sistemindeki sipariş doğrulama iş kurallarının C# dilindeki nesne yönelimli ve mantıksal karşılığını modellemek amacıyla hazırlanmıştır.

## İş Kuralları (Acceptance Criteria)
1. **Müşteri Durumu:** `IsCustomerActive` değeri `false` olan kullanıcılar için sipariş süreci durdurulur.
2. **Stok Kontrolü:** İstenen ürün miktarı (`requestedQuantity`), mevcut stoktan (`StockCount`) fazla ise işlem engellenir.
