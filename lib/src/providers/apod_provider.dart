import 'dart:convert';
import 'package:apod_app/src/models/apod_model.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ApodProvider{
  String _apiKey = 'DEMO_KEY';
  String _url = 'api.nasa.gov';
  String _hd ='true';

  Future<List<Apodimage>> _request(Uri url) async{
    final resp = await http.get(url);
    if(resp.statusCode == 200){
      final decodeData = json.decode(resp.body);
    final apodList =ApodList.fromJsonList(decodeData);

    return apodList.items;

    }
    else{
      return List<Apodimage>();
    }
    

  }

  Future<List<Apodimage>> getRecentImage() async {
    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.add(Duration(days: -5));

    final url = Uri.https(_url, 'planetary/apod',{
      'api_key':_apiKey,
      'hd': _hd,
      'start_date': DateFormat('y-M-d').format(startDate),
      'end_date': DateFormat('y-M-d').format(endDate),
    });


    return await _request(url);

  }
  Future <List<Apodimage>> getRandomImages() async{
    
    final url = Uri.https(_url, 'planetary/apod',{
      'api_key':_apiKey,
      'hd': _hd,
      'count': '5',
      
    });


    return await _request(url);

  }
}