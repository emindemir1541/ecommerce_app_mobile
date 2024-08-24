import 'package:ecommerce_app_mobile/data/model/category_struct.dart';
import 'package:ecommerce_app_mobile/data/provider/product_service_provider.dart';
import 'package:ecommerce_app_mobile/presentation/discover/bloc/discover_event.dart';
import 'package:ecommerce_app_mobile/presentation/discover/bloc/discover_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sddklibrary/util/resource.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc() : super(InitialDiscoverState()) {
    ProductServiceProvider service = ProductServiceProvider();

    on<LoadCategoriesEvent>((event, emit) async {
      emit(InitialDiscoverState());
      emit(CategoryLoadingState(  state.categoryStruct));
      final resource = await service.getCategoriesByLayer();
      switch (resource.status) {
        case Status.success:
          emit(CategorySuccessState( CategoryStruct(resource.data!)));
          break;
        case Status.fail:
          emit(CategoryFailState(resource.error!,   state.categoryStruct));
          break;
        case Status.loading:
          emit(CategoryLoadingState(  state.categoryStruct));
          break;
        case Status.stable:
          emit(CategoryLoadingState(  state.categoryStruct));
      }
    });
    on<NextCategoryLayerEvent>((event, emit) {
      emit(CategoryLoadingState(  state.categoryStruct));
      final CategoryStruct categoryStruct = state.categoryStruct;
      categoryStruct.nextLayer(event.selectedCategory);
      emit(CategorySuccessState( categoryStruct));
    });

    on<PreviousCategoryLayerEvent>((event, emit) {
      emit(CategoryLoadingState(  state.categoryStruct));
      final CategoryStruct categoryStruct = state.categoryStruct;
      categoryStruct.previousLayer();
      emit(CategorySuccessState( categoryStruct));
    });
  }
}
