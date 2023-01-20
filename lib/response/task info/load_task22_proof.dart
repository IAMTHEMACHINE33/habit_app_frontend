import 'package:json_annotation/json_annotation.dart';
import 'load_task221_proof_daily.dart';
part 'load_task22_proof.g.dart';

@JsonSerializable()
class LoadTask22ProofResponse{
  DateTime? date_time;
  List<LoadTask221ProofDailyResponse>? daily_proof;

  LoadTask22ProofResponse({this.date_time,this.daily_proof});

  factory LoadTask22ProofResponse.fromJson(Map<String, dynamic> json)=>_$LoadTask22ProofResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$LoadTask22ProofResponseToJson(this);
}