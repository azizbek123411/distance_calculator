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
      metr: map['metr'] as dynamic  ,
      kilometr: map['kilometr']as dynamic,
      mile: map['mile']as dynamic,
    );
  }
}