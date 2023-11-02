import 'package:app_noti/models/category_model.dart';
import 'package:app_noti/services/news_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgest/lista_widget.dart';

class Tap2Screen extends StatelessWidget {
  const Tap2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewService>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const _ListCartegoty(),
          Expanded(
            child: newService.getArticulosCategoria!.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListaWidget(newService.getArticulosCategoria!),
          )
        ],
      )),
    );
  }
}

class _ListCartegoty extends StatelessWidget {
  const _ListCartegoty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NewService>(context).categories;
    final newCategory = Provider.of<NewService>(context);
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categorias.length,
          itemBuilder: (context, index) {
            final cName = categorias[index].name;
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton(categoria: categorias[index]),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${cName[0].toUpperCase()}${cName.substring(1)}',
                    style: TextStyle(
                      color:
                          newCategory.selectedCategory == categorias[index].name
                              ? Colors.red
                              : Colors.black,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Categoria categoria;

  const _CategoryButton({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    final newCategory = Provider.of<NewService>(context);
    return GestureDetector(
      onTap: () {
        newCategory.selectedCategory = categoria.name;
      },
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(categoria.icon,
            color: newCategory.selectedCategory == categoria.name
                ? Colors.red
                : Colors.black),
      ),
    );
  }
}
