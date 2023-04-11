// ignore_for_file: public_member_api_docs, sort_constructors_first

class PayPalEntity {
  String emaill;
  String cardNumber;
  String cvv;
  String firstName;
  String lastName;
  String expiryMonth;
  String expiryYear;
  PayPalEntity({
    required this.emaill,
    required this.cardNumber,
    required this.cvv,
    required this.firstName,
    required this.lastName,
    required this.expiryMonth,
    required this.expiryYear,
  });
}
