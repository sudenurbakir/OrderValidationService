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
public class OrderValidator
{
    public OrderResponse ValidateAndCalculate(Order order, int requestedQuantity)
    {
        // Kural 1: Minimum Sepet Tutarı Kontrolü (100 TL)
        if (order.TotalAmount < 100)
        {
            return new OrderResponse 
            { 
                IsSuccess = false, 
                Message = "Minimum sipariş tutarı 100 TL olmalıdır.", 
                Status = OrderStatus.Rejected 
            };
        }

        // Kural 2: Müşteri Aktiflik Kontrolü
        if (order.IsCustomerActive == false)
        {
            return new OrderResponse 
            { 
                IsSuccess = false, 
                Message = "Müşteri hesabı aktif değil.", 
                Status = OrderStatus.Rejected 
            };
        }

        // Kural 3: Stok Kontrolü
        if (requestedQuantity > order.StockCount)
        {
            return new OrderResponse 
            { 
                IsSuccess = false, 
                Message = "Yetersiz stok.", 
                Status = OrderStatus.Rejected 
            };
        }

        // Tüm kurallar geçildi
        return new OrderResponse 
        { 
            IsSuccess = true, 
            Message = "Sipariş başarıyla oluşturuldu.", 
            Status = OrderStatus.Approved 
        };
    }
}
