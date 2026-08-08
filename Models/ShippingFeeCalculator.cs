using OrderValidationService.Models;

namespace OrderValidationService.Services
{
    public class ShippingFeeCalculator
    {
        public decimal CalculateShipping(MerchantShippingConfig config, decimal totalAmount, double totalDesi)
        {
            switch (config.Strategy)
            {
                case ShippingStrategyType.Disabled:
                    return 0.00m; // Kargo kullanılmıyor

                case ShippingStrategyType.FlatRate:
                    return config.FixedFee; // Sepet ne olursa olsun sabit ücret

                case ShippingStrategyType.BasketThreshold:
                    if (totalAmount >= config.FreeShippingThreshold)
                        return 0.00m; // Belirlenen limit aşıldıysa bedava
                    return config.FixedFee;

                case ShippingStrategyType.DesiBased:
                    return (decimal)totalDesi * config.PricePerDesi; // Desi * Birim Fiyat

                default:
                    return 0.00m;
            }
        }
    }
}
