import 'package:flutter/material.dart';
import 'package:flutter_practica_17/data/movies.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = [...movies];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica 17 - Dismissed'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        itemBuilder: (context, index) {
          final item = pelis[index];
          return Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  backgroundColor: Colors.green,
                  onPressed: (context) =>
                      onDismissed(context, index, 'Agregar'),
                  icon: Icons.add,
                  label: 'Agregar',            
                ),
                SlidableAction(
                  backgroundColor: Colors.red,
                  onPressed: (context) =>
                      onDismissed(context, index, 'Eliminar'),
                  icon: Icons.delete,
                  label: 'Eliminar',
                  
                )
              ],
            ),
            child: ListTile(
              title: Text(item['title_name']),
              subtitle: Text(item['Genres']),
            ),
          );
        },
      ),
    );
  }

  void onDismissed(BuildContext context, int index, String accion) {
    setState(() {
      final _snackBar = SnackBar(content: Text('Acción: $accion'));
      pelis.removeAt(index);

      switch (accion) {
        case 'Agregar':
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          break;
        case 'Eliminar':
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          break;
      }
    });
  }
}
