/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.ejercicios;

import java.util.Scanner;

/**
 *
 * @author Imp_06 - Mañana
 */
public class Ejercicio1 {

    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);
        int numeros[] = new int[3];
       

        System.out.print("Inserta un numero: ");
        numeros[0] = s.nextInt();
        int menor = numeros[0];

        // Read the next two numbers and compare
        for (int i = 1; i < 3; i++) {
            System.out.print("Inserta un numero: ");
            numeros[i] = s.nextInt();
            if (numeros[i] < menor) {
                menor = numeros[i];
            }
        }

        System.out.println("El menor numero es: " + menor);
              
    }
}
