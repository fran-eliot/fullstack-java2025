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
public class Ejercicio10 {
    
    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);
         
        System.out.print("Introduzca un numero: ");
        int numero = s.nextInt();
        
        while(numero>0){
            int aux = numero%10;
            System.out.print(aux);
            numero = numero/10;
        }
    }
    
}
