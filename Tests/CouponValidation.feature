Feature: İndirim Kuponu Doğrulama Senaryoları

  Scenario: Süresi dolmuş kupon kullanılamaz
    Given Kuponun son kullanma tarihi geçmiş bir tarihtir
    When Müşteri "INDIRIM20" kupon kodunu uyguladığında
    Then Sistem "Kupon kodunun kullanım süresi dolmuş." uyarısı vermelidir

  Scenario: Minimum sepet tutarını karşılamayan kupon reddedilir
    Given Kuponun minimum kullanım limiti "300 TL"dir
    And Müşterinin mevcut sepet tutarı "200 TL"dir
    When Müşteri kupon kodunu girdiğinde
    Then Sistem "Bu kupon sadece 300 TL ve üzeri sepetlerde geçerlidir." mesajı dönmelidir

  Scenario: Geçerli kupon başarıyla sepete uygulanır
    Given Kupon aktiftir ve son kullanma tarihi geçerlidir
    And Sepet tutarı minimum limitin üzerindedir
    When Müşteri kuponu tanımladığında
    Then Sepet tutarına %20 indirim yansıtılmalıdır
