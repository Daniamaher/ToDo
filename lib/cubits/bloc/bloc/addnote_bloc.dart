import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addnote_event.dart';
part 'addnote_state.dart';

class AddnoteBloc extends Bloc<AddnoteEvent, AddnoteState> {
  AddnoteBloc() : super(AddnoteInitial()) {
    on<AddnoteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
