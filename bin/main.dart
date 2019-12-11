import 'package:smtpexmeplo/email.dart';

main(List<String> arguments) {
  String _text = '';

  var email = Email('ademirbezerra2012@gmail.com', '84e048fc5b3981');

  email
      .sendMessage(
          'teste mensagem', 'ademirbezerra@imd.ufrn.br', 'teste assunt')
      .then((data) {
    print('enviado!');
  });
}
