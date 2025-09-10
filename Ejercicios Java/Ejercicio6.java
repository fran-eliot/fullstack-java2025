/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ejercicios;

import java.util.Arrays;


/**
 *
 * @author Imp_06 - Mañana
 */
public class Ejercicio6 {
    
    public static void main(String[] args) {
        String[] palabras =  {"hola","caracola","magarita","gato","perro","manzana","pera"};
        
        System.out.println("Array original: " + Arrays.toString(palabras));
        
        for (int i = 0; i < palabras.length - 1; i++) {
            for (int j = 0; j < palabras.length - i - 1; j++) {
                if (palabras[j].compareTo(palabras[j + 1]) > 0) {
                    String aux = palabras[j];
                    palabras[j] = palabras[j + 1];
                    palabras[j + 1] = aux;
                }
            }
        }
        
        System.out.println("Array ordenado: " + Arrays.toString(palabras));
    }
    
}
