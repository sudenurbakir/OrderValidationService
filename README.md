# Order Validation Service

Bu proje; bir e-ticaret sistemindeki iş kurallarının (Business Rules), kabul kriterlerinin (Acceptance Criteria) ve doğrulama mantıklarının (Validation) bir **İş Analisti** perspektifiyle yazılım mimarisi, veritabanı, test ve dokümantasyon katmanlarında nasıl modellendiğini gösteren uçtan uca bir portfolyo çalışmasıdır.

---

## Proje Mimari Yapısı 
```text
OrderValidationService/
├── Models/                     # Data Transfer Objects & Veri Modelleri
│   ├── Order.cs
│   ├── OrderStatus.cs
│   └── OrderResponse.cs
├── Services/                   # C# İş Kuralları & Validator Servisleri
│   ├── OrderValidator.cs
│   ├── CouponValidator.cs
│   └── LoyaltyService.cs
├── Payloads/                   # API Örnek Test JSON Verileri
│   ├── sample-request.json
│   └── sample-failed-request.json
├── Tests/                      # BDD Senaryoları & Test Dokümantasyonu
│   ├── OrderValidation.feature
│   ├── CouponValidation.feature
│   ├── LoyaltyDiscount.feature
│   ├── OrderValidatorTests.cs
│   └── TestCaseMatrix.md
├── SQL/                        # Veritabanı Şeması & Analist Sorguları
│   ├── create_tables.sql
│   ├── insert_sample_data.sql
│   └── validation_queries.sql
├── Docs/                       # Analiz & Süreç Dokümantasyonu
│   ├── workflow.md             # Mermaid Süreç Akış Diyagramı
│   ├── use_cases.md            # Use Case & Akış Tanımları
│   └── business_requirements.md# Fonksiyonel & NFR Gereksinimler (BRD)
└── README.md
