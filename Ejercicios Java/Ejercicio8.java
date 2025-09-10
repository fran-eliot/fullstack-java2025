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
public class Ejercicio8 {
    public static void main(String[] args) {
        
       String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
       int[] diasMes = {31,28,31,30,31,30,31,31,30,31,30,31};
       
       Scanner s = new Scanner(System.in);
       System.out.print("Inserta Numero de mes: ");
       int mes = s.nextInt();
       
       System.out.println("El mes es "+meses[mes-1]+" y tiene "+diasMes[mes-1]+" dias");
       
    }
}
