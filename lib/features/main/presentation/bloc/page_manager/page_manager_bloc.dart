import 'package:bloc/bloc.dart';

part 'page_manager_event.dart';
part 'page_manager_state.dart';

class PageManagerBloc extends Bloc<PageManagerEvent, PageManagerState> {
  PageManagerBloc() : super(PageManagerState()) {
    on<ChangePageEvent>(
      (event, emit) => emit(state.copyWith(selectedIndex: event.selectedIndex)),
    );
  }
}
