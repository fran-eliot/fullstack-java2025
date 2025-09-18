/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.poo1;

/**
 *
 * @author Imp_06 - Mañana
 */
public class Dimension {
    
    private double alto, ancho, profundidad;
    
    public Dimension(){
        this.alto = 0;
        this.ancho = 0;
        this.profundidad = 0;
    }
    
    public Dimension (double alto, double ancho, double profundidad){
        this.alto = alto;
        this.ancho = ancho;
        this.profundidad = profundidad;
    }

    public double getAlto() {
        return alto;
    }

    public double getAncho() {
        return ancho;
    }

    public double getProfundidad() {
        return profundidad;
    }

    public void setAlto(double alto) {
        this.alto = alto;
    }

    public void setAncho(double ancho) {
        this.ancho = ancho;
    }

    public void setProfundidad(double profundidad) {
        this.profundidad = profundidad;
    }
    
    public double getVolumen(){
        return this.alto*this.ancho*this.profundidad;
    }

    @Override
    public String toString() {
        return "Dimension{" + "alto=" + alto + ", ancho=" + ancho + ", profundidad=" + profundidad + '}';
    }
    
    
    
}
