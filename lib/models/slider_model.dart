class SliderModel {
  String? image;
  String? text;
  String? altText;
  String? bAltText;
  String? productImage;
  int? kBackgroundColor;

  SliderModel(this.image, this.text, this.altText, this.bAltText,
      this.productImage, this.kBackgroundColor);

  SliderModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    kBackgroundColor = json['kBackgroundColor'];
    text = json['text'];
    altText = json['altText'];
    bAltText = json['bAltText'];
    productImage = json['productImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['kBackgroundColor'] = this.kBackgroundColor;
    data['text'] = this.text;
    data['altText'] = this.altText;
    data['bAltText'] = this.bAltText;
    data['productImage'] = this.productImage;
    return data;
  }
}

List<SliderModel> slides =
    slideData.map((item) => SliderModel.fromJson(item)).toList();

var slideData = [
  {
    "image": "assets/slides/background-1.jpeg",
    "kBackgroundColor": 0xFFe24d2d,
    "text": "Welcome to the Smart Smart Admin Dashboard!",
    "altText": "You can access & track your services in real-time.",
    "bAltText": "Are you ready for the next generation AI supported Dashboard?",
    "productImage": "assets/images/mockup.png"
  },
  {
    "image": "assets/slides/background-2.jpeg",
    "kBackgroundColor": 0xFFa3a3a3,
    "text": "¡Bienvenido al tablero Smart Admin Dashboard!",
    "altText": "Puede acceder y rastrear sus servicios en tiempo real.",
    "bAltText":
        "¿Estás listo para el panel de control impulsado por IA de próxima generación?",
    "productImage": "assets/images/mockup-2.png"
  },
  {
    "image": "assets/slides/background-3.jpeg",
    "kBackgroundColor": 0xFFc12d3b,
    "text": "Willkommen im Smart Admin Dashboard!",
    "altText":
        "Sie können in Echtzeit auf Ihre Dienste zugreifen und diese verfolgen.",
    "bAltText":
        "Sind Sie bereit für das AI-unterstützte Dashboard der nächsten Generation?",
    "productImage": "assets/images/mockup-3.png"
  }
];
