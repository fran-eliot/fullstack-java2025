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
public class Ejercicio2 {
    
    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);
        System.out.print("Inserte una frase: ");
        String frase = s.nextLine();
        System.out.print("Inserte una letra: ");
        String a = s.nextLine();
        int contador = 0;
        char letra = a.charAt(0); 

        for(int i = 0; i < frase.length(); i++) {
            if (frase.charAt(i) == letra) {
                contador++;
            }
        }
        System.out.println("Numero de repeticiones de " + a + ": " + contador);
    }
    
    
}
