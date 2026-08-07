# Sipariş Doğrulama Test Karar Tablosu (Decision Table)

| Test Case ID | Müşteri Aktif mi? | Sepet Tutarı (TL) | Stok / İstenen | Beklenen Sonuç (Expected Result) | Senaryo Tipi |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **TC01** | `false` | 150 | 10 / 2 | **RED:** Müşteri hesabı aktif değil. | Negative Flow |
| **TC02** | `true` | 50 | 10 / 2 | **RED:** Minimum sepet tutarı 100 TL olmalıdır. | Boundary (99.99 TL) |
| **TC03** | `true` | 100 | 2 / 5 | **RED:** Yetersiz stok. | Boundary Check |
| **TC04** | `true` | 100 | 5 / 5 | **ONAY:** Sipariş başarıyla oluşturuldu. | Boundary Value (Tam Stok) |
| **TC05** | `true` | 450 | 12 / 2 | **ONAY:** Sipariş başarıyla oluşturuldu. | Happy Path |
