import UIKit

func Payment(_ principal : Int, _ numPayments : Int, _ interestPercent : Float) -> Float {
    
    // Payment = principal * ((interest rate * (1 + interest rate)^(number of payments)) / ((1 + interest rate)^(number of payments) - 1))
    // Payment = P * (r * (1+r)^n) / ((1+r)^n) - 1))
    // interest rate (r, interestPercent) is expected to be per payment period, not just the APR
    
    // Convert interestPercent to a decimal value
    let interestRate : Double = Double(interestPercent) / 100.0
    
    // P * (r * (1+r)^n)
    let monthlyPaymentNumerator : Double = Double(principal) * (interestRate * pow((1.0 + interestRate), Double(numPayments)))
    // 73.3333333332 * 1.007346764
    // 73.87209605567
    
    // ((1+r)^n) - 1)
    let monthlyPaymentDenominator : Double = pow((1.0+interestRate), Double(numPayments)) - 1.0
    // 0.007346764
    
    // Complete equation
    let monthlyPayment : Float = Float(monthlyPaymentNumerator / monthlyPaymentDenominator)
    
    return monthlyPayment
}

print("Example 1: 2-month loan, $20,000, 4.4% APR, compounded monthly (2 payments)")
print(String(format: "$%.2f", Payment(20000, 2, Float(4.4/12))))

print("Example 2: 30-year loan, $150,000, 5% APR, annual payment (30 payments)")
print(String(format: "$%.2f", Payment(150000, 30, 5.0)))
