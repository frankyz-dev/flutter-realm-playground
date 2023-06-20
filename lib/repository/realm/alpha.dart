import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';
import 'package:flutter_realm_playground/repository/realm/beta.dart';

part 'alpha.g.dart';

@RealmModel()
@JsonSerializable(explicitToJson: true)
class $Alpha {
  @PrimaryKey()
  late final String id;
  late final String requiredValue;
  late final String? optionalValue;
  late final $Beta? child;
  late final List<$Beta> childList;

  static $Alpha fromJson(Map<String, dynamic> json) => _$$AlphaFromJson(json);
  Map<String, dynamic> toJson() => _$$AlphaToJson(this);
}

extension AlphaJson on Alpha {
  static Alpha toRealmObject($Alpha obj) {
    return Alpha(
        obj.id,
        obj.requiredValue,
        optionalValue: obj.optionalValue,
        child: obj.child == null ? null : BetaJson.toRealmObject(obj.child!),
        childList: obj.childList.map((e) => BetaJson.toRealmObject(e))
    );
  }

  static Alpha fromJson(Map<String, dynamic> json) => toRealmObject(_$$AlphaFromJson(json));
}