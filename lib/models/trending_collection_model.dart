class TrendingCollection{
  String image;
  String title;
  String tag;
  String etherium;
  String favourite;
  bool check;
  TrendingCollection({required this.image,required this.title,required this.etherium,required this.tag,required this.favourite,this.check=false});
}
List<TrendingCollection> listTrendingCollection=[
  TrendingCollection(image: 'assets/images/trending1.png', title: 'Pln saturn #07', etherium: '0.56 ETH', tag: '@Simon Lee', favourite: '64'),
  TrendingCollection(image: 'assets/images/trending2.png', title: 'Pln uranus #06', etherium: '0.58 ETH', tag: '@Simon Lee', favourite: '66'),
  TrendingCollection(image: 'assets/images/trending3.png', title: 'Pln venus #02', etherium: '0.59 ETH', tag: '@Simon Lee', favourite: '67'),
  TrendingCollection(image: 'assets/images/trending4.png', title: 'Pln jupiter #02', etherium: '0.56 ETH', tag: '@Simon Lee', favourite: '69'),
  TrendingCollection(image: 'assets/images/trending1.png', title: 'Pln saturn #07', etherium: '0.56 ETH', tag: '@Simon Lee', favourite: '64'),
  TrendingCollection(image: 'assets/images/trending2.png', title: 'Pln uranus #06', etherium: '0.58 ETH', tag: '@Simon Lee', favourite: '66'),
  TrendingCollection(image: 'assets/images/trending3.png', title: 'Pln venus #02', etherium: '0.59 ETH', tag: '@Simon Lee', favourite: '67'),
  TrendingCollection(image: 'assets/images/trending4.png', title: 'Pln jupiter #02', etherium: '0.56 ETH', tag: '@Simon Lee', favourite: '69'),
];