import 'package:pure_convoy/MainPage/bloc/main_page_bloc_bloc.dart';

class GetTextInputMainPageEvent extends MainPageBlocEvent {
  final String text;

  GetTextInputMainPageEvent({required this.text});
}
