// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$Beta _$$BetaFromJson(Map<String, dynamic> json) =>
    $Beta()..id = json['id'] as String;

Map<String, dynamic> _$$BetaToJson($Beta instance) => <String, dynamic>{
      'id': instance.id,
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Beta extends $Beta with RealmEntity, RealmObjectBase, RealmObject {
  Beta(
    String id,
  ) {
    RealmObjectBase.set(this, 'id', id);
  }

  Beta._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Beta>> get changes =>
      RealmObjectBase.getChanges<Beta>(this);

  @override
  Beta freeze() => RealmObjectBase.freezeObject<Beta>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Beta._);
    return const SchemaObject(ObjectType.realmObject, Beta, 'Beta', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
    ]);
  }
}
