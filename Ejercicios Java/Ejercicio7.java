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
public class Ejercicio7 {
    
    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);
        System.out.print("Inserta Hora: ");
        int H = s.nextInt();
        System.out.print("Inserta Minutos: ");
        int M = s.nextInt();
        System.out.print("Inserta Segundos: ");
        int S = s.nextInt();
        
        if((H>=0 && H<24) && (M>=0 && M<60) && (S>=0 && S<60)){
            System.out.println("Formato corecto");
        }else{
                System.out.println("Formato incorrecto");
        }
       
    }
    
}
