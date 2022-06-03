import 'package:app_projw/models/users.dart';
import 'package:app_projw/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabela = UserRepository.tabela;

  List<Users> selecionada = [];

  mostrarDetalhes(Users users) {}

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return Scaffold(
        appBar: AppBar(
          title: const Text("Users Database"),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int users) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              leading: SizedBox(
                // ignore: sort_child_properties_last
                child: Image.asset(tabela[users].icone),
                width: 50,
              ),
              title: Text(
                tabela[users].nome,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(tabela[users].funcao),
              selected: selecionada.contains(tabela[users]),
              selectedTileColor: Colors.grey,
              onLongPress: () {
                setState(() {
                  (selecionada.contains(tabela[users]))
                      ? selecionada.remove(tabela[users])
                      : selecionada.add(tabela[users]);
                });
              },
              onTap: () => mostrarDetalhes(tabela[users]),
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (___, __) => Divider(),
          itemCount: tabela.length,
        ));
  }
}
