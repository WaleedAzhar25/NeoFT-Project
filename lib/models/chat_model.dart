class ChatModel{
  String image;
  String name;
  String tag;
  String time;
  int notification;

  ChatModel({required this.image,required this.name, required this.tag, required this.time,required this.notification});
}

List listChatModel=[
  ChatModel(image: "assets/images/janecooper.png", name: 'Jane Cooper', tag: '@JaneCooper', time: '5 mins ago', notification: 5),
  ChatModel(image: "assets/images/cameraon.png", name: 'Cameron Williamson', tag: '@CameronWilliamson', time: '10 mins ago', notification: 10),
  ChatModel(image: "assets/images/brooklyn.png", name: 'Brooklyn Simmons', tag: '@BrooklynSimmons', time: '1 hr ago', notification: 15),
  ChatModel(image: "assets/images/bessie.png", name: 'Bessie Cooper', tag: '@BessieCooper', time: '1 day ago', notification: 20),

];