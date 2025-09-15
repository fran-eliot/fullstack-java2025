/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.poo1;

/**
 *
 * @author Imp_06 - Mañana
 */
public class Poo1 {

    public static void main(String[] args) {
        
        Cuenta c1= new Cuenta("Pepito",300);
        System.out.println(c1);
        c1.ingresar(100);
        System.out.println(c1);
        c1.retirar(500);
        System.out.println(c1);
    }
    
}

class Cuenta {
    private String titular;
    private double cantidad;

    public Cuenta(String titular){
        this.titular = titular;
        this.cantidad = 0;
    }

    public Cuenta(String titular, double cantidad){
        this.titular = titular;
        this.cantidad = cantidad;

    }

    public void ingresar(double cantidad){
        if (cantidad>0){
             this.cantidad+=cantidad;
        }

    }

    public void retirar(double cantidad){
        if ((this.cantidad-cantidad)<0)
            this.cantidad = 0;
        else
            this.cantidad -= cantidad;
    }

    public String getTitular(){
        return this.titular;
    }

    public double getCantidad(){
        return this.cantidad;
    }

    public void setTitular(String titular){
        this.titular=titular;
    }

    public void setCantidad(double cantidad){
        this.cantidad=cantidad;
    }

    @Override
    public String toString(){
        return "Cuenta: "+this.titular+":"+this.cantidad;
    }
}

