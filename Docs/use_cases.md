# UC-01: Sipariş Doğrulama ve Oluşturma Use Case

**Aktörler:** Müşteri, OrderValidationService, Ödeme Altyapısı  
**Ön Koşul (Pre-condition):** Müşteri sepete ürün eklemiş ve ödeme adımına geçmiş olmalıdır.  
**Son Koşul (Post-condition):** Sipariş `OrderApproved` durumuna geçer veya ilgili hata mesajı ile reddedilir.

---

## Ana Akış (Happy Path)
1. Müşteri "Siparişi Onayla" butonuna basar.
2. Sistem müşterinin aktiflik durumunu kontrol eder (`IsCustomerActive == true`).
3. Sistem sepet tutarının minimum 100 TL olduğunu doğrular.
4. Sistem depodaki stok miktarını kontrol eder.
5. Varsa kupon ve VIP sadakat indirimleri uygulanır.
6. Sipariş onaylanır ve ödeme adımına yönlendirilir.

## Alternatif ve İstisnai Akışlar (Alternate & Exception Flows)

* **A1: Müşteri Hesabı Pasif**
  * 2a. Müşteri hesabı pasif ise sistem işlemi durdurur.
  * 2b. Müşteriye "Hesabınız pasif durumdadır." uyarısı gösterilir.

* **A2: Yetersiz Sepet Tutarı**
  * 3a. Sepet tutarı 100 TL'nin altında ise sistem siparişi reddeder.
  * 3b. Müşteriye "Minimum sepet tutarı 100 TL olmalıdır." uyarısı döner.

* **A3: Yetersiz Stok**
  * 4a. Talep edilen miktar mevcut stoktan fazla ise işlem iptal edilir.
  * 4b. Müşteriye stok yetersizliği bilgisi verilir.
