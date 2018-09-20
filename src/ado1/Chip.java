package ado1;

public class Chip extends Componente{
    private double preco;

    public Chip(String nome, double preco) {
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
        System.out.println("Chip: Nome: " + this.getNome() + " Preço: " + this.preco);
    }
    
}
