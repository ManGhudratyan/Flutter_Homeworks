part of 'save_bloc.dart';

sealed class SaveState extends Equatable {
  const SaveState({this.error, this.name, this.phoneNumber});
  final String? error;
  final String? name;
  final int? phoneNumber;

  @override
  List<Object?> get props => [error, name, phoneNumber];
}

final class SaveInitial extends SaveState {}

final class SaveFailed extends SaveState {
  const SaveFailed(String error) : super(error: error);
}

final class SaveLoading extends SaveState {}

final class SaveLoaded extends SaveState {
  const SaveLoaded(String name, int phoneNumber)
      : super(name: name, phoneNumber: phoneNumber);
}
