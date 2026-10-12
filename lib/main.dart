import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

// Abre um link externo (GitHub, LinkedIn, e-mail)
void abrir(String url) {
  launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfólio',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // ===== CABEÇALHO =====
        appBar: AppBar(
          title: const Text('Portfólio - João Pedro'),
          backgroundColor: const Color.fromARGB(255, 4, 21, 117),
          foregroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () => abrir('https://github.com/jotapedev1/'),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('Projetos'),
            ),
            TextButton(
              onPressed: () => abrir('https://www.linkedin.com/in/jpsantosdev/'),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('Contato'),
            ),
          ],
        ),

        // SingleChildScrollView permite rolar a página
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== DESTAQUE =====
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  color: Colors.indigo.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Mobile • React Native • Java + Spring • PostgreSQL • Atualmente'),
                      const SizedBox(height: 12),
                      const Text(
                        'Jornal Primeiramente',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Aplicativo mobile de jornal escolar, desenvolvido em dupla.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      TextButton.icon(
                        onPressed: () => abrir(
                            'https://github.com/jotapedev1/JornalPrimeiramente'),
                        icon: const Icon(Icons.code),
                        label: const Text('Ver Código no GitHub'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // ===== IMAGEM =====
                Image.asset('assets/jornal.png'),
                const SizedBox(height: 20),

                // ===== PROBLEMA E SOLUÇÃO =====
                const Text(
                  'O Problema e a Solução',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Desafio: criar um aplicativo completo para um jornal escolar, '
                  'com publicação de conteúdo e diferentes tipos de usuário.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Solução: uma API em Java com Spring Boot e PostgreSQL, '
                  'e um aplicativo em React Native que consome essa API.',
                ),
                const SizedBox(height: 20),

                // ===== TECNOLOGIAS =====
                const Text(
                  'Tecnologias',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('• React Native: aplicativo mobile'),
                const Text('• Java + Spring Boot: API REST com JWT'),
                const Text('• PostgreSQL: banco de dados'),
                const SizedBox(height: 20),

                // ===== CARACTERÍSTICAS =====
                const Text(
                  'Características Principais',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 8),
                    Text('Perfis de acesso'),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 8),
                    Text('Curtidas e comentários'),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(width: 8),
                    Text('Login seguro'),
                  ],
                ),
                const SizedBox(height: 20),

                // ===== RESULTADOS =====
                const Text(
                  'Resultados e Lições Aprendidas',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Resultado: um aplicativo funcional, com back-end, banco de dados e app mobile integrados.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Aprendizado: trabalhar em dupla com Git e integrar front-end, back-end e banco de dados.',
                ),
                const SizedBox(height: 20),

                // ===== CONTATO =====
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  color: Colors.indigo,
                  child: Column(
                    children: [
                      const Text(
                        'Vamos trabalhar juntos?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Estou disponível para novos desafios.',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () => abrir('mailto:jotape5195@gmail.com'),
                        icon: const Icon(Icons.email),
                        label: const Text('Enviar E-mail'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () =>
                            abrir('https://www.linkedin.com/in/jpsantosdev/'),
                        icon: const Icon(Icons.link),
                        label: const Text('LinkedIn'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}