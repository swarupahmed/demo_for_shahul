import 'package:demo_for_shahul/models/category.dart';
import 'package:flutter/material.dart';

class ModalContainer extends StatefulWidget {
  const ModalContainer({super.key});

  @override
  State<ModalContainer> createState() => _ModalContainerState();
}

class _ModalContainerState extends State<ModalContainer> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.orange[400],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 60),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: Category.getAllCategories()
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ChoiceChip(
                            backgroundColor: Colors.green,
                            selectedColor: Colors.yellow,
                            selected: selectedCategory != null &&
                                e.title == selectedCategory!.title,
                            label: Text(e.title),
                            onSelected: ((value) => setState(() {
                                  selectedCategory = e;
                                })),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          selectedCategory == null
              ? const Center(child: Text('choose category'))
              : Flexible(
                  fit: FlexFit.loose,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 100),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: selectedCategory!.foods
                          .map((e) => Card(
                                  child: Center(
                                      child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(e),
                              ))))
                          .toList(),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
