class Todolist {
  final int? seq;
  final String contents;
  final String image;
  final String insertdate;

  Todolist(
    {
      this.seq,
      required this.contents,
      required this.image,
      required this.insertdate
    }
  );
// Map이 Dictionary랑 같은 거
  factory Todolist.fromJson(Map<String, dynamic> json){
    return Todolist(
      seq: json['seq'], 
      contents: json['contents'], 
      image: json['image'], 
      insertdate: json['insertdate']
    );
  }

  Map<String, dynamic> toJSON(){
    return {
      'contents': contents,
      'image': image,
      'insertdate': insertdate
    };
  }
}