import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Email {
  String _username;
  var smtpServer;

  Email(String username, String password) {
    _username = username;
    smtpServer = gmail(_username, password);
  }

  Future<bool> sendMessage(
      String mensagem, String destinatario, String assunto) async {
    final message = Message()
      ..from = Address(_username, 'Nome')
      ..recipients.add(destinatario)
      ..subject = assunto
      ..text = mensagem;

    try {
      final sendReport = await send(message, smtpServer);
      print('Messagem enviada: ' + sendReport.toString());

      return true;
    } on MailerException catch (e) {
      print('Erro ao enviar menssagem');
      for (var p in e.problems) print("Erro encontrado=>${p.code}: ${p.msg}");
      return false;
    }
  }
}
