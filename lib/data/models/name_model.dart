import 'package:freezed_annotation/freezed_annotation.dart';
part 'name_model.freezed.dart';
part 'name_model.g.dart';

@freezed
class Name with _$Name {
  const Name._(); // Constructor privado para definir getters

  factory Name({
    required String first,
    required String last,
  }) = _Name;

  @JsonKey(name: 'firstname')
  String get firstName => first;

  @JsonKey(name: 'lastname')
  String get lastName => last;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
