class PayoutsCompletedModel {
  String date;
  String price;

  PayoutsCompletedModel({
    required this.date,
    required this.price,
  });
}

class PayoutsCompletedList {
  static List<PayoutsCompletedModel> list = [
    PayoutsCompletedModel(
      date: 'Sept 02, 2021',
      price: '\$ 150.00',
    ),
    PayoutsCompletedModel(
      date: 'Sept 08, 2021',
      price: '\$ 160.00',
    ),
    PayoutsCompletedModel(
      date: 'Sept 12, 2021',
      price: '\$ 150.00',
    ),
    PayoutsCompletedModel(
      date: 'Sept 13, 2021',
      price: '\$ 150.00',
    ),
  ];
}
