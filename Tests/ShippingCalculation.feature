Feature: Dinamik Kargo Ücreti Hesaplama
  E-ticaret mağaza sahibinin seçtiği kargo stratejisine göre 
  sipariş kargo ücretinin doğru hesaplanması gerekmektedir.

  Scenario Outline: Mağaza Kargo Stratejisine Göre Ücret Hesaplama
    Given Mağazanın kargo stratejisi "" olarak ayarlanmıştır
    And Sabit kargo ücreti  TL ve bedava kargo limiti  TL'dir
    When Sipariş tutarı  TL ve toplam desi  olduğunda
    Then Hesaplanan kargo ücreti  TL olmalıdır

    Examples:
      | Strateji        | SabitUcret | Limit  | SepetTutari | Desi | BeklenenKargo |
      | Disabled        | 0.00       | 0.00   | 250.00      | 2.0  | 0.00          |
      | FlatRate        | 39.90      | 0.00   | 150.00      | 1.0  | 39.90         |
      | BasketThreshold | 49.90      | 500.00 | 600.00      | 3.0  | 0.00          |
      | BasketThreshold | 49.90      | 500.00 | 300.00      | 3.0  | 49.90         |
      | DesiBased       | 0.00       | 0.00   | 100.00      | 5.0  | 50.00         |
