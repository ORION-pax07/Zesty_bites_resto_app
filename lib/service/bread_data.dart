import 'package:new_food_main/model/bread_model.dart';

List<BreadModel> getBread() {
  List<BreadModel> bread = [];
  BreadModel breadModel = new BreadModel();

  breadModel.name = "Butter Naan";
  breadModel.image = "images/butter_naan.png";
  breadModel.price = "40";
  bread.add(breadModel);

  breadModel = new BreadModel();
  breadModel.name = "Butter Roti";
  breadModel.image = "images/bread.png";
  breadModel.price = "30";
  bread.add(breadModel);

  breadModel = new BreadModel();
  breadModel.name = "Roti";
  breadModel.image = "images/roti.png";
  breadModel.price = "20";
  bread.add(breadModel);

  breadModel = new BreadModel();
  breadModel.name = "Paratha";
  breadModel.image = "images/paratha.png";
  breadModel.price = "30";
  bread.add(breadModel);

  breadModel = new BreadModel();
  breadModel.name = "Garlic Naan";
  breadModel.image = "images/garlic_naan.png";
  breadModel.price = "50";
  bread.add(breadModel);

  breadModel = new BreadModel();
  breadModel.name = "Puran Poli";
  breadModel.image = "images/puran_poli.png";
  breadModel.price = "40";
  bread.add(breadModel);

  breadModel = new BreadModel();
  breadModel.name = "Thepla";
  breadModel.image = "images/thepla.png";
  breadModel.price = "30";
  bread.add(breadModel);


  return bread;
}
