Feature: VIP Müşteri Sadakat İndirimi Senaryoları

  Scenario: Gold üyelere %20 otomatik indirim uygulanır
    Given Müşteri seviyesi "Gold" olarak tanımlanmıştır
    And Müşterinin sepet tutarı "1000 TL"dir
    When Müşteri ödeme adımına geçtiğinde
    Then Ödenecek toplam tutar %20 indirimle "800 TL" olarak hesaplanmalıdır

  Scenario: Silver üyelere %10 otomatik indirim uygulanır
    Given Müşteri seviyesi "Silver" olarak tanımlanmıştır
    And Müşterinin sepet tutarı "1000 TL"dir
    When Müşteri ödeme adımına geçtiğinde
    Then Ödenecek toplam tutar %10 indirimle "900 TL" olarak hesaplanmalıdır
