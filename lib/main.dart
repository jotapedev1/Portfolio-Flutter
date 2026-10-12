import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // permite abrir links externos

// Ponto de partida do app: roda o widget principal
void main() => runApp(const MyApp());

// Widget raiz: configura o app (título e tema) e define a tela inicial
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfólio',
      debugShowCheckedModeBanner: false, // esconde a faixa "debug"
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const PortfolioPage(),
    );
  }
}

// Tela única do portfólio
class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  // Abre um link no navegador, no app de e-mail etc.
  Future<void> _abrir(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  // Widgets auxiliares (evitam repetir código)

  // Título de cada seção
  Widget _titulo(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Caixa branca arredondada que envolve cada seção
  Widget _secao({required Widget child, Color cor = Colors.white}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: child,
    );
  }

  // Ícone à esquerda e, ao lado, um título em negrito com o texto embaixo
  Widget _linhaIcone(IconData icone, String titulo, String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: Colors.indigo),
          const SizedBox(width: 12),
          // Expanded faz o texto quebrar de linha em vez de estourar a tela
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(texto),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Uma tecnologia usada: nome em negrito + motivo da escolha
  Widget _tecnologia(String nome, String motivo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.code, size: 20, color: Colors.indigo),
          const SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '$nome  →  ',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: motivo),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // Card de característica: ícone, título e descrição
  Widget _feature(IconData icone, String titulo, String descricao) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icone, size: 36, color: Colors.indigo),
              const SizedBox(height: 8),
              Text(titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(descricao, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  // A tela em si

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // CABEÇALHO: logo + nome à esquerda, menu à direita
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 21, 117),
        foregroundColor: Colors.white,
        title: const Text('Portfólio - João Pedro'),
        actions: [
          TextButton(
            onPressed: () => _abrir('https://github.com/jotapedev1/'),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Projetos'),
          ),
          TextButton(
            onPressed: () => _abrir('https://www.linkedin.com/in/jpsantosdev/'),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Sobre'),
          ),
          TextButton(
            onPressed: () => _abrir('mailto:jotape5195@gmail.com'),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Contato'),
          ),
        ],
      ),

      // CORPO: a página rola para baixo (SingleChildScrollView)
      body: SingleChildScrollView(
        child: Center(
          // Limita a largura para não esticar demais em telas grandes
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CARD DE DESTAQUE: tags, título, resumo e botão do GitHub
                  _secao(
                    cor: Colors.indigo.shade50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Wrap joga as tags para a linha de baixo se não couberem
                        const Wrap(
                          spacing: 8,
                          children: [
                            Chip(label: Text('Mobile')),
                            Chip(label: Text('React Native')),
                            Chip(label: Text('Java + Spring')),
                            Chip(label: Text('PostgreSQL')),
                            Chip(label: Text('Em desenvolvimento')),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Jornal Primeiramente: aplicativo mobile de jornal escolar',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Aplicativo mobile full-stack desenvolvido em dupla, com publicação '
                          'de mídias e edições, perfis de acesso, curtidas, favoritos e '
                          'comentários. Front-end em React Native e back-end em Java com Spring.',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        TextButton.icon(
                          onPressed: () => _abrir(
                              'https://github.com/jotapedev1/JornalPrimeiramente'),
                          icon: const Icon(Icons.north_east),
                          label: const Text('Ver Código no GitHub'),
                        ),
                      ],
                    ),
                  ),

                  // ÁREA VISUAL: imagem do projeto (contain = aparece inteira)
                  Container(
                    width: double.infinity,
                    height: 260,
                    margin: const EdgeInsets.only(bottom: 20),
                    clipBehavior: Clip.antiAlias, // arredonda também a imagem
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset('assets/jornal.png', fit: BoxFit.contain),
                  ),

                  // PROBLEMA E SOLUÇÃO
                  _secao(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titulo('💡 O Problema e a Solução'),
                        _linhaIcone(
                          Icons.warning_amber,
                          'O Desafio:',
                          'Criar, em dupla, um aplicativo completo para um jornal escolar, com publicação de conteúdo, diferentes tipos de usuário e interação entre os leitores.',
                        ),
                        _linhaIcone(
                          Icons.check_circle_outline,
                          'A Solução:',
                          'Uma API REST em Java com Spring Boot, protegida com Spring Security e JWT, '
                          'conectada a um banco PostgreSQL, e um aplicativo em React Native que consome essa API.',
                        ),
                      ],
                    ),
                  ),

                  // TECNOLOGIAS E O MOTIVO DE CADA ESCOLHA
                  _secao(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titulo('🛠️ Arquitetura e Tecnologias Utilizadas'),
                        _tecnologia('React Native',
                            'um único código para o aplicativo mobile.'),
                        _tecnologia('Java + Spring Boot',
                            'API REST com Spring Security (JWT), Spring Data JPA e envio de e-mails.'),
                        _tecnologia('PostgreSQL',
                            'banco relacional para usuários, mídias, edições e interações.'),
                      ],
                    ),
                  ),

                  // CARACTERÍSTICAS: três cards lado a lado
                  // (este título é branco porque o fundo da página é preto)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      '⚡ Características Principais',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _feature(Icons.people, 'Perfis de acesso',
                          'Administrador, participante e usuário comum, cada um com suas permissões.'),
                      _feature(Icons.favorite, 'Interação',
                          'Curtidas, favoritos e comentários nas mídias publicadas.'),
                      _feature(Icons.lock, 'Autenticação',
                          'Proteção da API com JWT e recuperação de senha por e-mail.'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // RESULTADOS E O QUE FOI APRENDIDO
                  _secao(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titulo('📈 Resultados e Lições Aprendidas'),
                        _linhaIcone(
                          Icons.speed,
                          'Resultado:',
                          'Um aplicativo em evolução, já com back-end, banco de dados e app mobile integrados.',
                        ),
                        _linhaIcone(
                          Icons.school,
                          'Aprendizado:',
                          'Aprendi a trabalhar em dupla com Git, a proteger a API (o usuário vem do token JWT, '
                          'nunca de um parâmetro enviado pelo cliente) e a integrar front-end, back-end e banco de dados.',
                        ),
                      ],
                    ),
                  ),

                  // CHAMADA FINAL: botões de contato
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '🤝 Vamos trabalhar juntos?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Gostou do projeto? Estou disponível para novos desafios e contratos.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        // Wrap: os dois botões ficam lado a lado ou um embaixo do outro
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 12,
                          runSpacing: 8,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () =>
                                  _abrir('mailto:jotape5195@gmail.com'),
                              icon: const Icon(Icons.email),
                              label: const Text('Enviar Mensagem por E-mail'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => _abrir(
                                  'https://www.linkedin.com/in/jpsantosdev/'),
                              icon: const Icon(Icons.link),
                              label: const Text('Conectar no LinkedIn'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}