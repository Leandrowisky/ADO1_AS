package ado1;

public class Chip extends Componente{
    private double preco;

    public Chip(String nome, double preco) {
        super(nome);
        this.preco = preco;
    }
    
    @Override
    public void getInfo() {
        System.out.println("");
    }
    
}
