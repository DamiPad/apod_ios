import 'package:apod_app/src/models/apod_model.dart';
import 'package:apod_app/src/providers/apod_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:apod_app/views/card_widget.dart';


class ApodScreen extends StatefulWidget {
  ApodScreen({Key key}) : super(key: key);

  @override
  _ApodScreenState createState() => _ApodScreenState();
}

class _ApodScreenState extends State<ApodScreen> {
  int _selectedIndex = 0;
  List <Widget>_childrens = List();
  final _apodProvider = ApodProvider();

  @override
  void initState() {
    super.initState();
    _childrens.add(_apodRecentList());
    _childrens.add(_apodRandomList());
    _childrens.add(Text('Contenido Saved'));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
       child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children:<Widget>[
              Text('Julio 25, 2020'),
               Row(
                 children: <Widget>[
                    Expanded(
                      child:Text('APOD'),),
                   CupertinoButton(
                     child: Icon(CupertinoIcons.refresh_thick), 
                     onPressed: _onRefresh,
                                       ),
                                      ]
                                    ),
                                    Container(
                                     height: 1.0,
                                     color: CupertinoColors.systemGrey5,
                                     
                                   ),
                                   SizedBox(
                                     height:20.0
                     
                                   ),
                     
                                   Center(
                                     child: CupertinoSegmentedControl<int>(
                                       children: {
                                  
                                         0:Text('Recent'),
                                         1:Text('Random'),
                                         2:Text('Saved'),
                                       },
                                       onValueChanged: _onValueChanged,
                                       groupValue: _selectedIndex,
                                     ),
                                   ),
                                   SizedBox(
                                     height: 20,
                                    ),
                                   Expanded(child: _childrens[_selectedIndex]),
                                 ]
                               ),
                             ),
                           )
                         );
                       }
                                     
                       void _onValueChanged(int value) {
                         setState(() {
                           _selectedIndex = value;
                         });
                       }
  void _onRefresh() {
    setState(() {
      _childrens[1] = _apodRandomList();
    });
    
  }
                     
                     
                       Widget _apodRecentList(){
                         return FutureBuilder(
                           future: _apodProvider.getRecentImage(),
                           builder: (BuildContext context, AsyncSnapshot<List<Apodimage>> snapshot){
                              if (snapshot.hasData){
                                return _cardList(snapshot.data);
                              }
                              else {
                                return Center(child: CupertinoActivityIndicator(),);
                              }
                           },
                           
                         );
                       }
                     
                     
                       Widget _apodRandomList(){
                         return FutureBuilder(
                           future: _apodProvider.getRandomImages(),
                           builder: (BuildContext context, AsyncSnapshot<List<Apodimage>> snapshot){
                              if (snapshot.hasData){
                                return _cardList(snapshot.data);
                              }
                              else {
                                return Center(child: CupertinoActivityIndicator(),);
                              }
                           },
                           
                         );
                       }
                     
                       Widget _cardList(List<Apodimage> imageList){
                         return ListView.builder(
                           itemCount: imageList.length,
                           itemBuilder: (BuildContext context, int index){
                             return CupertinoCard(
                               apodImage:imageList[index],
                               onPressed:() => print(''),
                               icon: CupertinoIcons.heart_solid,
                             );
                           },
                         );
                       }
                     
  
}