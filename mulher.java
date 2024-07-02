public class Velho {
    private double dinheiro;

    public Velho(double dinheiro) {
        this.dinheiro = dinheiro;
    }

    public void apresentar() {
        System.out.println("Dinheiro: " + dinheiro);
    }
}

public class Mulher extends Velho {
    private String profissao;

    public Mulher(double dinheiro, String profissao) {
        super(dinheiro); 
        this.profissao = profissao;
    }

    public void apresentar() {
        super.apresentar();
        System.out.println("Profissão: " + profissao);
    }
}

public class Main {
    public static void main(String[] args) {
        Velho velho = new Velho(10000.0);
        velho.apresentar();

        Mulher mulher = new Mulher(15000.0, "Professora");
        mulher.apresentar();
    }
}

