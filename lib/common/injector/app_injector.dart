import '../../data/data_sources/appointments_data_source/appointments_local_data_source.dart';
import '../../data/data_sources/certificates_data_source/certificates_local_data_source.dart';
import '../../data/data_sources/services_data_source/services_local_data_source_impl.dart';
import '../../data/database/app_database.dart';
import '../../data/repos/appointment_repo_impl.dart';
import '../../data/repos/certificate_repo_impl.dart';
import '../../data/repos/service_repo_impl.dart';
import '../../domain/repos/certificate_repo.dart';
import '../../domain/repos/service_repo.dart';
import 'package:injector/injector.dart';

import '../../domain/repos/appointment_repo.dart';

class AppInjector {
  static final injector = Injector.appInstance;

  static void init() {
    injector.registerDependency<AppointmentRepo>(() => AppointmentRepoImpl(
        appointmentsLocalDataSource: AppointmentsLocalDataSourceImpl()));
    injector.registerDependency<CertificateRepo>(() => CertificateRepoImpl(
        certificatesLocalDataSource: CertificatesLocalDataSourceImpl()));
    injector.registerDependency<ServiceRepo>(() => ServiceRepoImpl(
        servicesLocalDataSource: ServicesLocalDataSourceImpl()));
    injector.registerSingleton<AppDatabase>(() => AppDatabase());
  }
}
