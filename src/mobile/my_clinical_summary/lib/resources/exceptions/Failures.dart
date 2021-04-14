abstract class Failures {
  final String message;

  Failures(this.message);
}

class BadRequestFailure extends Failures {
  BadRequestFailure(String message) : super(message);
}

class NotFoundFailure extends Failures {
  static const String MESSAGE =
      "Conteúdo não foi encontrado ou não existe mais.";
  static NotFoundFailure instance = NotFoundFailure._();

  NotFoundFailure._() : super(MESSAGE);
}

class ServerFailure extends Failures {
  static const String MESSAGE =
      "Houve uma falha no servidor. Contate o administrador.";
  static ServerFailure instance = ServerFailure._();

  ServerFailure._() : super(MESSAGE);
}

class InternetConnectionFailure extends Failures {
  static const MESSAGE = "Nenhuma conexão com a internet foi encontrada.";
  InternetConnectionFailure() : super(MESSAGE);
}