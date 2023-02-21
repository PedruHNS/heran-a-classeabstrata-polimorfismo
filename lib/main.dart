void main() {}

//! classes
class Alimento {
  //atributos
  String nome;
  String cor;
  double peso;

  //construtor
  Alimento(this.nome, this.cor, this.peso);

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
  }) : super(nome, cor,
            peso); //super quer dizer que pegamos o atributo da classe alimento

  void maduro(int diasparamadurar) {
    estaMadura = (diasDesdeColhieta <= diasparamadurar)
        ? "sim esta madura,"
        : "não esta madura,";
  }
}

class FrutaCitrica extends Fruta {
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
}

//a classe abstrata podemos inserir ela em todas as classe sendo que em cada classe ela vai fazer uma coisa diferente.
abstract class Suco {
  colheita();
  preparar();
  servir();
}
