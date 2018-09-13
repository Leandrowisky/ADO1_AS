package ado1;

import java.util.Date;

public class UserPreferences {
    enum perfil{
        OPERADOR,
        ADMINISTRADOR
    }
    
    public UserPreferences() {
        
    }
    
    public static String usuario;
    public static String senha;
    public static Date dtEntrada;
    public static perfil perfil;
    
    public static void ShowSession(){
        System.out.println("Usuário: " + usuario);
        System.out.println("Senha: " + usuario);
        System.out.println("Ultima Entrada: " + usuario);
        System.out.println("Perfil: " + usuario);
    }
}
