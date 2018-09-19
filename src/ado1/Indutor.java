package ado1;

public class Indutor extends Componente{
    private double preco;

    public Indutor(double preco, String nome) {
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
        System.out.println("");
    }
    
}
