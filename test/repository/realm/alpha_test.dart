import 'dart:io';

import 'package:flutter_realm_playground/repository/realm/alpha.dart';
import 'package:flutter_realm_playground/repository/realm/beta.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:realm/realm.dart';
import 'dart:convert';

/*
Jank: If you see this error, it means there's some configuration that isn't set.
  I don't know where it is, so the quick solution is to copy realm_dart.dll to
  where it wants it.
```
Realm error : Invalid argument(s): Failed to load dynamic library 'realm_dart.dll': error code 126
Invalid argument(s): Failed to load dynamic library 'C:\flutter\bin\cache\artifacts\engine\windows-x64\realm_dart.dll': error code 126
Invalid argument(s): Failed to load dynamic library 'D:\Projects\workspace\flutter_realm_playground\binary\windows\realm_dart.dll': error code 126
Invalid argument(s): Failed to load dynamic library 'realm_dart.dll': error code 126
```
You can find binary\windows\realm_dart.dll under <project>/windows/flutter/ephemeral/.plugin_symlinks/realm/windows.
Copy that folder to your project workspace.
*/

// Execute with the command given by IntelliJ
// C:\flutter\bin\flutter.bat --no-color test --machine --start-paused test\repository\realm\alpha_test.dart

void main() {
  test('Alpha and Beta can be created and saved to Realm', () {
    var alpha = Alpha(
        ObjectId().toString(),
        "required string",
        optionalValue: "optional string",
        child: Beta(ObjectId().toString()),
        childList: [Beta(ObjectId().toString()), Beta(ObjectId().toString())]
    );

    final realm = Realm(Configuration.inMemory([Alpha.schema, Beta.schema]));
    try {
      realm.write(() {
        realm.add(alpha);
      });
      var result = realm.all<Alpha>().toList();

      expect(1, result.length);
      expect(alpha, result[0], reason: "Result should match input");
    } finally {
      realm.close();
    }
  });

  test('Alpha and Beta can be serialized and deserialized', () {
    var alpha = Alpha(
        "id",
        "required string",
        optionalValue: "optional string",
        child: Beta("id 1"),
        childList: [Beta("id 2"), Beta("id 3")]
    );

    var alphaJson = '{'
        '"id":"id",'
        '"requiredValue":"required string",'
        '"optionalValue":"optional string",'
        '"child":{"id":"id 1"},'
        '"childList":[{"id":"id 2"},{"id":"id 3"}]'
        '}';
    expect(alphaJson, json.encode(alpha.toJson()));

    var map = json.decode(alphaJson);
    var deserializedAlpha = AlphaJson.fromJson(map);

    // RealmObjects will not have equality when deserialized.
    // TODO: Build value equality for testing
    expect(alpha.id, deserializedAlpha.id);
    expect(alpha.requiredValue, deserializedAlpha.requiredValue);
    expect(alpha.optionalValue, deserializedAlpha.optionalValue);
    expect(alpha.child!.id, deserializedAlpha.child!.id);
    expect(alpha.childList.length, deserializedAlpha.childList.length);
  });
}