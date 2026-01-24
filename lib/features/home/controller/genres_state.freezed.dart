// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genres_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GenreState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenreState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GenreState()';
}


}

/// @nodoc
class $GenreStateCopyWith<$Res>  {
$GenreStateCopyWith(GenreState _, $Res Function(GenreState) __);
}


/// Adds pattern-matching-related methods to [GenreState].
extension GenreStatePatterns on GenreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GenresInitial value)?  initial,TResult Function( GenresLoading value)?  genresLoading,TResult Function( GenresSuccess value)?  genresSuccess,TResult Function( GenresError value)?  genresError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenresInitial() when initial != null:
return initial(_that);case GenresLoading() when genresLoading != null:
return genresLoading(_that);case GenresSuccess() when genresSuccess != null:
return genresSuccess(_that);case GenresError() when genresError != null:
return genresError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GenresInitial value)  initial,required TResult Function( GenresLoading value)  genresLoading,required TResult Function( GenresSuccess value)  genresSuccess,required TResult Function( GenresError value)  genresError,}){
final _that = this;
switch (_that) {
case _GenresInitial():
return initial(_that);case GenresLoading():
return genresLoading(_that);case GenresSuccess():
return genresSuccess(_that);case GenresError():
return genresError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GenresInitial value)?  initial,TResult? Function( GenresLoading value)?  genresLoading,TResult? Function( GenresSuccess value)?  genresSuccess,TResult? Function( GenresError value)?  genresError,}){
final _that = this;
switch (_that) {
case _GenresInitial() when initial != null:
return initial(_that);case GenresLoading() when genresLoading != null:
return genresLoading(_that);case GenresSuccess() when genresSuccess != null:
return genresSuccess(_that);case GenresError() when genresError != null:
return genresError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  genresLoading,TResult Function( List<GenresModels> genres,  List<MovieModel> moviesByGenres,  int selectedGenreId)?  genresSuccess,TResult Function( ApiErrorModel error)?  genresError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenresInitial() when initial != null:
return initial();case GenresLoading() when genresLoading != null:
return genresLoading();case GenresSuccess() when genresSuccess != null:
return genresSuccess(_that.genres,_that.moviesByGenres,_that.selectedGenreId);case GenresError() when genresError != null:
return genresError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  genresLoading,required TResult Function( List<GenresModels> genres,  List<MovieModel> moviesByGenres,  int selectedGenreId)  genresSuccess,required TResult Function( ApiErrorModel error)  genresError,}) {final _that = this;
switch (_that) {
case _GenresInitial():
return initial();case GenresLoading():
return genresLoading();case GenresSuccess():
return genresSuccess(_that.genres,_that.moviesByGenres,_that.selectedGenreId);case GenresError():
return genresError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  genresLoading,TResult? Function( List<GenresModels> genres,  List<MovieModel> moviesByGenres,  int selectedGenreId)?  genresSuccess,TResult? Function( ApiErrorModel error)?  genresError,}) {final _that = this;
switch (_that) {
case _GenresInitial() when initial != null:
return initial();case GenresLoading() when genresLoading != null:
return genresLoading();case GenresSuccess() when genresSuccess != null:
return genresSuccess(_that.genres,_that.moviesByGenres,_that.selectedGenreId);case GenresError() when genresError != null:
return genresError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _GenresInitial implements GenreState {
  const _GenresInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenresInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GenreState.initial()';
}


}




/// @nodoc


class GenresLoading implements GenreState {
  const GenresLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenresLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GenreState.genresLoading()';
}


}




/// @nodoc


class GenresSuccess implements GenreState {
  const GenresSuccess({required final  List<GenresModels> genres, required final  List<MovieModel> moviesByGenres, required this.selectedGenreId}): _genres = genres,_moviesByGenres = moviesByGenres;
  

 final  List<GenresModels> _genres;
 List<GenresModels> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<MovieModel> _moviesByGenres;
 List<MovieModel> get moviesByGenres {
  if (_moviesByGenres is EqualUnmodifiableListView) return _moviesByGenres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_moviesByGenres);
}

 final  int selectedGenreId;

/// Create a copy of GenreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenresSuccessCopyWith<GenresSuccess> get copyWith => _$GenresSuccessCopyWithImpl<GenresSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenresSuccess&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._moviesByGenres, _moviesByGenres)&&(identical(other.selectedGenreId, selectedGenreId) || other.selectedGenreId == selectedGenreId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_moviesByGenres),selectedGenreId);

@override
String toString() {
  return 'GenreState.genresSuccess(genres: $genres, moviesByGenres: $moviesByGenres, selectedGenreId: $selectedGenreId)';
}


}

/// @nodoc
abstract mixin class $GenresSuccessCopyWith<$Res> implements $GenreStateCopyWith<$Res> {
  factory $GenresSuccessCopyWith(GenresSuccess value, $Res Function(GenresSuccess) _then) = _$GenresSuccessCopyWithImpl;
@useResult
$Res call({
 List<GenresModels> genres, List<MovieModel> moviesByGenres, int selectedGenreId
});




}
/// @nodoc
class _$GenresSuccessCopyWithImpl<$Res>
    implements $GenresSuccessCopyWith<$Res> {
  _$GenresSuccessCopyWithImpl(this._self, this._then);

  final GenresSuccess _self;
  final $Res Function(GenresSuccess) _then;

/// Create a copy of GenreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? genres = null,Object? moviesByGenres = null,Object? selectedGenreId = null,}) {
  return _then(GenresSuccess(
genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenresModels>,moviesByGenres: null == moviesByGenres ? _self._moviesByGenres : moviesByGenres // ignore: cast_nullable_to_non_nullable
as List<MovieModel>,selectedGenreId: null == selectedGenreId ? _self.selectedGenreId : selectedGenreId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GenresError implements GenreState {
  const GenresError({required this.error});
  

 final  ApiErrorModel error;

/// Create a copy of GenreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenresErrorCopyWith<GenresError> get copyWith => _$GenresErrorCopyWithImpl<GenresError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenresError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GenreState.genresError(error: $error)';
}


}

/// @nodoc
abstract mixin class $GenresErrorCopyWith<$Res> implements $GenreStateCopyWith<$Res> {
  factory $GenresErrorCopyWith(GenresError value, $Res Function(GenresError) _then) = _$GenresErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$GenresErrorCopyWithImpl<$Res>
    implements $GenresErrorCopyWith<$Res> {
  _$GenresErrorCopyWithImpl(this._self, this._then);

  final GenresError _self;
  final $Res Function(GenresError) _then;

/// Create a copy of GenreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(GenresError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
