import '../../../data/models/certificate_model.dart';
import '../../repos/certificate_repo.dart';

class GetCertificates {
  final CertificateRepo certificateRepo;

  GetCertificates(this.certificateRepo);

  Future<List<CertificateModel>?> get() => certificateRepo.getCertificates();
}
