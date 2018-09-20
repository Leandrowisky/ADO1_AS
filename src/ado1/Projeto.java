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

    public ArrayList<IComponente> getComponentes() {
        return componentes;
    }
    
    @Override
    public void mostrarComponentes() {
        System.out.println("Projeto " + this.nome);
        
        System.out.println("=============Componentes==============");
        
        for (IComponente componente : componentes) {
            componente.getInfo();
        }
        
        System.out.println("================================");
    }
    
}
