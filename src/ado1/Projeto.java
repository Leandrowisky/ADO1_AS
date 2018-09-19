package ado1;

import java.util.ArrayList;

public class Projeto implements ComponenteCommand{
    private String nome;
    private final ArrayList<IComponente> componentes = new ArrayList<>();
    
    public Projeto(String nome) {
        this.nome = nome;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public void mostrarComponentes() {
        System.out.println("");
    }
    
}
