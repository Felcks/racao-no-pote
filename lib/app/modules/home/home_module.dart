import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../core/device/location_manager.dart';
import '../../core/network/network_info.dart';
import 'data/data_sources/backyard_local_data_source.dart';
import 'data/data_sources/backyard_remote_data_source.dart';
import 'data/repositories/backyard_repository_impl.dart';
import 'domain/usecases/create_backyard.dart';
import 'domain/usecases/list_backyard.dart';
import 'domain/usecases/reset_backyard_when_day_passed.dart';
import 'domain/usecases/select_backyard.dart';
import 'domain/usecases/unselect_backyard.dart';
import 'domain/usecases/update_backyard.dart';
import 'domain/usecases/view_backyard.dart';
import 'presentation/controller/home_controller.dart';
import 'presentation/pages/backyard_creation/backyard_creation_controller.dart';
import 'presentation/pages/backyard_creation/backyard_creation_page.dart';
import 'presentation/pages/backyard_list_page/backyard_list_page.dart';
import 'presentation/pages/backyard_list_page/backyard_list_page_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BackyardCreationController()),
        Bind((i) => BackyardListPageController()),
        Bind((i) => sp),
        Bind((i) => NetworkInfoImpl(DataConnectionChecker())),
        Bind((i) => BackyardLocalDataSourceImpl(
            sharedPreferences: i.get<SharedPreferences>())),
        Bind((i) => BackyardRemoteDataSourceImpl()),
        Bind((i) => BackyardRepositoryImpl(
            networkInfo: i.get<NetworkInfoImpl>(),
            localDataSource: i.get<BackyardLocalDataSourceImpl>(),
            remoteDataSource: i.get<BackyardRemoteDataSourceImpl>())),
        Bind((i) => CreateBackyard(i.get<BackyardRepositoryImpl>())),
        Bind((i) => ListBackyard(i.get<BackyardRepositoryImpl>())),
        Bind((i) => SelectBackyard(i.get<BackyardRepositoryImpl>())),
        Bind((i) => UnselectBackyard(i.get<BackyardRepositoryImpl>())),
        Bind((i) => UpdateBackyard(i.get<BackyardRepositoryImpl>())),
        Bind((i) => ViewBackyard(i.get<BackyardRepositoryImpl>())),
        Bind((i) => ResetBackyardWhenDayPassed(i.get<BackyardRepositoryImpl>(),
            i.get<LocationManager>().userLocation)),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => BackyardListPage()),
        Router("/backyard", child: (_, args) => HomePage()),
        // Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router("/backyard_creation",
            child: (_, args) => BackyardCreationPage(
                title: args.data != null ? args.data[0] : "Criar quintal",
                backyard: args.data != null ? args.data[1] : null)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
