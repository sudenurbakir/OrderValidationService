## ShippingFeeCalculator

`ShippingFeeCalculator`, mağazanın seçtiği kargo stratejisine göre siparişin kargo ücretini hesaplar.

Desteklenen kargo stratejileri:

* **Disabled:** Kargo ücreti 0 TL olarak hesaplanır.
* **FlatRate:** Tanımlanan sabit kargo ücreti uygulanır.
* **BasketThreshold:** Sepet tutarı ücretsiz kargo limitine ulaştığında kargo ücretsiz olur; ulaşmadığında sabit ücret uygulanır.
* **DesiBased:** Toplam desi ile desi başına ücret çarpılarak kargo ücreti hesaplanır.

### İş Kuralları

* Kargo devre dışıysa ücret `0 TL` olmalıdır.
* Sabit ücretli kargoda tanımlanan sabit ücret uygulanmalıdır.
* Ücretsiz kargo limitine ulaşan siparişlerde kargo ücretsiz olmalıdır.
* Desi bazlı kargoda `Toplam Desi × Desi Birim Ücreti` formülü kullanılmalıdır.

### Örnek

Sepet tutarı **350 TL**, ücretsiz kargo limiti **500 TL** ve sabit kargo ücreti **59,90 TL** ise:

**350 < 500 → Kargo Ücreti = 59,90 TL**

Bu sınıf, kargo konfigürasyonunu kullanarak ilgili iş kurallarına göre kargo ücretini hesaplamaktadır.
