import 'package:bloc/bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState()) {
    on<FilterEvent>((event, emit) {});
    on<OnPressItemRating>(_mapOnPressItemEvent);
    on<OnPressItemReviewDate>(_mapOnPressItemReviewDateEvent);
    on<OnPressItemTimeOfYear>(_mapOnPressItemTimeOfYearEvent);
    on<OnPressItemTypeOfVisit>(_mapOnPressItemTypeOfVisitEvent);
    on<OnPressItemtypeOfVisit2>(_mapOnPressItemtypeOfVisit2Event);
    on<OnPressItemtypeOfVisit3>(_mapOnPressItemtypeOfVisit3Event);
    on<GetFilterName>(_mapGetFilterNameEvent);
    on<ClearFilter>(_mapClearFilterEvent);
  }
  _mapGetFilterNameEvent(GetFilterName event, Emitter<FilterState> emit) {
    state.dataData = {};

    for (var element in state.filterTitle) {
      if (!state.dataData.containsKey(element)) {
        state.dataData[element] = 1;
      } else {
        state.dataData[element] = state.dataData[element]! + 1;
      }
    }
    emit(state.copyWith(dataData: state.dataData));
  }

  _mapOnPressItemEvent(OnPressItemRating event, Emitter<FilterState> emit) {
    print("the event val is:${event.isSelected}");
    if (event.isSelected) {
      emit(
        state.copyWith(
          status: FilterStatus.addSelectedItem,
          select: event.isSelected, //state.data.contains(event.item),
          ratingData: List.of(state.ratingData)..add(event.item),
          filterTitle: List.of(state.filterTitle)..add(event.itemTitle!),
        ),
      );

      //add new item to the list
    } else {
      emit(
        state.copyWith(
            status: FilterStatus.deleteSelectedItem,
            select: event.isSelected,
            ratingData: List.of(state.ratingData)..remove(event.item),
            filterTitle: List.of(state.filterTitle)..remove(event.itemTitle!),
            dataData: Map.of(state.dataData)..remove(state.dataData)),
      );

      //change value isSelected
      //remove item from the list by id
    }
  }

  _mapOnPressItemReviewDateEvent(
      OnPressItemReviewDate event, Emitter<FilterState> emit) {
    if (event.isSelected) {
      emit(
        state.copyWith(
            status: FilterStatus.addSelectedItem,
            select: event.isSelected, //state.data.contains(event.item),
            reviewDate: List.of(state.reviewDate)..add(event.item),
            filterTitle: List.of(state.filterTitle)..add(event.itemTitle!)),
      );

      //add new item to the list
    } else {
      emit(
        state.copyWith(
            status: FilterStatus.deleteSelectedItem,
            select: event.isSelected,
            reviewDate: List.of(state.reviewDate)..remove(event.item),
            filterTitle: List.of(state.filterTitle)..remove(event.itemTitle!)),
      );
    }
  }

  _mapOnPressItemTimeOfYearEvent(
      OnPressItemTimeOfYear event, Emitter<FilterState> emit) {
    if (event.isSelected) {
      emit(
        state.copyWith(
            status: FilterStatus.addSelectedItem,
            select: event.isSelected, //state.data.contains(event.item),
            timeOfYear: List.of(state.timeOfYear)..add(event.item),
            filterTitle: List.of(state.filterTitle)..add(event.itemTitle!)),
      );

      //add new item to the list
    } else {
      emit(
        state.copyWith(
            status: FilterStatus.deleteSelectedItem,
            select: event.isSelected,
            timeOfYear: List.of(state.timeOfYear)..remove(event.item),
            filterTitle: List.of(state.filterTitle)..remove(event.itemTitle!)),
      );
    }
  }

  _mapOnPressItemTypeOfVisitEvent(
      OnPressItemTypeOfVisit event, Emitter<FilterState> emit) {
    if (event.isSelected) {
      emit(
        state.copyWith(
            status: FilterStatus.addSelectedItem,
            select: event.isSelected, //state.data.contains(event.item),
            typeOfVisit: List.of(state.typeOfVisit)..add(event.item),
            filterTitle: List.of(state.filterTitle)..add(event.itemTitle!)),
      );

      //add new item to the list
    } else {
      emit(
        state.copyWith(
            status: FilterStatus.deleteSelectedItem,
            select: event.isSelected,
            typeOfVisit: List.of(state.typeOfVisit)..remove(event.item),
            filterTitle: List.of(state.filterTitle)..remove(event.itemTitle!)),
      );
    }
  }

  _mapOnPressItemtypeOfVisit2Event(
      OnPressItemtypeOfVisit2 event, Emitter<FilterState> emit) {
    if (event.isSelected) {
      emit(
        state.copyWith(
            status: FilterStatus.addSelectedItem,
            select: event.isSelected, //state.data.contains(event.item),
            typeOfVisit2: List.of(state.typeOfVisit2)..add(event.item),
            filterTitle: List.of(state.filterTitle)..add(event.itemTitle!)),
      );

      //add new item to the list
    } else {
      emit(
        state.copyWith(
            status: FilterStatus.deleteSelectedItem,
            select: event.isSelected,
            typeOfVisit2: List.of(state.typeOfVisit2)..remove(event.item),
            filterTitle: List.of(state.filterTitle)..remove(event.itemTitle!)),
      );
    }
  }

  _mapOnPressItemtypeOfVisit3Event(
      OnPressItemtypeOfVisit3 event, Emitter<FilterState> emit) {
    if (event.isSelected) {
      emit(
        state.copyWith(
            status: FilterStatus.addSelectedItem,
            select: event.isSelected, //state.data.contains(event.item),
            typeOfVisit3: List.of(state.typeOfVisit3)..add(event.item),
            filterTitle: List.of(state.filterTitle)..add(event.itemTitle!)),
      );

      //add new item to the list
    } else {
      emit(
        state.copyWith(
            status: FilterStatus.deleteSelectedItem,
            select: event.isSelected,
            typeOfVisit3: List.of(state.typeOfVisit3)..remove(event.item),
            filterTitle: List.of(state.filterTitle)..remove(event.itemTitle!)),
      );
    }
  }

  _mapClearFilterEvent(ClearFilter event, Emitter<FilterState> emit) {
    state.dataData = {};
    state.ratingData = [];
    state.reviewDate = [];
    state.timeOfYear = [];
    state.typeOfVisit3 = [];
    state.typeOfVisit = [];
    state.typeOfVisit2 = [];
    state.filterTitle = [];
    emit(state.copyWith(
      status: FilterStatus.clearFilter,
    ));
  }
}
