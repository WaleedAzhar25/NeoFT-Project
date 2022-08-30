class CategoryModel{
  final String image;
  final String title;
  final String bid;

  CategoryModel({required this.image,required this.title,required this.bid});
}
List<CategoryModel> listCategory=[
  CategoryModel(image: 'assets/images/art.png', title: 'Art', bid: '3.440'),
  CategoryModel(image: 'assets/images/music.png', title: 'Music', bid: '1.230'),
  CategoryModel(image: 'assets/images/game.png', title: '3D Games', bid: '2.452'),
  CategoryModel(image: 'assets/images/virtualWorld.png', title: 'Virtual World', bid: '1.141'),
  CategoryModel(image: 'assets/images/digitalArts.png', title: 'Digital Arts', bid: '2.213'),
  CategoryModel(image: 'assets/images/collectibles.png', title: 'Collectibles', bid: '4.123'),
];