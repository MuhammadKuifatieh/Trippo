part of 'page_manager_bloc.dart';

class PageManagerState {
  final int selectedIndex;
  PageManagerState({
    this.selectedIndex = 0,
  });
  PageManagerState copyWith({int? selectedIndex}) {
    return PageManagerState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
