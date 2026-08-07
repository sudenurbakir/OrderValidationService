# İş Gereksinimleri Dokümanı (BRD)

## 1. Fonksiyonel Gereksinimler (Functional Requirements - FR)
* **FR-01:** Sistem, 100 TL altındaki siparişlerin tamamlanmasına izin vermemelidir.
* **FR-02:** Pasif kullanıcıların sipariş oluşturma istekleri API seviyesinde engellenmelidir.
* **FR-03:** Gold üyelere %20, Silver üyelere %10 VIP indirimi otomasyonla uygulanmalıdır.
* **FR-04:** Geçerlilik süresi dolmuş kupon kodları sepete tanımlanamamalıdır.

## 2. Fonksiyonel Olmayan Gereksinimler (Non-Functional Requirements - NFR)
* **NFR-01 (Performans):** Doğrulama servisi gelen istekleri maksimum **200 ms** içerisinde yanıtlamalıdır.
* **NFR-02 (Güvenlik):** API istekleri yetkisiz erişimlere karşı Bearer Token ile doğrulanmalıdır.
* **NFR-03 (Erişilebilirlik):** Servis %99.9 çalışma süresi (uptime) oranına sahip olmalıdır.
