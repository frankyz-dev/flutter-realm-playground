// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alpha.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$Alpha _$$AlphaFromJson(Map<String, dynamic> json) => $Alpha()
  ..id = json['id'] as String
  ..requiredValue = json['requiredValue'] as String
  ..optionalValue = json['optionalValue'] as String?
  ..child = json['child'] == null
      ? null
      : $Beta.fromJson(json['child'] as Map<String, dynamic>)
  ..childList = (json['childList'] as List<dynamic>)
      .map((e) => $Beta.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$$AlphaToJson($Alpha instance) => <String, dynamic>{
      'id': instance.id,
      'requiredValue': instance.requiredValue,
      'optionalValue': instance.optionalValue,
      'child': instance.child?.toJson(),
      'childList': instance.childList.map((e) => e.toJson()).toList(),
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Alpha extends $Alpha with RealmEntity, RealmObjectBase, RealmObject {
  Alpha(
    String id,
    String requiredValue, {
    String? optionalValue,
    Beta? child,
    Iterable<Beta> childList = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'requiredValue', requiredValue);
    RealmObjectBase.set(this, 'optionalValue', optionalValue);
    RealmObjectBase.set(this, 'child', child);
    RealmObjectBase.set<RealmList<Beta>>(
        this, 'childList', RealmList<Beta>(childList));
  }

  Alpha._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => throw RealmUnsupportedSetError();

  @override
  String get requiredValue =>
      RealmObjectBase.get<String>(this, 'requiredValue') as String;
  @override
  set requiredValue(String value) => throw RealmUnsupportedSetError();

  @override
  String? get optionalValue =>
      RealmObjectBase.get<String>(this, 'optionalValue') as String?;
  @override
  set optionalValue(String? value) => throw RealmUnsupportedSetError();

  @override
  Beta? get child => RealmObjectBase.get<Beta>(this, 'child') as Beta?;
  @override
  set child(covariant Beta? value) => throw RealmUnsupportedSetError();

  @override
  RealmList<Beta> get childList =>
      RealmObjectBase.get<Beta>(this, 'childList') as RealmList<Beta>;
  @override
  set childList(covariant RealmList<Beta> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Alpha>> get changes =>
      RealmObjectBase.getChanges<Alpha>(this);

  @override
  Alpha freeze() => RealmObjectBase.freezeObject<Alpha>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Alpha._);
    return const SchemaObject(ObjectType.realmObject, Alpha, 'Alpha', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('requiredValue', RealmPropertyType.string),
      SchemaProperty('optionalValue', RealmPropertyType.string, optional: true),
      SchemaProperty('child', RealmPropertyType.object,
          optional: true, linkTarget: 'Beta'),
      SchemaProperty('childList', RealmPropertyType.object,
          linkTarget: 'Beta', collectionType: RealmCollectionType.list),
    ]);
  }
}
