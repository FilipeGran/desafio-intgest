# Desafio-InterGest

Criação de app de TodoList utilizando o framework Flutter (Dart) onde inclui-se as seguintes funcionalidades: Criação de conta/Login, CRUD de Tarefas. Utilizando o Package Dio para realização de todas as requisições em API REST onde foi utilizado a Tecnologia ParseServer com Back4App para criação do back-end de toda a aplicação.

## 🚀 Começando

Instruções para exucução do projeto: 

* [Back4PApp](https://www.back4app.com) - Crie sua conta na Back4App para criação do back-end, visualize [essa playlist](https://www.youtube.com/playlist?list=PLR5GUTqrcwXhq-cUcqTV-oSgJDxjcnDnW) para compreensão de como utilizar a ferramenta. Após isso crie uma Classe na área "Database" utilizando como modelo a classe Task e adicione na classe _User as colunas necessárias com base no model User. Após essas etapas copie as keys da Api e cole nas duas variáveis da classe keys_api. Feito esses procedimentos o back-end estará pronto.

* Por fim, baixe o código e digite o terminal a seguinte linha: 'flutter pub get'.

## 🛠️ Packages Utilizados

* [SDK PARSE SERVER](https://pub.dev/packages/parse_server_sdk_flutter) 
* [DIO](https://pub.dev/packages/dio) 
* [Fluttertoast](https://pub.dev/packages/fluttertoast) 
* [INTL](https://pub.dev/packages/intl) 
* [Mask Text Input Formater](https://pub.dev/packages/mask_text_input_formatter) 
* [Flutter secure storage](https://pub.dev/packages/flutter_secure_storage)

## 🖇️ Telas

### Tela de Login: Captura email e senha do usuário (com validação do formulário) e envia via API REST para a efetuação do login, em caso de sucesso o bakc-end retorna o token para controle de login dos usuários. OBS: O botão "esqueci a senha" ainda não tem funcionalidade atrelada, devido ao curto período de desenvolvimento, ficando essa funcionalidade como futuro update.

![login](https://github.com/FilipeGran/desafio-intgest/assets/46307770/d3f2a630-1bf8-422b-9651-37494847ec21)

### Tela de Nova Conta: Captura dados pessoais do usuário (com validação do formulário) envia via API REST para criação de um novo usuário, em caso de sucesso o back-end retorna o objectId do usuário juntamente com o token para controle de login dos usuários. 

![nova conta](https://github.com/FilipeGran/desafio-intgest/assets/46307770/4a41777c-b928-413f-b048-e02bc19085d2)

### Tela Home: Tela inicial do app, onde através de uma classe base utilizando o package PageView para utilização de duas telas inseridas nessa tela base. Onde a tela default seria a tela home, que tem como função principal listas as tarefas cadastradas por seu usuário logado, onde na parte superior há o botão de logout.

![tela home 1](https://github.com/FilipeGran/desafio-intgest/assets/46307770/e91dc4bd-c450-4ada-a150-e648f606afa3)

### Tela de Perfil: Tela onde há a possibilidade de visualização dos dados do usuário logado.

![dados usuário](https://github.com/FilipeGran/desafio-intgest/assets/46307770/e3d91f21-f950-4138-beb7-b78399340a43)

### Tela de Nova Tarefa: Tela de nova tarefa, captura informações da nova tarefa (com validação do formulário) e envia via API REST para criação de uma nova tarefa, em caso de sucesso o back-end retorna o objectId do da nova tarefa.

![nova tarefa](https://github.com/FilipeGran/desafio-intgest/assets/46307770/6845d06e-299d-4f6b-bc0c-a33365fa9e31)

### Tela Home listando tarefas: Tela Home quando há tarefas vinculadas ao usuário logado.

![tarefas listadas](https://github.com/FilipeGran/desafio-intgest/assets/46307770/886b5ba3-d330-48e7-b570-d9c1ba86c69c)

### Componenete Tarefa: Componente onde se é listado as informações de cada tarefa, onde há os seguintes botões: Marcar tarefa como concluída, excluír tarefa, editar tarefa (só possível quando a tarefa ainda não está finalizada).

![tarefa](https://github.com/FilipeGran/desafio-intgest/assets/46307770/67236a1a-cf80-48f0-9292-823c505f43a6)

### Tela Editar Tarefa: Tela de editar tarefa, captura informações para a edição da tarefa já existente (com validação do formulário), em caso de sucesso o back-end retorna a data de atualização da tarefa.

![WhatsApp Image 2024-03-29 at 22 43 50](https://github.com/FilipeGran/desafio-intgest/assets/46307770/25116263-42aa-4b76-b9c4-48c28dd751c0)

⌨️ por [Filipe Grangeiro](https://github.com/FilipeGran) 
