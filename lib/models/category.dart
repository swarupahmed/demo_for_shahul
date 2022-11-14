class Category {
  final String title;
  final List<String> foods;

  Category(this.title, this.foods);

  static List<Category> getAllCategories() {
    return [
      Category('fish', ['Fish 1', 'Fish 2', 'Fish 3']),
      Category('food', ['Food 1', 'Food 2', 'Food 3']),
      Category('rice', ['Rice 1', 'Rice 2', 'Rice 3']),
    ];
  }
}
