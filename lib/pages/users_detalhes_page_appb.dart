import 'package:app_projw/models/users.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UsersDetalhesPageAppb extends StatefulWidget {
  Users users;

  UsersDetalhesPageAppb({Key? key, required this.users}) : super(key: key);

  @override
  State<UsersDetalhesPageAppb> createState() => _UsersDetalhesPageAppbState();
}

class _UsersDetalhesPageAppbState extends State<UsersDetalhesPageAppb> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: (widget.users.usercolor),
      appBar: AppBar(
        backgroundColor: (widget.users.usercolor),
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.35),
                    padding: EdgeInsets.only(
                      top: size.height * 0.05,
                      left: 5,
                      right: 5,
                    ),
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(children: <Widget>[
                      SizedBox(
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: const <Widget>[
                                Text(
                                  "Telefone",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  '212121212',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              child: Container(
                                width: 3,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.grey),
                              ),
                            ),
                            Column(
                              children: [
                                const Text(
                                  "E-Mail",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  widget.users.email,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(1),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Image.asset(widget.users.icone),
                                  ),
                                ]),
                          ),
                          Text(
                            widget.users.nome,
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.users.funcao,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
