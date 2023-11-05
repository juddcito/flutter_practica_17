

import 'package:flutter/material.dart';
import 'package:flutter_practica_17/data/movies.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List<Map<String,dynamic>> pelis = [...movies];

  void onDismissed(BuildContext context, int index, String accion) {

    setState(() {
      
      final _snackbar = SnackBar(content: Text('Acción: $accion'));
      pelis.removeAt(index);

      switch (accion) {

        case 'Agregar':
          ScaffoldMessenger.of(context).showSnackBar(_snackbar);
          break;
        case 'Eliminar':
          ScaffoldMessenger.of(context).showSnackBar(_snackbar);
          break;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica 17 - Dismissed'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        itemBuilder:(context, index) {
          final item = pelis[index];
          return Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed:(context) => onDismissed(context, index, 'Agregar'),
                  icon: Icons.add,
                  label: 'Agregar',
                  backgroundColor: Colors.green,
                ),
                SlidableAction(
                  onPressed:(context) => onDismissed(context, index, 'Eliminar'),
                  icon: Icons.delete,
                  label: 'Delete',
                  backgroundColor: Colors.red,
                )
              ],
            ),
            child: ListTile(
              title: Text(item['title_name']),
              subtitle: Text(item['genres']),
            ),
          );
        },
      ),
    ); 

  }

}