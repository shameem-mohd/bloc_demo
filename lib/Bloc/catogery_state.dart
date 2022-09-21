part of 'catogery_bloc.dart';

@immutable
abstract class CatogeryState {}

class CatogeryInitial extends CatogeryState {}
class CatogeryLoading extends CatogeryState {}
class CatogeryLoaded extends CatogeryState {}
class CatogeryError extends CatogeryState {}
