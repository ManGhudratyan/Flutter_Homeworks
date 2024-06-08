import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contacts_firebase/models/user_model.dart';
import 'package:contacts_firebase/services/add_db_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  SaveBloc(this.addDbService) : super(SaveInitial()) {
    on<SaveDbEvent>(_mapSaveDbEventToState);
  }
  final AddDbService addDbService;

  FutureOr<void> _mapSaveDbEventToState(
      SaveDbEvent event, Emitter<SaveState> emit) async {
    try {
      emit(SaveLoading());
      final userModel = UserModel(
        userId: UniqueKey().toString(),
        name: event.name,
        phoneNumber: event.phoneNumber,
      );
      await addDbService.saveUserToDB(userModel);

      emit(SaveLoaded(event.name, event.phoneNumber));
    } on FirebaseAuthException catch (error) {
      emit(SaveFailed(error.toString()));
    }
  }
}
