package ado1;

public class ComponenteBuilder {

    enum tipoComponente {
        Chip,
        Capacitor,
        Indutor,
        Resistor
    }

    public static Chip criarChip(String nome, double preco) {
        return new Chip(nome, preco);
    }

    public static Capacitor criarCapacitor(String nome, double preco) {
        return new Capacitor(preco, nome);
    }

    public static Indutor criarIndutor(String nome, double preco) {
        return new Indutor(preco, nome);
    }

    public static Resistor criarResistor(String nome, double preco) {
        return new Resistor(preco, nome);
    }

    public static IComponente criarComponente(String nome, double preco, tipoComponente t) {

        switch (t) {
            case Chip:
                return criarChip(nome, preco);
            case Capacitor:
                return criarCapacitor(nome, preco);
            case Indutor:
                return criarIndutor(nome, preco);
            case Resistor:
                return criarResistor(nome, preco);
            default:
                return null;
        }
    }
}
