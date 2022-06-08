import 'package:app_projw/models/users.dart';
import 'package:app_projw/pages/users_detalhes_page_appb.dart';

import 'package:app_projw/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabela = UserRepository.tabela;

  List<Users> _foundedUsers = [];
  mostrarDetalhes(Users users) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => UsersDetalhesPageAppb(users: users),
        ));
  }

//novas atualizações

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = tabela;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = tabela
          .where((users) => users.nome.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.deepPurple,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.deepPurple),
                hintText: "Buscar"),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: _foundedUsers.isNotEmpty
            ? ListView.builder(
                itemCount: _foundedUsers.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: userComponent(users: _foundedUsers[index]),
                  );
                })
            : const Center(
                child: Text(
                "Nenhum Usuário foi encontrado",
                style: TextStyle(color: Colors.deepPurple),
              )),
      ),
    );
  }

  userComponent({required Users users}) {
    return ListView.separated(
      shrinkWrap: true,
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
          selected: _foundedUsers.contains(tabela[users]),
          selectedTileColor: Colors.green,
          onTap: () => mostrarDetalhes(tabela[users]),
        );
      },
      padding: const EdgeInsets.all(16),
      separatorBuilder: (___, __) => Divider(),
      itemCount: tabela.length,
    );
  }
}
  // body: ListView.separated(
  //   itemBuilder: (BuildContext context, int users) {
  //     return ListTile(
        
  //       subtitle: Text(tabela[users].funcao),
  //       selected: _foundedUsers.contains(tabela[users]),
  //       selectedTileColor: Colors.grey,
  //       onTap: () => mostrarDetalhes(tabela[users]),
  //     );
  //   },
  //   padding: const EdgeInsets.all(16),
  //   separatorBuilder: (___, __) => Divider(),
  //   itemCount: tabela.length,
  // ));

