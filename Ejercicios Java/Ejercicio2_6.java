/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.poo1;

import java.util.Arrays;
import java.util.Scanner;

/**
 *
 * @author Imp_06 - Mañana
 */
public class Ejercicio2_6 {
    
    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);
        System.out.print("Inserta Numero password: ");
        int num = s.nextInt();
        
        System.out.print("Inserta Longitud passwords: ");
        int longitud = s.nextInt();
        
        Password passwords[] = new Password[num];
        
        for (int i=0;i<num;i++){
            passwords[i]= new Password(longitud);
        }
        
        Password passw2[] = new Password[num];
        
        for (int i=0;i<num;i++){
            passw2[i]= new Password(passwords[i].getContrasena());
        }
        
        Arrays.sort(passw2);
        
        System.out.println("Contraseñas ordenadas: ");
        
        for (int i=0;i<num;i++){
            System.out.println(passw2[i].getContrasena());
        }
        System.out.println();
        boolean esfuerte[] = new boolean[longitud];
        
        for (int j=0;j<num;j++){
            esfuerte[j]=passwords[j].esFuerte();
        }
        
        for (int i=0;i<num;i++){
            System.out.print(passwords[i].getContrasena()+" - "+esfuerte[i]+"\n");
        }
        
    }
    
}
