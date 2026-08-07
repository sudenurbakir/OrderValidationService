# Sipariş Doğrulama Süreç Akış Diyagramı (Workflow)

Bu doküman, `OrderValidationService` içerisindeki karar mekanizmalarını ve iş kurallarını görselleştirmektedir.

```mermaid
graph TD
    A[Müşteri Sipariş İsteği Gönderir] --> B{Müşteri Aktif mi?}
    
    B -- Hayır (IsCustomerActive = false) --> C[İptal: Müşteri Hesabı Pasif]
    B -- Evet --> D{Sepet Tutarı >= 100 TL mi?}
    
    D -- Hayır --> E[İptal: Minimum Sepet Limiti Altında]
    D -- Evet --> F{Stok Yeterli mi?}
    
    F -- Hayır (Requested > Stock) --> G[İptal: Yetersiz Stok]
    F -- Evet --> H{İndirim Kuponu Var mı?}
    
    H -- Evet --> I{Kupon Geçerli & Süresi Uygun mu?}
    I -- Hayır --> J[Kupon Reddedildi / İndirimsiz Devam]
    I -- Evet --> K[Kupon İndirimi Uygula]
    
    H -- Hayır --> L{Müşteri VIP Seviyesi Var mı?}
    K --> L
    J --> L
    
    L -- Gold (%20) / Silver (%10) --> M[Sadakat İndirimi Uygula]
    L -- Standard --> N[Siparişi Onayla]
    M --> N[Siparişi Onayla: OrderApproved]
