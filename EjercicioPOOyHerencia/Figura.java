/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.poo1;

/**
 *
 * @author Imp_06 - Mañana
 */
public class Figura {
    
    private String codigo;
    private double precio;
    private SuperHeroe superheore;
    private Dimension dimensiones;
    
    public Figura(String codigo, double precio, Dimension dimension, SuperHeroe superheroe){
        this.codigo = codigo;
        this.precio = precio;
        this.dimensiones = dimension;
        this.superheore = superheroe;
    }

    public String getCodigo() {
        return codigo;
    }

    public double getPrecio() {
        return precio;
    }

    public SuperHeroe getSuperheore() {
        return superheore;
    }

    public Dimension getDimensiones() {
        return dimensiones;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public void setSuperheore(SuperHeroe superheore) {
        this.superheore = superheore;
    }

    public void setDimensiones(Dimension dimensiones) {
        this.dimensiones = dimensiones;
    }

    @Override
    public String toString() {
        return "Figura{" + "codigo=" + codigo + ", precio=" + precio + ", superheore=" + superheore + ", dimensiones=" + dimensiones + '}';
    }
    
    public void subirPrecio(double precio){
        this.precio+=precio;
    }   
    
}
