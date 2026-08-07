public class OrderResponse
{
    public bool IsSuccess { get; set; }       // İşlem başarılı mı? (true/false)
    public string Message { get; set; }        // Ekran mesajı
    public OrderStatus Status { get; set; }    // Siparişin son statüsü
}
