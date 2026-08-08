namespace OrderValidationService.Models
{
    // Mağazanın seçebileceği kargo stratejileri
    public enum ShippingStrategyType
    {
        Disabled = 0,        // Kargo Yok / Mağazadan Teslim
        FlatRate = 1,        // Sabit Ücretli Kargo
        BasketThreshold = 2, // Belirli Limit Üzeri Bedava Kargo
        DesiBased = 3        // Desi / Hacim Bazlı Kargo
    }

    // Admin panelinden gelen kargo konfigürasyon modeli
    public class MerchantShippingConfig
    {
        public ShippingStrategyType Strategy { get; set; }
        public decimal FixedFee { get; set; }            // Sabit Kargo Ücreti
        public decimal FreeShippingThreshold { get; set; } // Ücretsiz Kargo Limiti (TL)
        public decimal PricePerDesi { get; set; }        // Desi Başına Birim Ücret
    }
}
