public class LoyaltyService
{
    public decimal CalculateDiscount(string customerTier, decimal totalAmount)
    {
        // Gold üyelere %20 indirim
        if (customerTier == "Gold")
        {
            return totalAmount * 0.80m;
        }
        // Silver üyelere %10 indirim
        else if (customerTier == "Silver")
        {
            return totalAmount * 0.90m;
        }
        // Standart üyelere indirim yok
        else
        {
            return totalAmount;
        }
    }
}

Müşterinin VIP seviyesine (Gold, Silver, Standard) göre sepetine otomatik indirim uygulayan kural.
