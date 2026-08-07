public class OrderValidator
{
    public string CheckOrder(Order order, int requestedQuantity)
    {
        // Kural 1: Müşteri hesabı pasifse sipariş oluşturulamaz
        if (order.IsCustomerActive == false)
        {
            return "İPTAL: Müşteri hesabı aktif değil.";
        }

        // Kural 2: İstenen miktar stoktan büyükse sipariş verilemez
        if (requestedQuantity > order.StockCount)
        {
            return "İPTAL: Yetersiz stok.";
        }

        // Tüm engeller geçildiyse sipariş onaylanır
        return "ONAYLANDI: Sipariş başarıyla alındı.";
    }
}
