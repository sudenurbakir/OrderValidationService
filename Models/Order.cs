public class Order
{
    public int OrderId { get; set; }            // Sipariş ID
    public decimal TotalAmount { get; set; }     // Sepet Tutarı (TL)
    public int StockCount { get; set; }         // Mevcut Stok
    public bool IsCustomerActive { get; set; }  // Müşteri Hesabı Aktif mi?
}
