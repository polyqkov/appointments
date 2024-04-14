import '../../mocks.dart';
import '../../models/certificate_model.dart';

abstract class CertificatesLocalDataSource {
  Future<List<CertificateModel>?> getCertificates();
}

class CertificatesLocalDataSourceImpl implements CertificatesLocalDataSource {
  @override
  Future<List<CertificateModel>?> getCertificates() =>
      Future.delayed(const Duration(seconds: 1)).then((value) => Mocks
          .certificatesMock
          .map((e) => CertificateModel.fromJson(e))
          .toList());
}
