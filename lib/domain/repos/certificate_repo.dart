import '../../data/models/certificate_model.dart';

abstract class CertificateRepo {
  Future<List<CertificateModel>?> getCertificates();
}
