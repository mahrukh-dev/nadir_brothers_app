import 'package:flutter/material.dart';

class CategoryManager {
  List<String> categories = [];

  void addCategory(String category) {
    categories.add(category);
  }

  void removeCategory(String category) {
    categories.remove(category);
  }

  List<String> CategoryList(){
    return categories;
  }

  List<Container> getCategoryWidgets() {
    return categories.map((category) => Container(
      width: 100,
      color: Colors.white70,
      child: Center(child: Text(
        category,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      )),
    )).toList(); // Add .toList() to convert the Iterable to a List
  }
}

class CategoryInflation{
  late CategoryManager categoryManager;
  void insertCategory(String categoryName){
    categoryManager.addCategory(categoryName);
  }

  void inflate(){
    categoryManager.addCategory("One");
    categoryManager.addCategory("Two");
    categoryManager.addCategory("Three");
    categoryManager.addCategory("Four");
  }

  List<Container> getCategoryWidgetsAndInflate() {
    return categoryManager.getCategoryWidgets();
  }

}

