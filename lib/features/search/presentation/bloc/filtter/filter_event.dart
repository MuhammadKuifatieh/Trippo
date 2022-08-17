part of 'filter_bloc.dart';

abstract class FilterEvent {
  const FilterEvent();

  
}
class OnPressItemRating extends FilterEvent{

  final bool isSelected;
final dynamic item;
final String? itemTitle;
  OnPressItemRating(  {this.itemTitle,this.item,required this.isSelected});
}

class OnPressItemReviewDate extends FilterEvent{

  final bool isSelected;
final dynamic item;
final String? itemTitle;
  OnPressItemReviewDate(  {this.itemTitle,this.item,required this.isSelected});
}

class OnPressItemTimeOfYear extends FilterEvent{

  final bool isSelected;
final dynamic item;
final String? itemTitle;
  OnPressItemTimeOfYear(  {this.itemTitle,this.item,required this.isSelected});
}

class OnPressItemTypeOfVisit extends FilterEvent{

  final bool isSelected;
final dynamic item;
final String? itemTitle;
  OnPressItemTypeOfVisit(  {this.itemTitle,this.item,required this.isSelected});
}

class OnPressItemtypeOfVisit2 extends FilterEvent{

  final bool isSelected;
final dynamic item;
final String? itemTitle;
  OnPressItemtypeOfVisit2(  {this.itemTitle,this.item,required this.isSelected});
}

class OnPressItemtypeOfVisit3 extends FilterEvent{

  final bool isSelected;
final dynamic item;
final String? itemTitle;
  OnPressItemtypeOfVisit3(  {this.itemTitle,this.item,required this.isSelected});
}

class GetFilterName extends FilterEvent{}
class ClearFilter extends FilterEvent{}