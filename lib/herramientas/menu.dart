import 'package:flutter/material.dart';


class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //esto es para agregar el menu
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color :Colors.deepPurple
              ),
              accountName: Text("Giuliano"),
              accountEmail:Text("giuliano@quantum.com"),
              currentAccountPicture: Image.asset("assets/images/logo.png"),
            ),
            ListTile(
              title:Text("Privacidad"),
              leading: Icon(Icons.privacy_tip),
              onTap:(){
                //para mandar a un cierto layout o clase
                Navigator.of(context).pop();
                Navigator.pushNamed(context, ( "/perfil"));
              },
            ),
            ListTile(
              title:Text("Configuracion"),
              leading: Icon(Icons.settings),
              onTap:(){
                //para mandar a un cierto layout o clase
                Navigator.of(context).pop();
                Navigator.pushNamed(context, ( "/configuracion"));
              },
            ),
          ],
        )
    );
  }
}
