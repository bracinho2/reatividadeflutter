# Reatividade no Flutter
Projeto para estudos com Modular + Triple.

    [Flutter Modular:] (https://pub.dev/packages/flutter_modular)
    [Flutter Triple:] (https://pub.dev/packages/flutter_triple)

 - Dica rápida 01: inicie seu repositório com o seguinte comando: 'flutter create --org com.yourdomain appname'. Isto fará com que você não precise alterar futuramente item a item em todo seu projeto para adequar o dominio. Caso necessite fazer este 'retrabalho' utilize a função CMD + Shift + F (MAC) ou Control + Shift + F (Windows);

 - Dica rápida 02: Inicie o repositório via terminal no VS Code. Como ele já tem consigo um cliente Git seu trabalho será facilitado. Extensões como o Git Lens e Git Graph poderão lhe ajudar a controlar melhor suas publicações. Lembre-se: daqui em diante você não viverá mais sem o tal GIT!

## Let's Go!

Em estudos prévios aprendemos sobre [Arquitetura Limpa](https://github.com/Flutterando/Clean-Dart) com a proposta da Comunidade Brasileira Flutterando. Com 6 meses de estudos e com a participação na Masterclass da Flutterando estes elementos ficaram bastante claros. Atenção para dois detalhes muito importantes:

- Estude SOLID. Recomendo as aulas do [Deivid Willyan](https://www.youtube.com/watch?v=GtGjo7lX7CI&list=PLRpTFz5_57ctOsMqglte1W_xa-rek-8G9) para entender bem o que é, para que serve e o que resolve esta 'filosofia'. Sim, se trata de 5 conceitos muito importantes que se traduzem na solução de N problemas na programação. Tenha isto na ponta da língua!

- Programação Orientada a Objetos é ESSENCIAL. Que tal pegar este curso do [Deivid Willyan](https://www.youtube.com/watch?v=elUTXYMfGXo&list=PLRpTFz5_57cseSiszvssXO7HKVzOsrI77&index=14) para conhecer mais? 


## Diário de Bordo

28/05/2022/Manhã 
> Estudo e anotações sobre 'eNum';
  - Um importante mecanismo para melhor controlar as ações dos usuários. Finalmente consegui abstrair o uso correto do eNum dado que é necessário passar o tipo enum em um método para poder utilizá-lo. Aproveitei o embalo para aprender uma sugestão do Deivid sobre o 'extensions' para trabalhar com enum + map.
  
```
enum TipoPagamento { PIX, BOLETO, CARTAO }

extension ExtensionTipoPagamento on TipoPagamento {
  String toValue() {
    Map map = {
      TipoPagamento.PIX: 'Pix',
      TipoPagamento.BOLETO: 'Boleto',
      TipoPagamento.CARTAO: 'Cartao',
    };

    return map[this];
  }
}

```

Na primeira parte do código elencamos nossas opções por meio do enum. Posteriormente configuramos uma extension para afinar ainda mais a usabilidade do mesmo. Após a versão do Dart 2.17 é possível termos um construtor para os itens do enum, facilitando ainda mais o uso;

> Estudo sobre a instalação do Flutter Modular
    - Aproveitando a deixa, realizei a instalação do Flutter Modular para este projeto. A ideia é melhorar o conhecimento sobre rotas e injeções com a ferramenta desenvolvida pela comunidade. Para quem realizou um estudo denso sobre as injeções sabe que o modular tem a proposta de resolver especialmente um problema simples: ao separar um projeto em vários módulos, em geral, nossa lista de injeções fica bastante carregada com N previsões para o código funcionar. Agora, com o Flutter Modular, teremos uma divisão melhor que é orquestrada pelo modular: 
    
    1. No "Core" colocamos todas as injeções que são comuns a todos os módulos;
    2. No "AppModule" faremos a chamada das injeções presentes no "Core" (injeções comuns ao projeto!);
    3. Em cada módulo teremos a previsão das injeções individualizadas, ou seja, uma lista separada que é independente dos outros módulos;

    - Esta separação de injeções pode ser feita manualmente? Sim! Porém, o Flutter Modular pode lhe ajudar a resolver este problema facilmente. Como nem tudo são flores, recomendo fortemente que você estude muito de injeções e o Princípio de Inversão de Dependência do SOLID (DIP). A lista acima poderá lhe ajudar um monte sobre este assunto;

Deixo um [Artigo do Jacob Moura](https://blog.flutterando.com.br/quais-os-problemas-que-o-flutter-modular-veio-resolver-deaed96b71b3) para leitura. É essencial que você leia com calma para entender como o Flutter Modular pretende organizar e resolver os problemas de roteamento e injeção.

25/05/2022/Manhã > Abertura Criação do projeto e abertura do Repositório no GitHub;
    - Utilizei as dicas rápidas acima como validação. Até então eu sempre utilizava um Gerenciador de Git como o SourceTree que era visual, porém, separado do VS Code; Agora já consegui descobrir como iniciar o projeto diretamente no Cliente do VS e tudo fica bem mais fácil;

## 73
Nós, radioamadores, utilizamos muito esta famosa saudação. 73 significa 'Um abraço' ou 'Até breve' que era transmitido via código morse. Deixo um abraço e vamos conversando.
Quem quiser trocar figurinha me procura!
