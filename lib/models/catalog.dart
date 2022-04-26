class Catalogmodel {
  static final items = [
    Item(
        id: 1,
        name: "iphone 12 pro",
        desc: "Apple iphone 12th generation with three base variants",
        price: 999,
        color: "#33505a",
        image: "https://m.media-amazon.com/images/I/71MHTD3uL4L.jpg"),
  
  Item(
        id: 2,
        name: "iphone Xr",
        desc: "Apple iphone Xr generation with three base variants",
        price: 566,
        color: "#33505b",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT28Za6rS2Ikfh2aTekT5YwZfWSGwmX4hAr0G_VXqWW5g7vjb-rO4bYghFov9gt_OwGHM&usqp=CAU"),
        
  Item(
        id: 3,
        name: "iphone 13",
        desc: "Apple iphone 12th generation with three base variants",
        price: 789,
        color: "#33505c",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStxnvG0lDpB3ixnn9TSf8ahkBFzYo7riSJBA&usqp=CAU")
        
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
