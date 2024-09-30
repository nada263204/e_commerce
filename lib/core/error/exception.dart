abstract class AppException implements Exception {
  final String message;
  const AppException({this.message = 'Some thing wrong'});
}

class RemoteException extends AppException {
  const RemoteException({super.message = 'Some thing wrong'});
}

class LocalException extends AppException {
  const LocalException({super.message = 'Some thing wrong'});
}
