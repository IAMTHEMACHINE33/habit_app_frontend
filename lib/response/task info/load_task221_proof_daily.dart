import 'package:json_annotation/json_annotation.dart';
part 'load_task221_proof_daily.g.dart';


@JsonSerializable()
class LoadTask221ProofDailyResponse{
  String? image;
  String? accepted;
  String? uploader;

  LoadTask221ProofDailyResponse({this.image,this.accepted,this.uploader});

  factory LoadTask221ProofDailyResponse.fromJson(Map<String, dynamic> json)=>_$LoadTask221ProofDailyResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$LoadTask221ProofDailyResponseToJson(this);
}