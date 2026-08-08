-- 1. Siparişler Tablosu (Order.cs karşılığı)
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY IDENTITY(1,1), -- Otomatik artan ID
    TotalAmount DECIMAL(18,2) NOT NULL,    -- Sepet Tutarı
    StockCount INT NOT NULL,              -- Stok Miktarı
    IsCustomerActive BIT NOT NULL,        -- Müşteri Aktif mi? (1: Evet, 0: Hayır)
    CreatedDate DATETIME DEFAULT GETDATE()-- Sipariş Tarihi
);

-- 2. İndirim Kuponları Tablosu (CouponValidator karşılığı)
CREATE TABLE Coupons (
    CouponId INT PRIMARY KEY IDENTITY(1,1),
    CouponCode VARCHAR(50) NOT NULL,
    IsActive BIT DEFAULT 1,
    ExpiryDate DATETIME NOT NULL,
    MinBasketAmount DECIMAL(18,2) NOT NULL
);

-- 3. Mağaza Kargo Konfigürasyon Tablosu (MerchantShippingConfig.cs Karşılığı)
CREATE TABLE MerchantShippingConfigs (
    ConfigId INT PRIMARY KEY IDENTITY(1,1),
    MerchantId INT NOT NULL,                  -- Mağaza ID
    Strategy INT NOT NULL,                    -- 0: Disabled, 1: FlatRate, 2: BasketThreshold, 3: DesiBased
    FixedFee DECIMAL(18,2) DEFAULT 0.00,       -- Sabit Kargo Ücreti
    FreeShippingThreshold DECIMAL(18,2) DEFAULT 0.00, -- Ücretsiz Kargo Limiti
    PricePerDesi DECIMAL(18,2) DEFAULT 0.00,  -- Desi Başına Birim Fiyat
    UpdatedDate DATETIME DEFAULT GETDATE()
);
