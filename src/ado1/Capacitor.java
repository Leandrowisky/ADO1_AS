package ado1;

public class Capacitor extends Componente {
    private double preco;

    public Capacitor(double preco, String nome) {
        super(nome);
        this.preco = preco;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }
    
    @Override
    public void getInfo() {
        System.out.println("Capacitor: Nome: " + this.getNome() + " Preço: " + this.preco);
    }
    
    
}
