
class Wallet {
  String title;
  String image;
  String popular;

  Wallet({required this.title,required this.image,this.popular=""});
}

List listWallet=[
  Wallet(title: "MetaMask", image: "assets/images/metamask.png",popular: "popular"),
  Wallet(title: "Coinbase Wallet", image: "assets/images/coinbase.png",),
  Wallet(title: "Wallet Connect", image: "assets/images/walletconnect.png",),
  Wallet(title: "Formatic", image: "assets/images/formatic.png",),
  Wallet(title: "Bitski", image: "assets/images/bitski.png",),
  Wallet(title: "Autherium", image: "assets/images/autherium.png",),
  Wallet(title: "Kaikas", image: "assets/images/kaikas.png",),
  Wallet(title: "Torus", image: "assets/images/torus.png",),
  Wallet(title: "Portis", image: "assets/images/portis.png",),
  Wallet(title: "Operatouch", image: "assets/images/operatouch.png",),
  Wallet(title: "Trust", image: "assets/images/trust.png",),
];