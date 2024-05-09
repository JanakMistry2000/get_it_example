sealed class PaymentReqDm {
  PaymentReqDm(
    this.orderId,
    this.productId,
    this.productName,
    this.amount,
  );

  int orderId;
  int productId;
  String productName;
  double amount;
}

class UPIPaymentDm extends PaymentReqDm {
  UPIPaymentDm(
    super.orderId,
    super.productId,
    super.productName,
    super.amount,
    this.upiId,
    this.upiUserName,
  );

  int upiId;
  String upiUserName;
}

class CreditCard extends PaymentReqDm {
  CreditCard(
    this.cardType,
    this.cardNumber,
    super.orderId,
    super.productId,
    super.productName,
    super.amount,
  );

  String cardType;
  int cardNumber;
}
