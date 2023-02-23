void main() {}

//! classes
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
class Fruta extends Alimento {
  int diasDesdeColhieta;
  String? estaMadura;

  Fruta({
    required String nome,
    required String cor,
    required double peso,
    required this.diasDesdeColhieta,
    this.estaMadura,
  }) : super(
          nome: nome,
          cor: cor,
          peso: peso,
        ); //super quer dizer que pegamos o atributo da classe alimento

  void maduro(int diasparamadurar) {
    estaMadura = (diasDesdeColhieta <= diasparamadurar) ? "sim" : "não";
  }
}

class FrutaCitrica extends Fruta implements Suco {
  int nivelcitrico;

  FrutaCitrica(
      {required String nome,
      required String cor,
      required double peso,
      required int diasDesdeColheita,
      required this.nivelcitrico,
      String? estaMadura})
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

  @override
  colher() {
    if (estaMadura == "sim") {
      print("podemos colher esta $nome");
      return;
    }
    print("pegue outra $nome, essa não está boa para fazer suco");
  }

  @override
  preparar() {
    print("descascar $nome, bater no liquidificador com agua e colocar açucar");
  }

  @override
  servir() {
    print("colocar no copo e servir o suco de $nome");
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
      String? estaMadura})
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
}

class Legumes extends Alimento {
  bool isPrecisaCozinhar;

  Legumes({
    required String nome,
    required String cor,
    required double peso,
    required this.isPrecisaCozinhar,
  }) : super(nome: nome, cor: cor, peso: peso);
}

//a classe abstrata podemos inserir ela em todas as classe sendo que em cada classe ela vai fazer uma coisa diferente.
abstract class Suco {
  colher();
  preparar();
  servir();
}
