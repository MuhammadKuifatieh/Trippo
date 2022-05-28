part of 'page_manager_bloc.dart';

abstract class PageManagerEvent {}

class ChangePageEvent extends PageManagerEvent {
  final int selectedIndex;
  ChangePageEvent({
    required this.selectedIndex,
  });
}
