import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

part 'beta.g.dart';

@RealmModel()
@JsonSerializable(explicitToJson: true)
class $Beta {
  @PrimaryKey()
  late final String id;

  static $Beta fromJson(Map<String, dynamic> json) => _$$BetaFromJson(json);
  Map<String, dynamic> toJson() => _$$BetaToJson(this);
}

extension BetaJson on Beta {
  static Beta toRealmObject($Beta obj) {
    return Beta(obj.id);
  }

  static Beta fromJson(Map<String, dynamic> json) => toRealmObject(_$$BetaFromJson(json));
}