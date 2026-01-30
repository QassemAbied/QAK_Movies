// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailsMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailsMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailsMoviesState()';
}


}

/// @nodoc
class $DetailsMoviesStateCopyWith<$Res>  {
$DetailsMoviesStateCopyWith(DetailsMoviesState _, $Res Function(DetailsMoviesState) __);
}


/// Adds pattern-matching-related methods to [DetailsMoviesState].
extension DetailsMoviesStatePatterns on DetailsMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  detailsInitial,TResult Function( Loading value)?  detailsLoading,TResult Function( Success value)?  detailsSuccess,TResult Function( Error value)?  detailsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when detailsInitial != null:
return detailsInitial(_that);case Loading() when detailsLoading != null:
return detailsLoading(_that);case Success() when detailsSuccess != null:
return detailsSuccess(_that);case Error() when detailsError != null:
return detailsError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  detailsInitial,required TResult Function( Loading value)  detailsLoading,required TResult Function( Success value)  detailsSuccess,required TResult Function( Error value)  detailsError,}){
final _that = this;
switch (_that) {
case _Initial():
return detailsInitial(_that);case Loading():
return detailsLoading(_that);case Success():
return detailsSuccess(_that);case Error():
return detailsError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  detailsInitial,TResult? Function( Loading value)?  detailsLoading,TResult? Function( Success value)?  detailsSuccess,TResult? Function( Error value)?  detailsError,}){
final _that = this;
switch (_that) {
case _Initial() when detailsInitial != null:
return detailsInitial(_that);case Loading() when detailsLoading != null:
return detailsLoading(_that);case Success() when detailsSuccess != null:
return detailsSuccess(_that);case Error() when detailsError != null:
return detailsError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  detailsInitial,TResult Function()?  detailsLoading,TResult Function( DetailsMoviesResponse detailsMoviesResponse,  CreditsResponse creditsResponse,  ImagesMoviesResponse imagesMoviesResponse,  MoviesResponse moviesResponse,  VideoResponses videoResponses)?  detailsSuccess,TResult Function( String error)?  detailsError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when detailsInitial != null:
return detailsInitial();case Loading() when detailsLoading != null:
return detailsLoading();case Success() when detailsSuccess != null:
return detailsSuccess(_that.detailsMoviesResponse,_that.creditsResponse,_that.imagesMoviesResponse,_that.moviesResponse,_that.videoResponses);case Error() when detailsError != null:
return detailsError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  detailsInitial,required TResult Function()  detailsLoading,required TResult Function( DetailsMoviesResponse detailsMoviesResponse,  CreditsResponse creditsResponse,  ImagesMoviesResponse imagesMoviesResponse,  MoviesResponse moviesResponse,  VideoResponses videoResponses)  detailsSuccess,required TResult Function( String error)  detailsError,}) {final _that = this;
switch (_that) {
case _Initial():
return detailsInitial();case Loading():
return detailsLoading();case Success():
return detailsSuccess(_that.detailsMoviesResponse,_that.creditsResponse,_that.imagesMoviesResponse,_that.moviesResponse,_that.videoResponses);case Error():
return detailsError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  detailsInitial,TResult? Function()?  detailsLoading,TResult? Function( DetailsMoviesResponse detailsMoviesResponse,  CreditsResponse creditsResponse,  ImagesMoviesResponse imagesMoviesResponse,  MoviesResponse moviesResponse,  VideoResponses videoResponses)?  detailsSuccess,TResult? Function( String error)?  detailsError,}) {final _that = this;
switch (_that) {
case _Initial() when detailsInitial != null:
return detailsInitial();case Loading() when detailsLoading != null:
return detailsLoading();case Success() when detailsSuccess != null:
return detailsSuccess(_that.detailsMoviesResponse,_that.creditsResponse,_that.imagesMoviesResponse,_that.moviesResponse,_that.videoResponses);case Error() when detailsError != null:
return detailsError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DetailsMoviesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailsMoviesState.detailsInitial()';
}


}




/// @nodoc


class Loading implements DetailsMoviesState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailsMoviesState.detailsLoading()';
}


}




/// @nodoc


class Success implements DetailsMoviesState {
  const Success({required this.detailsMoviesResponse, required this.creditsResponse, required this.imagesMoviesResponse, required this.moviesResponse, required this.videoResponses});
  

 final  DetailsMoviesResponse detailsMoviesResponse;
 final  CreditsResponse creditsResponse;
 final  ImagesMoviesResponse imagesMoviesResponse;
 final  MoviesResponse moviesResponse;
 final  VideoResponses videoResponses;

/// Create a copy of DetailsMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&(identical(other.detailsMoviesResponse, detailsMoviesResponse) || other.detailsMoviesResponse == detailsMoviesResponse)&&(identical(other.creditsResponse, creditsResponse) || other.creditsResponse == creditsResponse)&&(identical(other.imagesMoviesResponse, imagesMoviesResponse) || other.imagesMoviesResponse == imagesMoviesResponse)&&(identical(other.moviesResponse, moviesResponse) || other.moviesResponse == moviesResponse)&&(identical(other.videoResponses, videoResponses) || other.videoResponses == videoResponses));
}


@override
int get hashCode => Object.hash(runtimeType,detailsMoviesResponse,creditsResponse,imagesMoviesResponse,moviesResponse,videoResponses);

@override
String toString() {
  return 'DetailsMoviesState.detailsSuccess(detailsMoviesResponse: $detailsMoviesResponse, creditsResponse: $creditsResponse, imagesMoviesResponse: $imagesMoviesResponse, moviesResponse: $moviesResponse, videoResponses: $videoResponses)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $DetailsMoviesStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 DetailsMoviesResponse detailsMoviesResponse, CreditsResponse creditsResponse, ImagesMoviesResponse imagesMoviesResponse, MoviesResponse moviesResponse, VideoResponses videoResponses
});




}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of DetailsMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detailsMoviesResponse = null,Object? creditsResponse = null,Object? imagesMoviesResponse = null,Object? moviesResponse = null,Object? videoResponses = null,}) {
  return _then(Success(
detailsMoviesResponse: null == detailsMoviesResponse ? _self.detailsMoviesResponse : detailsMoviesResponse // ignore: cast_nullable_to_non_nullable
as DetailsMoviesResponse,creditsResponse: null == creditsResponse ? _self.creditsResponse : creditsResponse // ignore: cast_nullable_to_non_nullable
as CreditsResponse,imagesMoviesResponse: null == imagesMoviesResponse ? _self.imagesMoviesResponse : imagesMoviesResponse // ignore: cast_nullable_to_non_nullable
as ImagesMoviesResponse,moviesResponse: null == moviesResponse ? _self.moviesResponse : moviesResponse // ignore: cast_nullable_to_non_nullable
as MoviesResponse,videoResponses: null == videoResponses ? _self.videoResponses : videoResponses // ignore: cast_nullable_to_non_nullable
as VideoResponses,
  ));
}


}

/// @nodoc


class Error implements DetailsMoviesState {
  const Error({required this.error});
  

 final  String error;

/// Create a copy of DetailsMoviesState
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
  return 'DetailsMoviesState.detailsError(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $DetailsMoviesStateCopyWith<$Res> {
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

/// Create a copy of DetailsMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
