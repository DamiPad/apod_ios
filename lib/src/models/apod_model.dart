
class Apodimage {
  String date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  Apodimage({
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });


  Apodimage.fromJsonMap(Map <String,dynamic> json){
    date           = json['date'];
    explanation    = json['explanation'];
    hdurl          = json['hdurl'];
    mediaType      = json['media_type'];
    serviceVersion = json['service_version'];
    title          = json['title'];
    url            = json['url'];
  }

  Map<String,dynamic> toMap(){
    return{

              'date': date,
       'explanation': explanation,
             'hdurl': hdurl ,
        'media_type': mediaType ,
  'service_version':serviceVersion ,
             'title': title,
              'url': url
    };
  }
 

}

class ApodList{
  List<Apodimage> items = new List();
  ApodList();
  ApodList.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null )return;
    for (var item in jsonList){
      final apodImage = Apodimage.fromJsonMap(item);
      items.add(apodImage);
    }
  }
}