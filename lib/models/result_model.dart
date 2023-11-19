class ResultModel{
  double metr;
  double kilometr;
  double mile;
  ResultModel({
    required this.metr,
    required this.kilometr,
    required this.mile,
});


  factory ResultModel.fromMap(Map<String, dynamic> json) {
    final map=json['body']['distance'];
    return ResultModel(
      metr: map['metr']as double ,
      kilometr: map['kilometr']as double,
      mile: map['mile']as double,
    );
  }
}