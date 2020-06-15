// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  ExceedingLength<T> exceedingLength<T>({T failedValue, int max}) {
    return ExceedingLength<T>(
      failedValue: failedValue,
      max: max,
    );
  }

  Empty<T> empty<T>({T failedValue}) {
    return Empty<T>(
      failedValue: failedValue,
    );
  }

  Multiline<T> multiline<T>({T failedValue}) {
    return Multiline<T>(
      failedValue: failedValue,
    );
  }

  NumberTooLarge<T> numberTooLarge<T>({T failedValue, num max}) {
    return NumberTooLarge<T>(
      failedValue: failedValue,
      max: max,
    );
  }

  ListTooLong<T> listTooLong<T>({T failedValue, int max}) {
    return ListTooLong<T>(
      failedValue: failedValue,
      max: max,
    );
  }

  InvalidEmail<T> invalidEmail<T>({T failedValue}) {
    return InvalidEmail<T>(
      failedValue: failedValue,
    );
  }

  ShortPassword<T> shortPassword<T>({T failedValue}) {
    return ShortPassword<T>(
      failedValue: failedValue,
    );
  }

  InvalidPhotoUrl<T> invalidPhotoUrl<T>({T failedValue}) {
    return InvalidPhotoUrl<T>(
      failedValue: failedValue,
    );
  }

  InvalidPhoneNumber<T> invalidPhoneNumber<T>({T failedValue}) {
    return InvalidPhoneNumber<T>(
      failedValue: failedValue,
    );
  }
}

// ignore: unused_element
const $ValueFailure = _$ValueFailureTearOff();

mixin _$ValueFailure<T> {
  T get failedValue;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result multiline(T failedValue),
    @required Result numberTooLarge(T failedValue, num max),
    @required Result listTooLong(T failedValue, int max),
    @required Result invalidEmail(T failedValue),
    @required Result shortPassword(T failedValue),
    @required Result invalidPhotoUrl(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result multiline(T failedValue),
    Result numberTooLarge(T failedValue, num max),
    Result listTooLong(T failedValue, int max),
    Result invalidEmail(T failedValue),
    Result shortPassword(T failedValue),
    Result invalidPhotoUrl(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result multiline(Multiline<T> value),
    @required Result numberTooLarge(NumberTooLarge<T> value),
    @required Result listTooLong(ListTooLong<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    @required Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result multiline(Multiline<T> value),
    Result numberTooLarge(NumberTooLarge<T> value),
    Result listTooLong(ListTooLong<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
    @required Result orElse(),
  });

  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith;
}

abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

abstract class $ExceedingLengthCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ExceedingLengthCopyWith(
          ExceedingLength<T> value, $Res Function(ExceedingLength<T>) then) =
      _$ExceedingLengthCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue, int max});
}

class _$ExceedingLengthCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ExceedingLengthCopyWith<T, $Res> {
  _$ExceedingLengthCopyWithImpl(
      ExceedingLength<T> _value, $Res Function(ExceedingLength<T>) _then)
      : super(_value, (v) => _then(v as ExceedingLength<T>));

  @override
  ExceedingLength<T> get _value => super._value as ExceedingLength<T>;

  @override
  $Res call({
    Object failedValue = freezed,
    Object max = freezed,
  }) {
    return _then(ExceedingLength<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
      max: max == freezed ? _value.max : max as int,
    ));
  }
}

class _$ExceedingLength<T> implements ExceedingLength<T> {
  const _$ExceedingLength({this.failedValue, this.max});

  @override
  final T failedValue;
  @override
  final int max;

  @override
  String toString() {
    return 'ValueFailure<$T>.exceedingLength(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExceedingLength<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(max);

  @override
  $ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith =>
      _$ExceedingLengthCopyWithImpl<T, ExceedingLength<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result multiline(T failedValue),
    @required Result numberTooLarge(T failedValue, num max),
    @required Result listTooLong(T failedValue, int max),
    @required Result invalidEmail(T failedValue),
    @required Result shortPassword(T failedValue),
    @required Result invalidPhotoUrl(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return exceedingLength(failedValue, max);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result multiline(T failedValue),
    Result numberTooLarge(T failedValue, num max),
    Result listTooLong(T failedValue, int max),
    Result invalidEmail(T failedValue),
    Result shortPassword(T failedValue),
    Result invalidPhotoUrl(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exceedingLength != null) {
      return exceedingLength(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result multiline(Multiline<T> value),
    @required Result numberTooLarge(NumberTooLarge<T> value),
    @required Result listTooLong(ListTooLong<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    @required Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return exceedingLength(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result multiline(Multiline<T> value),
    Result numberTooLarge(NumberTooLarge<T> value),
    Result listTooLong(ListTooLong<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exceedingLength != null) {
      return exceedingLength(this);
    }
    return orElse();
  }
}

abstract class ExceedingLength<T> implements ValueFailure<T> {
  const factory ExceedingLength({T failedValue, int max}) =
      _$ExceedingLength<T>;

  @override
  T get failedValue;
  int get max;
  @override
  $ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith;
}

abstract class $EmptyCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$EmptyCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(Empty<T> _value, $Res Function(Empty<T>) _then)
      : super(_value, (v) => _then(v as Empty<T>));

  @override
  Empty<T> get _value => super._value as Empty<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(Empty<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$Empty<T> implements Empty<T> {
  const _$Empty({this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Empty<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $EmptyCopyWith<T, Empty<T>> get copyWith =>
      _$EmptyCopyWithImpl<T, Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result multiline(T failedValue),
    @required Result numberTooLarge(T failedValue, num max),
    @required Result listTooLong(T failedValue, int max),
    @required Result invalidEmail(T failedValue),
    @required Result shortPassword(T failedValue),
    @required Result invalidPhotoUrl(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result multiline(T failedValue),
    Result numberTooLarge(T failedValue, num max),
    Result listTooLong(T failedValue, int max),
    Result invalidEmail(T failedValue),
    Result shortPassword(T failedValue),
    Result invalidPhotoUrl(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result multiline(Multiline<T> value),
    @required Result numberTooLarge(NumberTooLarge<T> value),
    @required Result listTooLong(ListTooLong<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    @required Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result multiline(Multiline<T> value),
    Result numberTooLarge(NumberTooLarge<T> value),
    Result listTooLong(ListTooLong<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements ValueFailure<T> {
  const factory Empty({T failedValue}) = _$Empty<T>;

  @override
  T get failedValue;
  @override
  $EmptyCopyWith<T, Empty<T>> get copyWith;
}

abstract class $MultilineCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $MultilineCopyWith(
          Multiline<T> value, $Res Function(Multiline<T>) then) =
      _$MultilineCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$MultilineCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $MultilineCopyWith<T, $Res> {
  _$MultilineCopyWithImpl(
      Multiline<T> _value, $Res Function(Multiline<T>) _then)
      : super(_value, (v) => _then(v as Multiline<T>));

  @override
  Multiline<T> get _value => super._value as Multiline<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(Multiline<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$Multiline<T> implements Multiline<T> {
  const _$Multiline({this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.multiline(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Multiline<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $MultilineCopyWith<T, Multiline<T>> get copyWith =>
      _$MultilineCopyWithImpl<T, Multiline<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result multiline(T failedValue),
    @required Result numberTooLarge(T failedValue, num max),
    @required Result listTooLong(T failedValue, int max),
    @required Result invalidEmail(T failedValue),
    @required Result shortPassword(T failedValue),
    @required Result invalidPhotoUrl(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return multiline(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result multiline(T failedValue),
    Result numberTooLarge(T failedValue, num max),
    Result listTooLong(T failedValue, int max),
    Result invalidEmail(T failedValue),
    Result shortPassword(T failedValue),
    Result invalidPhotoUrl(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (multiline != null) {
      return multiline(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result multiline(Multiline<T> value),
    @required Result numberTooLarge(NumberTooLarge<T> value),
    @required Result listTooLong(ListTooLong<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    @required Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return multiline(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result multiline(Multiline<T> value),
    Result numberTooLarge(NumberTooLarge<T> value),
    Result listTooLong(ListTooLong<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (multiline != null) {
      return multiline(this);
    }
    return orElse();
  }
}

abstract class Multiline<T> implements ValueFailure<T> {
  const factory Multiline({T failedValue}) = _$Multiline<T>;

  @override
  T get failedValue;
  @override
  $MultilineCopyWith<T, Multiline<T>> get copyWith;
}

abstract class $NumberTooLargeCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $NumberTooLargeCopyWith(
          NumberTooLarge<T> value, $Res Function(NumberTooLarge<T>) then) =
      _$NumberTooLargeCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue, num max});
}

class _$NumberTooLargeCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $NumberTooLargeCopyWith<T, $Res> {
  _$NumberTooLargeCopyWithImpl(
      NumberTooLarge<T> _value, $Res Function(NumberTooLarge<T>) _then)
      : super(_value, (v) => _then(v as NumberTooLarge<T>));

  @override
  NumberTooLarge<T> get _value => super._value as NumberTooLarge<T>;

  @override
  $Res call({
    Object failedValue = freezed,
    Object max = freezed,
  }) {
    return _then(NumberTooLarge<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
      max: max == freezed ? _value.max : max as num,
    ));
  }
}

class _$NumberTooLarge<T> implements NumberTooLarge<T> {
  const _$NumberTooLarge({this.failedValue, this.max});

  @override
  final T failedValue;
  @override
  final num max;

  @override
  String toString() {
    return 'ValueFailure<$T>.numberTooLarge(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NumberTooLarge<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(max);

  @override
  $NumberTooLargeCopyWith<T, NumberTooLarge<T>> get copyWith =>
      _$NumberTooLargeCopyWithImpl<T, NumberTooLarge<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result multiline(T failedValue),
    @required Result numberTooLarge(T failedValue, num max),
    @required Result listTooLong(T failedValue, int max),
    @required Result invalidEmail(T failedValue),
    @required Result shortPassword(T failedValue),
    @required Result invalidPhotoUrl(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return numberTooLarge(failedValue, max);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result multiline(T failedValue),
    Result numberTooLarge(T failedValue, num max),
    Result listTooLong(T failedValue, int max),
    Result invalidEmail(T failedValue),
    Result shortPassword(T failedValue),
    Result invalidPhotoUrl(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (numberTooLarge != null) {
      return numberTooLarge(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result multiline(Multiline<T> value),
    @required Result numberTooLarge(NumberTooLarge<T> value),
    @required Result listTooLong(ListTooLong<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    @required Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return numberTooLarge(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result multiline(Multiline<T> value),
    Result numberTooLarge(NumberTooLarge<T> value),
    Result listTooLong(ListTooLong<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (numberTooLarge != null) {
      return numberTooLarge(this);
    }
    return orElse();
  }
}

abstract class NumberTooLarge<T> implements ValueFailure<T> {
  const factory NumberTooLarge({T failedValue, num max}) = _$NumberTooLarge<T>;

  @override
  T get failedValue;
  num get max;
  @override
  $NumberTooLargeCopyWith<T, NumberTooLarge<T>> get copyWith;
}

abstract class $ListTooLongCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ListTooLongCopyWith(
          ListTooLong<T> value, $Res Function(ListTooLong<T>) then) =
      _$ListTooLongCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue, int max});
}

class _$ListTooLongCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ListTooLongCopyWith<T, $Res> {
  _$ListTooLongCopyWithImpl(
      ListTooLong<T> _value, $Res Function(ListTooLong<T>) _then)
      : super(_value, (v) => _then(v as ListTooLong<T>));

  @override
  ListTooLong<T> get _value => super._value as ListTooLong<T>;

  @override
  $Res call({
    Object failedValue = freezed,
    Object max = freezed,
  }) {
    return _then(ListTooLong<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
      max: max == freezed ? _value.max : max as int,
    ));
  }
}

class _$ListTooLong<T> implements ListTooLong<T> {
  const _$ListTooLong({this.failedValue, this.max});

  @override
  final T failedValue;
  @override
  final int max;

  @override
  String toString() {
    return 'ValueFailure<$T>.listTooLong(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ListTooLong<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(max);

  @override
  $ListTooLongCopyWith<T, ListTooLong<T>> get copyWith =>
      _$ListTooLongCopyWithImpl<T, ListTooLong<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result multiline(T failedValue),
    @required Result numberTooLarge(T failedValue, num max),
    @required Result listTooLong(T failedValue, int max),
    @required Result invalidEmail(T failedValue),
    @required Result shortPassword(T failedValue),
    @required Result invalidPhotoUrl(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return listTooLong(failedValue, max);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result multiline(T failedValue),
    Result numberTooLarge(T failedValue, num max),
    Result listTooLong(T failedValue, int max),
    Result invalidEmail(T failedValue),
    Result shortPassword(T failedValue),
    Result invalidPhotoUrl(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (listTooLong != null) {
      return listTooLong(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result multiline(Multiline<T> value),
    @required Result numberTooLarge(NumberTooLarge<T> value),
    @required Result listTooLong(ListTooLong<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    @required Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return listTooLong(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result multiline(Multiline<T> value),
    Result numberTooLarge(NumberTooLarge<T> value),
    Result listTooLong(ListTooLong<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (listTooLong != null) {
      return listTooLong(this);
    }
    return orElse();
  }
}

abstract class ListTooLong<T> implements ValueFailure<T> {
  const factory ListTooLong({T failedValue, int max}) = _$ListTooLong<T>;

  @override
  T get failedValue;
  int get max;
  @override
  $ListTooLongCopyWith<T, ListTooLong<T>> get copyWith;
}

abstract class $InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail<T> value, $Res Function(InvalidEmail<T>) then) =
      _$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidEmailCopyWith<T, $Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail<T> _value, $Res Function(InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmail<T>));

  @override
  InvalidEmail<T> get _value => super._value as InvalidEmail<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidEmail<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmail<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      _$InvalidEmailCopyWithImpl<T, InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result multiline(T failedValue),
    @required Result numberTooLarge(T failedValue, num max),
    @required Result listTooLong(T failedValue, int max),
    @required Result invalidEmail(T failedValue),
    @required Result shortPassword(T failedValue),
    @required Result invalidPhotoUrl(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result multiline(T failedValue),
    Result numberTooLarge(T failedValue, num max),
    Result listTooLong(T failedValue, int max),
    Result invalidEmail(T failedValue),
    Result shortPassword(T failedValue),
    Result invalidPhotoUrl(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result multiline(Multiline<T> value),
    @required Result numberTooLarge(NumberTooLarge<T> value),
    @required Result listTooLong(ListTooLong<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    @required Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result multiline(Multiline<T> value),
    Result numberTooLarge(NumberTooLarge<T> value),
    Result listTooLong(ListTooLong<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({T failedValue}) = _$InvalidEmail<T>;

  @override
  T get failedValue;
  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith;
}

abstract class $ShortPasswordCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ShortPasswordCopyWith(
          ShortPassword<T> value, $Res Function(ShortPassword<T>) then) =
      _$ShortPasswordCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$ShortPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ShortPasswordCopyWith<T, $Res> {
  _$ShortPasswordCopyWithImpl(
      ShortPassword<T> _value, $Res Function(ShortPassword<T>) _then)
      : super(_value, (v) => _then(v as ShortPassword<T>));

  @override
  ShortPassword<T> get _value => super._value as ShortPassword<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(ShortPassword<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShortPassword<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith =>
      _$ShortPasswordCopyWithImpl<T, ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result multiline(T failedValue),
    @required Result numberTooLarge(T failedValue, num max),
    @required Result listTooLong(T failedValue, int max),
    @required Result invalidEmail(T failedValue),
    @required Result shortPassword(T failedValue),
    @required Result invalidPhotoUrl(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result multiline(T failedValue),
    Result numberTooLarge(T failedValue, num max),
    Result listTooLong(T failedValue, int max),
    Result invalidEmail(T failedValue),
    Result shortPassword(T failedValue),
    Result invalidPhotoUrl(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result multiline(Multiline<T> value),
    @required Result numberTooLarge(NumberTooLarge<T> value),
    @required Result listTooLong(ListTooLong<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    @required Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result multiline(Multiline<T> value),
    Result numberTooLarge(NumberTooLarge<T> value),
    Result listTooLong(ListTooLong<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailure<T> {
  const factory ShortPassword({T failedValue}) = _$ShortPassword<T>;

  @override
  T get failedValue;
  @override
  $ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith;
}

abstract class $InvalidPhotoUrlCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidPhotoUrlCopyWith(
          InvalidPhotoUrl<T> value, $Res Function(InvalidPhotoUrl<T>) then) =
      _$InvalidPhotoUrlCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$InvalidPhotoUrlCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidPhotoUrlCopyWith<T, $Res> {
  _$InvalidPhotoUrlCopyWithImpl(
      InvalidPhotoUrl<T> _value, $Res Function(InvalidPhotoUrl<T>) _then)
      : super(_value, (v) => _then(v as InvalidPhotoUrl<T>));

  @override
  InvalidPhotoUrl<T> get _value => super._value as InvalidPhotoUrl<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidPhotoUrl<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$InvalidPhotoUrl<T> implements InvalidPhotoUrl<T> {
  const _$InvalidPhotoUrl({this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidPhotoUrl(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidPhotoUrl<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidPhotoUrlCopyWith<T, InvalidPhotoUrl<T>> get copyWith =>
      _$InvalidPhotoUrlCopyWithImpl<T, InvalidPhotoUrl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result multiline(T failedValue),
    @required Result numberTooLarge(T failedValue, num max),
    @required Result listTooLong(T failedValue, int max),
    @required Result invalidEmail(T failedValue),
    @required Result shortPassword(T failedValue),
    @required Result invalidPhotoUrl(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return invalidPhotoUrl(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result multiline(T failedValue),
    Result numberTooLarge(T failedValue, num max),
    Result listTooLong(T failedValue, int max),
    Result invalidEmail(T failedValue),
    Result shortPassword(T failedValue),
    Result invalidPhotoUrl(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPhotoUrl != null) {
      return invalidPhotoUrl(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result multiline(Multiline<T> value),
    @required Result numberTooLarge(NumberTooLarge<T> value),
    @required Result listTooLong(ListTooLong<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    @required Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return invalidPhotoUrl(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result multiline(Multiline<T> value),
    Result numberTooLarge(NumberTooLarge<T> value),
    Result listTooLong(ListTooLong<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPhotoUrl != null) {
      return invalidPhotoUrl(this);
    }
    return orElse();
  }
}

abstract class InvalidPhotoUrl<T> implements ValueFailure<T> {
  const factory InvalidPhotoUrl({T failedValue}) = _$InvalidPhotoUrl<T>;

  @override
  T get failedValue;
  @override
  $InvalidPhotoUrlCopyWith<T, InvalidPhotoUrl<T>> get copyWith;
}

abstract class $InvalidPhoneNumberCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidPhoneNumberCopyWith(InvalidPhoneNumber<T> value,
          $Res Function(InvalidPhoneNumber<T>) then) =
      _$InvalidPhoneNumberCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$InvalidPhoneNumberCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidPhoneNumberCopyWith<T, $Res> {
  _$InvalidPhoneNumberCopyWithImpl(
      InvalidPhoneNumber<T> _value, $Res Function(InvalidPhoneNumber<T>) _then)
      : super(_value, (v) => _then(v as InvalidPhoneNumber<T>));

  @override
  InvalidPhoneNumber<T> get _value => super._value as InvalidPhoneNumber<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidPhoneNumber<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$InvalidPhoneNumber<T> implements InvalidPhoneNumber<T> {
  const _$InvalidPhoneNumber({this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidPhoneNumber(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidPhoneNumber<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidPhoneNumberCopyWith<T, InvalidPhoneNumber<T>> get copyWith =>
      _$InvalidPhoneNumberCopyWithImpl<T, InvalidPhoneNumber<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result multiline(T failedValue),
    @required Result numberTooLarge(T failedValue, num max),
    @required Result listTooLong(T failedValue, int max),
    @required Result invalidEmail(T failedValue),
    @required Result shortPassword(T failedValue),
    @required Result invalidPhotoUrl(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return invalidPhoneNumber(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result multiline(T failedValue),
    Result numberTooLarge(T failedValue, num max),
    Result listTooLong(T failedValue, int max),
    Result invalidEmail(T failedValue),
    Result shortPassword(T failedValue),
    Result invalidPhotoUrl(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPhoneNumber != null) {
      return invalidPhoneNumber(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result multiline(Multiline<T> value),
    @required Result numberTooLarge(NumberTooLarge<T> value),
    @required Result listTooLong(ListTooLong<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
    @required Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    @required Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(numberTooLarge != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(invalidPhotoUrl != null);
    assert(invalidPhoneNumber != null);
    return invalidPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result multiline(Multiline<T> value),
    Result numberTooLarge(NumberTooLarge<T> value),
    Result listTooLong(ListTooLong<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    Result invalidPhotoUrl(InvalidPhotoUrl<T> value),
    Result invalidPhoneNumber(InvalidPhoneNumber<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPhoneNumber != null) {
      return invalidPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class InvalidPhoneNumber<T> implements ValueFailure<T> {
  const factory InvalidPhoneNumber({T failedValue}) = _$InvalidPhoneNumber<T>;

  @override
  T get failedValue;
  @override
  $InvalidPhoneNumberCopyWith<T, InvalidPhoneNumber<T>> get copyWith;
}
