import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_field_type.freezed.dart';

@freezed
abstract class InputFieldType with _$InputFieldType {
  const factory InputFieldType.phone() = PhoneInput;
  const factory InputFieldType.email() = EmailInput;
  const factory InputFieldType.number() = NumberInput;
  const factory InputFieldType.password() = PasswordInput;
  const factory InputFieldType.regular() = RegularInput;
  const factory InputFieldType.url() = UrlInput;
}
