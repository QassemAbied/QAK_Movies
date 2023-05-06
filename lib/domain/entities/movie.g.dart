// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MadiaAdapter extends TypeAdapter<Madia> {
  @override
  final int typeId = 0;

  @override
  Madia read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Madia(
      tmdbID: fields[0] as int,
      title: fields[1] as String,
      posterUrl: fields[2] as String,
      backdropUrl: fields[3] as String,
      voteAverage: fields[4] as double,
      releaseDate: fields[5] as String,
      overview: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Madia obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.tmdbID)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterUrl)
      ..writeByte(3)
      ..write(obj.backdropUrl)
      ..writeByte(4)
      ..write(obj.voteAverage)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.overview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MadiaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
