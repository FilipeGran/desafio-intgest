class ValidatorForms {
  String? emailValidator(String? email) {
    const pattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
    final regex = RegExp(pattern);

    if (email == null || email.isEmpty) return 'Insira um E-mail';

    if (!regex.hasMatch(email)) return 'Informe um E-mail Válido!';
    return null;
  }

  String? nameValidator(String? name) {
    if (name == null || name.isEmpty) return 'Insira seu Nome Completo';

    final names = name.split(' ');
    if (names.length == 1) return 'Insira seu Nome Completo';
    return null;
  }

  String? phoneValidator(String? phone) {
    if (phone == null || phone.isEmpty) return 'Insira Seu Telefone';

    if (phone.length < 14) return 'Insira Um Telefone Válido!';

    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) return 'Insira sua Senha';

    if (password.length < 5) {
      return 'A senha deve conter no mínimo 5 Caracteres';
    }

    return null;
  }

  String? textValidator(String? text) {
    if (text == null || text.isEmpty) return 'Insira o texto';

    if (text.length < 4) return 'Insira um texto maior';

    return null;
  }
}
