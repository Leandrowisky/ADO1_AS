package ado1;

import java.util.ArrayList;

public class Placa extends Componente{
    private final ArrayList<IComponente> componentes = new ArrayList<>();

    public Placa(String nome) {
        super(nome);
    }
    
    public ArrayList<IComponente> getComponentes() {
        return componentes;
    }
    
    @Override
    public void getInfo() {
        System.out.println("");
    }
    
    
}
