import 'package:new_food_main/model/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category=[];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.name="Starter";
  categoryModel.image="images/starters.png";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.name="MainCourse";
  categoryModel.image="images/main_course.png";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.name="Bread";
  categoryModel.image="images/bread.png";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.name="Dessert";
  categoryModel.image="images/dessert.png";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  return category;
}