package ado1;

public class Capacitor extends Componente {
    private double preco;

    public Capacitor(String nome) {
        super(nome);
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }
    
    @Override
    public void getInfo() {
        System.out.println("");
    }
    
    
}
