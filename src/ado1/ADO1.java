package ado1;

public class ADO1 {

    public static void main(String[] args) {
        
        Projeto p = new Projeto("ProjetoTeste");
        
        p.getComponentes().add(ComponenteBuilder.criarChip("Chip1", 2.5));
        p.getComponentes().add(ComponenteBuilder.criarCapacitor("Capacitor1", 2.5));
        p.getComponentes().add(ComponenteBuilder.criarIndutor("Indutor1", 2.5));
        p.getComponentes().add(ComponenteBuilder.criarResistor("Resistor1", 2.5));
        
        Placa placa = new Placa("Placa1");
        
        placa.getComponentes().add(ComponenteBuilder.criarChip("Chip2", 2.5));
        placa.getComponentes().add(ComponenteBuilder.criarCapacitor("Capacitor2", 2.5));
        placa.getComponentes().add(ComponenteBuilder.criarIndutor("Indutor2", 2.5));
        placa.getComponentes().add(ComponenteBuilder.criarResistor("Resistor2", 2.5));
        
        p.getComponentes().add(placa);
        
        p.mostrarComponentes();
        
    }
    
}
