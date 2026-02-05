// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoritesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesState()';
}


}

/// @nodoc
class $FavoritesStateCopyWith<$Res>  {
$FavoritesStateCopyWith(FavoritesState _, $Res Function(FavoritesState) __);
}


/// Adds pattern-matching-related methods to [FavoritesState].
extension FavoritesStatePatterns on FavoritesState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Success value)?  success,TResult Function( Error value)?  error,TResult Function( AddFavLoading value)?  addFavLoading,TResult Function( AddFavSuccess value)?  addFavSuccess,TResult Function( AddFavError value)?  addFavError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case AddFavLoading() when addFavLoading != null:
return addFavLoading(_that);case AddFavSuccess() when addFavSuccess != null:
return addFavSuccess(_that);case AddFavError() when addFavError != null:
return addFavError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Success value)  success,required TResult Function( Error value)  error,required TResult Function( AddFavLoading value)  addFavLoading,required TResult Function( AddFavSuccess value)  addFavSuccess,required TResult Function( AddFavError value)  addFavError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Error():
return error(_that);case AddFavLoading():
return addFavLoading(_that);case AddFavSuccess():
return addFavSuccess(_that);case AddFavError():
return addFavError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Success value)?  success,TResult? Function( Error value)?  error,TResult? Function( AddFavLoading value)?  addFavLoading,TResult? Function( AddFavSuccess value)?  addFavSuccess,TResult? Function( AddFavError value)?  addFavError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case AddFavLoading() when addFavLoading != null:
return addFavLoading(_that);case AddFavSuccess() when addFavSuccess != null:
return addFavSuccess(_that);case AddFavError() when addFavError != null:
return addFavError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<MovieModel> favoritesMovies,  bool hasMor)?  success,TResult Function( String error)?  error,TResult Function()?  addFavLoading,TResult Function( AddFavResponse addFavResponse)?  addFavSuccess,TResult Function( String error)?  addFavError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.favoritesMovies,_that.hasMor);case Error() when error != null:
return error(_that.error);case AddFavLoading() when addFavLoading != null:
return addFavLoading();case AddFavSuccess() when addFavSuccess != null:
return addFavSuccess(_that.addFavResponse);case AddFavError() when addFavError != null:
return addFavError(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<MovieModel> favoritesMovies,  bool hasMor)  success,required TResult Function( String error)  error,required TResult Function()  addFavLoading,required TResult Function( AddFavResponse addFavResponse)  addFavSuccess,required TResult Function( String error)  addFavError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.favoritesMovies,_that.hasMor);case Error():
return error(_that.error);case AddFavLoading():
return addFavLoading();case AddFavSuccess():
return addFavSuccess(_that.addFavResponse);case AddFavError():
return addFavError(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<MovieModel> favoritesMovies,  bool hasMor)?  success,TResult? Function( String error)?  error,TResult? Function()?  addFavLoading,TResult? Function( AddFavResponse addFavResponse)?  addFavSuccess,TResult? Function( String error)?  addFavError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.favoritesMovies,_that.hasMor);case Error() when error != null:
return error(_that.error);case AddFavLoading() when addFavLoading != null:
return addFavLoading();case AddFavSuccess() when addFavSuccess != null:
return addFavSuccess(_that.addFavResponse);case AddFavError() when addFavError != null:
return addFavError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FavoritesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesState.initial()';
}


}




/// @nodoc


class Loading implements FavoritesState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesState.loading()';
}


}




/// @nodoc


class Success implements FavoritesState {
  const Success({required final  List<MovieModel> favoritesMovies, required this.hasMor}): _favoritesMovies = favoritesMovies;
  

 final  List<MovieModel> _favoritesMovies;
 List<MovieModel> get favoritesMovies {
  if (_favoritesMovies is EqualUnmodifiableListView) return _favoritesMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoritesMovies);
}

 final  bool hasMor;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&const DeepCollectionEquality().equals(other._favoritesMovies, _favoritesMovies)&&(identical(other.hasMor, hasMor) || other.hasMor == hasMor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_favoritesMovies),hasMor);

@override
String toString() {
  return 'FavoritesState.success(favoritesMovies: $favoritesMovies, hasMor: $hasMor)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $FavoritesStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 List<MovieModel> favoritesMovies, bool hasMor
});




}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? favoritesMovies = null,Object? hasMor = null,}) {
  return _then(Success(
favoritesMovies: null == favoritesMovies ? _self._favoritesMovies : favoritesMovies // ignore: cast_nullable_to_non_nullable
as List<MovieModel>,hasMor: null == hasMor ? _self.hasMor : hasMor // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Error implements FavoritesState {
  const Error({required this.error});
  

 final  String error;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'FavoritesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $FavoritesStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddFavLoading implements FavoritesState {
  const AddFavLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFavLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesState.addFavLoading()';
}


}




/// @nodoc


class AddFavSuccess implements FavoritesState {
  const AddFavSuccess({required this.addFavResponse});
  

 final  AddFavResponse addFavResponse;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddFavSuccessCopyWith<AddFavSuccess> get copyWith => _$AddFavSuccessCopyWithImpl<AddFavSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFavSuccess&&(identical(other.addFavResponse, addFavResponse) || other.addFavResponse == addFavResponse));
}


@override
int get hashCode => Object.hash(runtimeType,addFavResponse);

@override
String toString() {
  return 'FavoritesState.addFavSuccess(addFavResponse: $addFavResponse)';
}


}

/// @nodoc
abstract mixin class $AddFavSuccessCopyWith<$Res> implements $FavoritesStateCopyWith<$Res> {
  factory $AddFavSuccessCopyWith(AddFavSuccess value, $Res Function(AddFavSuccess) _then) = _$AddFavSuccessCopyWithImpl;
@useResult
$Res call({
 AddFavResponse addFavResponse
});




}
/// @nodoc
class _$AddFavSuccessCopyWithImpl<$Res>
    implements $AddFavSuccessCopyWith<$Res> {
  _$AddFavSuccessCopyWithImpl(this._self, this._then);

  final AddFavSuccess _self;
  final $Res Function(AddFavSuccess) _then;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? addFavResponse = null,}) {
  return _then(AddFavSuccess(
addFavResponse: null == addFavResponse ? _self.addFavResponse : addFavResponse // ignore: cast_nullable_to_non_nullable
as AddFavResponse,
  ));
}


}

/// @nodoc


class AddFavError implements FavoritesState {
  const AddFavError({required this.error});
  

 final  String error;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddFavErrorCopyWith<AddFavError> get copyWith => _$AddFavErrorCopyWithImpl<AddFavError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFavError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'FavoritesState.addFavError(error: $error)';
}


}

/// @nodoc
abstract mixin class $AddFavErrorCopyWith<$Res> implements $FavoritesStateCopyWith<$Res> {
  factory $AddFavErrorCopyWith(AddFavError value, $Res Function(AddFavError) _then) = _$AddFavErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AddFavErrorCopyWithImpl<$Res>
    implements $AddFavErrorCopyWith<$Res> {
  _$AddFavErrorCopyWithImpl(this._self, this._then);

  final AddFavError _self;
  final $Res Function(AddFavError) _then;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AddFavError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
