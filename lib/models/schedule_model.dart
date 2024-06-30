class BookingsScheduleModel {
  String orderNumber;
  String imagePath;
  String rating;
  String customerName;
  String date;
  String time;
  String address;
  String totalPrice;

  BookingsScheduleModel({
    required this.orderNumber,
    required this.imagePath,
    required this.rating,
    required this.customerName,
    required this.date,
    required this.time,
    required this.address,
    required this.totalPrice,
  });
}

class BookingsScheduleList {
  static List<BookingsScheduleModel> list = [
    BookingsScheduleModel(
        orderNumber: '2345566676',
        imagePath:
            'https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE3fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
        rating: '4.8',
        customerName: 'Jorge Gomez',
        date: 'Thu, Sept 02, 2021',
        time: '8:21 PM',
        address: '6766 NW 76th Ave,Doral,Fl 33176',
        totalPrice: '321.00'),
  ];
}
