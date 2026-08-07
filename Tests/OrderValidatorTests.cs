using Xunit;

public class OrderValidatorTests
{
    [Fact]
    public void CheckOrder_ShouldReturnError_WhenCustomerIsPassive()
    {
        // Arrange (Hazırlık)
        var validator = new OrderValidator();
        var order = new Order 
        { 
            IsCustomerActive = false, 
            TotalAmount = 200, 
            StockCount = 10 
        };

        // Act (Eylem)
        var result = validator.ValidateAndCalculate(order, requestedQuantity: 1);

        // Assert (Doğrulama)
        Assert.False(result.IsSuccess);
        Assert.Equal("Müşteri hesabı aktif değil.", result.Message);
    }

    [Fact]
    public void CheckOrder_ShouldApprove_WhenAllConditionsAreMet()
    {
        // Arrange
        var validator = new OrderValidator();
        var order = new Order 
        { 
            IsCustomerActive = true, 
            TotalAmount = 200, 
            StockCount = 10 
        };

        // Act
        var result = validator.ValidateAndCalculate(order, requestedQuantity: 2);

        // Assert
        Assert.True(result.IsSuccess);
        Assert.Equal("Sipariş başarıyla oluşturuldu.", result.Message);
    }
}
