class BookingsInProgressModel {
  String orderNumber;
  String imagePath;
  String rating;
  String customerName;
  String date;
  String time;
  String address;

  BookingsInProgressModel({
    required this.orderNumber,
    required this.imagePath,
    required this.rating,
    required this.customerName,
    required this.date,
    required this.time,
    required this.address,
  });
}

class BookingsInProgressList {
  static List<BookingsInProgressModel> list = [
    BookingsInProgressModel(
      orderNumber: '2345566676',
      imagePath:
          'https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE3fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      rating: '4.8',
      customerName: 'Jorge Gomez',
      date: 'Thu, Sept 02, 2021',
      time: '8:21 PM',
      address: '6766 NW 76th Ave,Doral,Fl 33176',
    ),
    BookingsInProgressModel(
      orderNumber: '2345566676',
      imagePath:
          'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      rating: '4.8',
      customerName: 'Jorge Gomez',
      date: 'Thu, Sept 02, 2021',
      time: '8:21 PM',
      address: '6766 NW 76th Ave,Doral,Fl 33176',
    ),
  ];
}
