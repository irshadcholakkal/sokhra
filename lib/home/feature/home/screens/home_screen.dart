import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import '../../../../base_module/presentation/util/exit_popup_helper.dart';
import '../../../../catalogue_module/presentation/feature/list_catalogue/screens/list_catalogue.dart';
import '../../../../catalogue_module/presentation/feature/list_catalogue/widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppDataBloc>(context).add(FetchAppData(reFetch: true));

    // if (userData.pinCode.isEmpty) {
    //   showLocationsDialog(context);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          return true;
        } else {
          return ExitPopupHelper.showExitPopup(context);
        }
      },
      child:// MyCustomBottomNavigationBar()
       MyBottomNavigationBar()
      // ListCatalogue(),
    );
  }
}
