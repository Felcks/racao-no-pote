import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:racao_no_pote/app/modules/home/domain/usecases/get_backyard_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../core/network/network_info.dart';
import 'data/data_sources/backyard_local_data_source.dart';
import 'data/data_sources/backyard_remote_data_source.dart';
import 'data/repositories/backyard_repository_impl.dart';
import 'domain/usecases/create_backyard.dart';
import 'domain/usecases/get_current_backyard.dart';
import 'domain/usecases/update_current_backyard.dart';
import 'presentation/controller/home_controller.dart';
import 'presentation/pages/backyard_list_page/backyard_list_page_controller.dart';
import 'presentation/pages/backyard_list_page/backyard_list_page_page.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
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
        Bind((i) => GetCurrentBackyard(i.get<BackyardRepositoryImpl>())),
        Bind((i) => UpdateCurrentBackyard(i.get<BackyardRepositoryImpl>())),
        Bind((i) => CreateBackyard(i.get<BackyardRepositoryImpl>())),
        Bind((i) => GetBackyardList(i.get<BackyardRepositoryImpl>())),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => BackyardListPage()),
        Router("/backyard", child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
