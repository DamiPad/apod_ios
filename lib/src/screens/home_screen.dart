import 'package:flutter/cupertino.dart';
import 'package:apod_app/src/screens/apod_screen.dart';
import 'package:apod_app/src/screens/settings_screen.dart';

 
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('APOD')
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.gear_solid),
              title: Text('Settings')
          ),
        ],//contiene una lista
      ), 
      tabBuilder: (context,index){//como construir y como lojar
        //index ordinal base cero que indica que tab esta seleccionado o marcado
        return CupertinoTabView(
          //routes: getApplicationRoutes(),
          builder: (context){
            switch(index){
              case 0:
                return ApodScreen();
                break;
              case 1:
                return SettingsScreen();
                break;
            }
            return ApodScreen();
          }
        );
      }
    );
  }
}
