class AnimalList {
  // Property
  String imagePath; // 파일 이름
  String animalName; // 동물 이름
  String order; // 동물군, (동물군은 kind)
  bool fly; // 비행여부

  // Constructor
  AnimalList(
    {
      required this.imagePath,
      required this.animalName,
      required this.order,
      required this.fly,
    }
  );
}