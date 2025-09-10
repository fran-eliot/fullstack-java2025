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
public class Ejercicio9 {
    
    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);
        int numero =0;
        int ceros = 0;
        int negativos=0;
        
        do{
            System.out.print("Introduzca un numero: ");
            numero = s.nextInt();
            if (numero == 0){
                ceros++;
            }
            if(numero<0){
                negativos++;
            }
            
        }while(numero!=-25);
        
        System.out.println("Has introducido "+ceros+" ceros");
        System.out.println("Has introducido "+negativos+" numeros negativos");
    }
    
}
