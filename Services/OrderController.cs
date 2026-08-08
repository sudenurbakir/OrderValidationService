using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class OrderController : ControllerBase
{
    private readonly OrderValidator _orderValidator;

    public OrderController()
    {
        _orderValidator = new OrderValidator();
    }

    /// <summary>
    /// Yeni bir sipariş isteğini doğrular ve işler.
    /// POST: api/order/validate
    /// </summary>
    [HttpPost("validate")]
    public IActionResult ValidateOrder([FromBody] Order order, [FromQuery] int quantity)
    {
        if (order == null)
        {
            return BadRequest(new OrderResponse 
            { 
                IsSuccess = false, 
                Message = "Geçersiz sipariş verisi." 
            });
        }

        // İş Kurallarını Çalıştır
        OrderResponse response = _orderValidator.ValidateAndCalculate(order, quantity);

        if (!response.IsSuccess)
        {
            // İş kuralına takılırsa 400 Bad Request döner
            return BadRequest(response);
        }

        // Başarılı ise 200 OK döner
        return Ok(response);
    }
}

- OrderController, dışarıdan gelen sipariş isteğini alıyor, siparişi kontrol etmesi için OrderValidator'a gönderiyor ve Validator'ın sonucunu HTTP cevabı olarak kullanıcıya geri iletiyor.

                     İSTEK
                     ↓
              OrderController
                     ↓
             "Veri var mı?"
                     ↓
                    Evet
                     ↓
              OrderValidator
                     ↓
          ┌──────────┼──────────┐
          ↓          ↓          ↓
      Min. Tutar  Müşteri     Stok
          ↓          ↓          ↓
          └──────────┼──────────┘
                     ↓
                  SONUÇ
                 ↙      ↘
             Başarılı   Başarısız
                ↓          ↓
             200 OK      400
