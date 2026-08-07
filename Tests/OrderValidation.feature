Feature: Sipariş Doğrulama ve Kabul Kriterleri Senaryoları

  Scenario: Pasif müşteri hesabı ile sipariş verilemez
    Given Müşterinin "IsCustomerActive" değeri "false" olarak tanımlanmıştır
    When Müşteri sipariş oluşturma isteği gönderdiğinde
    Then Sistem işlemi reddetmeli ve "Müşteri hesabı aktif değil." mesajı dönmelidir

  Scenario: Minimum sepet tutarının altındaki siparişler engellenir
    Given Sepet tutarı "50 TL" olarak belirlenmiştir
    And Minimum sipariş limiti "100 TL" olarak ayarlanmıştır
    When Müşteri siparişi tamamlamak istediğinde
    Then Sistem siparişi reddetmeli ve "Minimum sipariş tutarı 100 TL olmalıdır." mesajı dönmelidir

  Scenario: Stok miktarından fazla ürün talep edilemez
    Given Depodaki mevcut ürün stoku "2" adettir
    When Müşteri "5" adet ürün almak için istek gönderdiğinde
    Then Sistem "Yetersiz stok." uyarısı vermeli ve siparişi durdurmalıdır

  Scenario: Tüm koşullar sağlandığında sipariş onaylanır
    Given Müşteri hesabı aktiftir
    And Sepet tutarı "250 TL"dir
    And Depoda yeterli stok bulunmaktadır
    When Müşteri siparişi onayladığında
    Then Sipariş başarıyla oluşturulmalı ve "OrderApproved" statüsü dönmelidir
