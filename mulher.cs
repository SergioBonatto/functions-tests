using System;

public class Velho {
    private double dinheiro;
    public Velho(double dinheiro) {
        this.dinheiro = dinheiro;
    }
    public void Apresentar() {
        Console.WriteLine("Dinheiro: " + dinheiro);
    }
}

public class Mulher : Velho {
    private int beleza;

    public Mulher(double dinheiro, int beleza) : base(dinheiro) {
        if (beleza < 0 || beleza > 10) {
            throw new ArgumentOutOfRangeException("beleza", "A beleza deve estar entre 0 e 10.");
        }
        this.beleza = beleza;
    }

    public new void Apresentar() {
        base.Apresentar();
        Console.WriteLine("Beleza: " + beleza);
    }
}

public class Program {
    public static void Main(string[] args) {
        Velho velho = new Velho(1000000.0);
        velho.Apresentar();
        Mulher mulher = new Mulher(150000.0, 8);
        mulher.Apresentar();
    }
}

