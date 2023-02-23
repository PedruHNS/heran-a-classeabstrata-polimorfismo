void main() {
  FrutaCitrica limao = FrutaCitrica(
      nome: "limao",
      cor: "verde",
      peso: 30.0,
      diasDesdeColheita: 10,
      nivelcitrico: 7,
      estaMadura: "não sei");

  limao.exibir();

  print(limao.maduro(10));

  limao.colher();
}

//! classes

abstract class Bolo {
  void colher();
  void preparar();
  void servir();
}

class Alimento {
  //atributos
  String nome;
  String cor;
  double peso;

  //construtor
  Alimento({required this.nome, required this.cor, required this.peso});

  //metodo
  void exibir() {
    print("alimento: $nome cor: $cor peso: $peso");
  }
}

// extendemos a classe alimento para fruta ou seja, a fruta herdou tudo da classe alimento
class Fruta extends Alimento implements Bolo {
  int diasDesdeColhieta;
  String estaMadura;

  Fruta({
    required String nome,
    required String cor,
    required double peso,
    required this.diasDesdeColhieta,
    required this.estaMadura,
  }) : super(
          nome: nome,
          cor: cor,
          peso: peso,
        ); //super quer dizer que pegamos o atributo da classe alimento

  String maduro(int diasparamadurar) {
    return estaMadura = (diasDesdeColhieta <= diasparamadurar) ? "sim" : "não";
  }

  // o override sobescreve o metodo criado na classe alimento
  @override
  void exibir() {
    print("$nome, $cor, $peso,$diasDesdeColhieta, $estaMadura");
  }

  @override
  colher() {
    if (estaMadura == "sim") {
      print("podemos colher esta $nome");
      return;
    }
    print("pegue outra $nome, essa não está boa para fazer o bolo");
  }

  @override
  preparar() {
    print("descascar $nome, fazer a massa e colocar para assar");
  }

  @override
  servir() {
    print("colocar no prato e servir o bolo de $nome");
  }
}

class FrutaCitrica extends Fruta /*OCULTO implements Bolo*/ {
  int nivelcitrico;

  FrutaCitrica(
      {required String nome,
      required String cor,
      required double peso,
      required int diasDesdeColheita,
      required this.nivelcitrico,
      required String estaMadura})
      : super(
            nome: nome,
            cor: cor,
            peso: peso,
            diasDesdeColhieta: diasDesdeColheita,
            estaMadura: estaMadura);

  void acido() {
    if (nivelcitrico >= 6) {
      print("nossaaaa ta muito azedo: nivel citrico é $nivelcitrico");
      return;
    }
    print("até que ta suave: nivel citrico é $nivelcitrico");
  }
}

class FrutaDoce extends Fruta {
  int nivelDoce;
  FrutaDoce(
      {required String nome,
      required String cor,
      required double peso,
      required int diasDesdeColheita,
      required this.nivelDoce,
      required String estaMadura})
      : super(
            nome: nome,
            cor: cor,
            peso: peso,
            diasDesdeColhieta: diasDesdeColheita,
            estaMadura: estaMadura);
  void doce() {
    if (nivelDoce >= 6) {
      print(" docinha");
      return;
    }
    print("não ta doce não");
    return;
  }

  @override
  void colher() {
    print("teste");
    super.colher(); // pega a função colher da classe fruta
  }

  @override
  void preparar() {
    print("lavar a $nome");
    super.preparar();
  }

  @override
  void servir() {
    super.servir();
    print("bom apetite");
  }
}

// estamos implementando a classe abstrata Bolo na classe legumes.
class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes({
    required String nome,
    required String cor,
    required double peso,
    required this.isPrecisaCozinhar,
  }) : super(nome: nome, cor: cor, peso: peso);

  void cozinhar() {
    if (isPrecisaCozinhar == true) {
      print("cozinhando $nome");
      return;
    }
    print("não precisa cozinhar o(a) $nome");
    return;
  }

  @override
  void colher() {
    print("colher a $nome, lavar e cozinhar");
  }

  @override
  void preparar() {
    print("preparar a massa, colocar na forma e levar ao forno para assar");
  }

  @override
  void servir() {
    print("colocar no prato e servir o bolo de $nome");
  }
}

//a classe abstrata podemos inserir ela em todas as classe sendo que em cada classe ela vai fazer um processo diferente.

