import 'package:ecommerce_app_mobile/common/constant/app_durations.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';
import 'package:ecommerce_app_mobile/presentation/address/bloc/add_address_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/address/bloc/add_address_state.dart';
import 'package:ecommerce_app_mobile/presentation/address/widgets/edit_address.dart';
import 'package:ecommerce_app_mobile/presentation/address/widgets/map_picker.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/app_bar_pop_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sddklibrary/util/Log.dart';
import '../bloc/add_address_event.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  PageController controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.page == 0) {
        BlocProvider.of<AddAddressBloc>(context).add(PopBackEvent(true));
      } else {
        BlocProvider.of<AddAddressBloc>(context).add(PopBackEvent(false));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAddressBloc, AddAddressState>(
      builder: (BuildContext context, AddAddressState state) => PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if(!didPop){
            controller.animateToPage(0, duration: AppDurations.defaultDuration, curve: Curves.easeInOut);
          }
        },
        canPop: state.canPop,
        child: Scaffold(
          appBar: AppBarPopBack(
            title: AppText.addressesPageAddAddress.capitalizeEveryWord.get,
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              Stack(
                children: [
                  MapPicker(
                    onNextPressed: () {
                      Log.test(title: "onNextPressed", data: state);
                      controller.animateToPage(1, duration: AppDurations.defaultDuration, curve: Curves.easeInOut);
                    },
                  ),
                ],
              ),
              const EditAddress()
            ],
          ),
        ),
      ),
    );
  }
}
