class PayoutsUpComingsModel {
  String date;
  String price;

  PayoutsUpComingsModel({
    required this.date,
    required this.price,
  });
}

class PayoutsUpComingsList {
  static List<PayoutsUpComingsModel> list = [
    PayoutsUpComingsModel(
      date: 'Sept 02, 2021',
      price: '\$ 150.00',
    ),
    PayoutsUpComingsModel(
      date: 'Sept 08, 2021',
      price: '\$ 160.00',
    ),
    PayoutsUpComingsModel(
      date: 'Sept 12, 2021',
      price: '\$ 150.00',
    ),
  ];
}
