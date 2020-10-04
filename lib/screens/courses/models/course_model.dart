class CourseModel {
  int id;
  String title;
  String word;
  String meaning;
  String audio;
  String titletranslate;

  
  CourseModel({this.id, this.title, this.word, this.meaning, this.audio, this.titletranslate});  
        CourseModel.fromMap(Map<String, dynamic> map) {
        this.id = map['id'];
        this.title = map['title'];
        this.word = map['word'] ;
        this.meaning = map['meaning'];
        this.audio = map['audio'];      
        this.titletranslate = map['titletranslate'];      
      }
}

