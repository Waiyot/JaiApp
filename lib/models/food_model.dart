class FoodModel {
// Field

  String id, nameFood, priceFood, imageFood;

// Constructor

FoodModel(this.id, this.nameFood, this.priceFood,this.imageFood);

FoodModel.fromJSon(Map<String, dynamic> parseJSON){    //data type in Json format is "Map", then we use this datatype to create param
  id= parseJSON['id'];
  nameFood = parseJSON['NameFood'];
  priceFood = parseJSON['Price'];
  imageFood = parseJSON['ImagePath'];
}

}
