/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ejercicios;

import java.util.Scanner;

/**
 *
 * @author Imp_06 - Mañana
 */
public class Ejercicio4 {
    
    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);
        String usuario="pepito";
        String password="789320adg@?";
        int contador = 0;
        
        do{
            System.out.print("Inserte el password: ");
            String p1=s.nextLine();
            if(password.equals(p1)){
                System.out.print("Password Valido");
                break;
            }
            else{
                System.out.println("Password invalido. Pruebe de nuevo");
                contador++;
            }
               
        }while(contador<3);
        
        
    }
    
}
