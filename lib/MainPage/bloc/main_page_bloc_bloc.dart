import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pure_convoy/MainPage/bloc/events/clean_button_event_main_page.dart';
import 'package:pure_convoy/MainPage/bloc/events/copy_button_event_main_page.dart';
import 'package:pure_convoy/MainPage/bloc/events/get_input_text_event_main_page.dart';
import 'package:pure_convoy/MainPage/bloc/states/states_changes_main_page.dart';
import 'package:pure_convoy/MainPage/models/converter_string.dart';

part 'events/main_page_bloc_event.dart';
part 'states/main_page_bloc_state.dart';

class MainPageBlocBloc extends Bloc<MainPageBlocEvent, MainPageBlocState> {
  String text = '';
  MainPageBlocBloc() : super(MainPageBlocInitial()) {
    on<MainPageBlocEvent>((event, emit) {
      if (event is CopyButtonMainPageEvent) {
        if (text.isNotEmpty || text != '') {
          ConverterString converter = ConverterString(text: text);
          converter.copyToClipboard();
          emit(
            StatesChangesMainPage(text: converter.getText(), isCleared: false),
          );
        }
      } else if (event is CleanButtonMainPageEvent) {
        emit(StatesChangesMainPage(text: text ='', isCleared: true));
      } else if (event is GetTextInputMainPageEvent) {
        text = event.text;
        emit(StatesChangesMainPage(text: event.text, isCleared: false));
      }
    });
  }
}
