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
public class Ejercicio5 {
    
    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);
        System.out.print("Inserte una letra: ");
        char letra = s.nextLine().charAt(0);
        
        switch(letra){
            case 'a':
                System.out.println("7");
                break;
            case 'b':
                System.out.println("9");
                break;
            case 'c':
                System.out.println("101");
                break;
            default:
                System.out.println("Se ha equivocado de letra");
        }
    }
    
}
