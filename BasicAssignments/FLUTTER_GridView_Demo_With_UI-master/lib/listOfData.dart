class ListOfData {
  ListOfData({this.id, this.prise, this.name, this.img});
  final int? id, prise;
  final String? name, img;
}

List<ListOfData> listdata = [
  ListOfData(id: 1, prise: 120, name: "Puma", img: "assets/img1.png"),
  ListOfData(id: 2, prise: 150, name: "Asics", img: "assets/img2.png"),
  ListOfData(id: 3, prise: 140, name: "Salomon", img: "assets/img3.png"),
  ListOfData(id: 4, prise: 190, name: "Converse", img: "assets/img4.png"),
  ListOfData(id: 5, prise: 290, name: "Yeezy", img: "assets/img5.png"),
  ListOfData(id: 6, prise: 490, name: "Jordan", img: "assets/img6.png"),
  ListOfData(id: 7, prise: 290, name: "Adidas", img: "assets/img7.png"),
  ListOfData(id: 8, prise: 190, name: "Nike", img: "assets/img8.png"),
  ListOfData(id: 9, prise: 180, name: "Puma", img: "assets/img9.png"),
];
