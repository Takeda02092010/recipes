// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipesModelAdapter extends TypeAdapter<RecipesModel> {
  @override
  final int typeId = 0;

  @override
  RecipesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipesModel(
      id: fields[0] as int,
      title: fields[1] as String,
      course: fields[2] as String,
      cuisine: fields[3] as String,
      mainIngredient: fields[4] as String,
      description: fields[5] as String,
      source: fields[6] as String,
      url: fields[7] as String,
      urlHost: fields[8] as String,
      prepTime: fields[9] as int,
      cookTime: fields[10] as int,
      totalTime: fields[11] as int,
      servings: fields[12] as int,
      yieldi: fields[13] as String,
      ingredients: fields[14] as String,
      directions: fields[15] as String,
      tags: fields[16] as String,
      rating: fields[17] as String,
      publicUrl: fields[18] as String,
      photoUrl: fields[19] as String,
      private: fields[20] as bool,
      nutritionalScoreGeneric: fields[21] as String,
      calories: fields[22] as String,
      fat: fields[23] as String,
      cholesterol: fields[24] as String,
      sodium: fields[25] as String,
      sugar: fields[26] as String,
      carbohydrate: fields[27] as String,
      fiber: fields[28] as String,
      protein: fields[29] as String,
      cost: fields[30] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RecipesModel obj) {
    writer
      ..writeByte(31)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.course)
      ..writeByte(3)
      ..write(obj.cuisine)
      ..writeByte(4)
      ..write(obj.mainIngredient)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.source)
      ..writeByte(7)
      ..write(obj.url)
      ..writeByte(8)
      ..write(obj.urlHost)
      ..writeByte(9)
      ..write(obj.prepTime)
      ..writeByte(10)
      ..write(obj.cookTime)
      ..writeByte(11)
      ..write(obj.totalTime)
      ..writeByte(12)
      ..write(obj.servings)
      ..writeByte(13)
      ..write(obj.yieldi)
      ..writeByte(14)
      ..write(obj.ingredients)
      ..writeByte(15)
      ..write(obj.directions)
      ..writeByte(16)
      ..write(obj.tags)
      ..writeByte(17)
      ..write(obj.rating)
      ..writeByte(18)
      ..write(obj.publicUrl)
      ..writeByte(19)
      ..write(obj.photoUrl)
      ..writeByte(20)
      ..write(obj.private)
      ..writeByte(21)
      ..write(obj.nutritionalScoreGeneric)
      ..writeByte(22)
      ..write(obj.calories)
      ..writeByte(23)
      ..write(obj.fat)
      ..writeByte(24)
      ..write(obj.cholesterol)
      ..writeByte(25)
      ..write(obj.sodium)
      ..writeByte(26)
      ..write(obj.sugar)
      ..writeByte(27)
      ..write(obj.carbohydrate)
      ..writeByte(28)
      ..write(obj.fiber)
      ..writeByte(29)
      ..write(obj.protein)
      ..writeByte(30)
      ..write(obj.cost);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
