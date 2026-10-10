import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfólio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

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

  // Caixa padrão que envolve cada seção
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

  // Linha: ícone + texto (usada em problema/solução e resultados)
  Widget _linhaIcone(IconData icone, String titulo, String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: Colors.indigo),
          const SizedBox(width: 12),
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

  // Linha de tecnologia
  Widget _tecnologia(String nome, String motivo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.code, size: 20),
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

  // Card de feature
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // ===== CABEÇALHO =====
      appBar: AppBar(
        title: const Text('Meu Portfólio'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Projetos'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Sobre'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Contato'),
          ),
        ],
      ),

      // SingleChildScrollView permite rolar a página
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== CARD DE DESTAQUE =====
                  _secao(
                    cor: Colors.indigo.shade50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Chip(label: Text('Front-end')),
                            SizedBox(width: 8),
                            Chip(label: Text('React')),
                            SizedBox(width: 8),
                            Chip(label: Text('Out 2026')),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Desenvolvimento de um Dashboard E-commerce em Tempo Real',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Uma aplicação web escalável com atualizações ao vivo, '
                          'gráficos interativos e foco total na experiência do usuário (UX).',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.north_east),
                              label: const Text('Ver Código no GitHub'),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.auto_awesome),
                              label: const Text('Acessar Deploy'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // ===== ÁREA VISUAL (MOCKUP) =====
                  Container(
                    width: double.infinity,
                    height: 220,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.dashboard, size: 64, color: Colors.black45),
                          SizedBox(height: 8),
                          Text('Imagem / GIF demonstrativo da aplicação'),
                        ],
                      ),
                    ),
                  ),

                  // ===== PROBLEMA E SOLUÇÃO =====
                  _secao(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titulo('💡 O Problema e a Solução'),
                        _linhaIcone(
                          Icons.warning_amber,
                          'O Desafio:',
                          'Lojistas precisavam monitorar vendas sem atualizar a página manualmente.',
                        ),
                        _linhaIcone(
                          Icons.check_circle_outline,
                          'A Solução:',
                          'Criação de um pipeline de dados com WebSockets e renderização otimizada.',
                        ),
                      ],
                    ),
                  ),

                  // ===== TECNOLOGIAS =====
                  _secao(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titulo('🛠️ Arquitetura e Tecnologias'),
                        _tecnologia('React.js',
                            'componentização e ótimo desempenho de renderização.'),
                        _tecnologia('Node.js',
                            'back-end leve e ideal para tempo real com WebSockets.'),
                        _tecnologia('Tailwind',
                            'estilização rápida e consistente.'),
                      ],
                    ),
                  ),

                  // ===== FEATURES =====
                  _titulo('⚡ Características Principais'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _feature(Icons.devices, 'UI/UX Responsivo',
                          'Se adapta a qualquer tamanho de tela.'),
                      _feature(Icons.bar_chart, 'Gráficos Dinâmicos',
                          'Atualização a cada 500ms usando ApexCharts.'),
                      _feature(Icons.lock, 'Autenticação',
                          'Proteção de rotas com JWT.'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ===== RESULTADOS =====
                  _secao(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titulo('📈 Resultados e Lições Aprendidas'),
                        _linhaIcone(
                          Icons.speed,
                          'Desempenho:',
                          'Redução de 40% no tempo de carregamento inicial (LCP).',
                        ),
                        _linhaIcone(
                          Icons.school,
                          'Aprendizado:',
                          'Implementação profunda de gerenciamento de estado global.',
                        ),
                      ],
                    ),
                  ),

                  // ===== CALL TO ACTION =====
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.email),
                              label: const Text('Enviar E-mail'),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.link),
                              label: const Text('LinkedIn'),
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