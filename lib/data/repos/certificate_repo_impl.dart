import '../../domain/repos/certificate_repo.dart';
import '../data_sources/certificates_data_source/certificates_local_data_source.dart';
import '../models/certificate_model.dart';

class CertificateRepoImpl implements CertificateRepo {
  final CertificatesLocalDataSource certificatesLocalDataSource;

  CertificateRepoImpl({required this.certificatesLocalDataSource});

  @override
  Future<List<CertificateModel>?> getCertificates() =>
      certificatesLocalDataSource.getCertificates();
}
