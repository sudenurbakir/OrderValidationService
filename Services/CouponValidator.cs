public class CouponValidator
{
    public string ValidateCoupon(string couponCode, decimal basketAmount, bool isCouponActive, DateTime expiryDate)
    {
        // Kural 1: Kupon sistemi pasif mi?
        if (isCouponActive == false)
        {
            return "HATA: Girdiğiniz kupon kodu şu anda geçerli değil.";
        }

        // Kural 2: Kuponun son kullanma tarihi geçmiş mi?
        if (expiryDate < DateTime.Now)
        {
            return "HATA: Kupon kodunun kullanım süresi dolmuş.";
        }

        // Kural 3: Minimum sepet tutarı karşılanıyor mu? (Örn: 300 TL)
        if (basketAmount < 300)
        {
            return "HATA: Bu kupon sadece 300 TL ve üzeri sepetlerde geçerlidir.";
        }

        return "BAŞARILI: %20 İndirim uygulandı!";
    }
}
