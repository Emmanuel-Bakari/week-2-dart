void main() {
  // Sample cart items with their prices
  List<double> cartItems = [5.99, 12.49, 3.99, 25.00, 15.75];

  // Function to calculate the total price with optional tax
  double calculateTotal(List<double> prices, [double taxRate = 0.0]) {
    double total = prices.fold(0.0, (sum, price) => sum + price);
    return total * (1 + taxRate);
  }

  // Anonymous function to filter out items below $10
  List<double> filterItemsBelowThreshold(
      List<double> prices, double threshold) {
    return prices.where((price) => price >= threshold).toList();
  }

  // Higher-order function to apply discount
  List<double> applyDiscount(
      List<double> prices, double Function(double) discountFunction) {
    return prices.map((price) => discountFunction(price)).toList();
  }

  // Recursive function to calculate factorial discount
  double calculateFactorialDiscount(int n) {
    if (n == 0) return 1.0;
    return n * calculateFactorialDiscount(n - 1);
  }

  // Discount function to reduce price by a percentage
  double discountFunction(double price) {
    return price * 0.90; // 10% discount
  }

  // Apply discount to cart items
  List<double> discountedItems = applyDiscount(cartItems, discountFunction);

  // Calculate total with tax (e.g., 8% tax rate)
  double taxRate = 0.08;
  double totalWithTax = calculateTotal(discountedItems, taxRate);

  // Calculate factorial discount (special discount based on number of items)
  int numberOfItems = cartItems.length;
  double factorialDiscount = calculateFactorialDiscount(numberOfItems) / 100;
  double finalPrice = totalWithTax * (1 - factorialDiscount);

  // Output the results
  print('Original cart items: $cartItems');
  print('Items after discount: $discountedItems');
  print('Total price with tax: \$${totalWithTax.toStringAsFixed(2)}');
  print('Factorial discount: ${factorialDiscount * 100}%');
  print(
      'Final price after factorial discount: \$${finalPrice.toStringAsFixed(2)}');
}
