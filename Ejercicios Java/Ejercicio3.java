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
public class Ejercicio3 {
    
    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);
        float f1,f2, resultado=0;
        System.out.print("Inserte un numero real: ");
        f1 = s.nextFloat();
        s.nextLine();
        System.out.print("Inserte otro numero real: ");
        f2 = s.nextFloat();
        s.nextLine();
        System.out.print("Inserte operacion (suma/resta): ");
        String op;
        op = s.nextLine();
        
        switch(op){
            case "suma":
                resultado=f1+f2;
                break;
            case "resta":
                resultado=f1-f2;
                break;
        }
        
        System.out.println("El resultado es "+resultado);
                
        
    }
    
}
