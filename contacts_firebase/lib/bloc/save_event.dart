part of 'save_bloc.dart';

sealed class SaveEvent extends Equatable {
  const SaveEvent();

  @override
  List<Object> get props => [];
}

final class SaveDbEvent extends SaveEvent {
  final String name; 
  final int phoneNumber;

  const SaveDbEvent(this.name, this.phoneNumber);
}
