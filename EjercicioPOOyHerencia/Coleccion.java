/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.poo1;

import java.util.ArrayList;

/**
 *
 * @author Imp_06 - Mañana
 */
public class Coleccion {
    
    private String nombreColeccion;
    private ArrayList listaFiguras = new ArrayList();
    
    public Coleccion(String nombreColeccion){
        this.nombreColeccion=nombreColeccion;
        this.listaFiguras = null;
    }

    public String getNombreColeccion() {
        return nombreColeccion;
    }

    public void setNombreColeccion(String nombreColeccion) {
        this.nombreColeccion = nombreColeccion;
    }
    
    public void agregarFigura(Figura fig){
        this.listaFiguras.add(fig);
    }
    
    public void subirPrecio(double cantidad, String id){
        Figura fig;
        for (int i = 0; i<this.listaFiguras.size();i++){
            if (listaFiguras.get(i).getCodigo().equals(id)){
                fig = listaFiguras.get(i);
            }
        }
        if (fig!=null){
            fig.subirPrecio(cantidad);
        }
    }

    @Override
    public String toString() {
        String salida = "";
        for (int i=0;i<this.listaFiguras.size();i++){
            salida += this.listaFiguras.get(i).toString()+"\n";
        }
        return "Coleccion{" + "nombreColeccion=" + this.nombreColeccion + "\n"+salida+ '}';
    }
    
    public String conCapa()
    {
        String conCapa="";
        for (int i=0;i<this.listaFiguras.size();i++){
            if (this.listaFiguras.get(i).getSuperheore().getCapa()){
                conCapa += this.listaFiguras.get(i)+"\n";
            }
        }
        return conCapa;
    }
    
    public Figura masValioso(){
        Figura masValioso;
        double precio = 0;
        for (int i = 0; i<this.listaFiguras.size();i++){
            if (this.listaFiguras.get(i).getPrecio()>precio){
                precio = this.listaFiguras.get(i).getPrecio();
                masValioso = this.listaFiguras.get(i);
            }
        }
        return masValioso;
        
    }
    
    public double getValorColeccion(){
        double valor = 0;
        
        for (int i=0;i<this.listaFiguras.size();i++){
            valor += this.listaFiguras.get(i).getPrecio();
        }
        
        return valor;
    }
    
    public double getVolumenColeccion(){
        double volumen = 200;
        
        for (int i=0;i<this.listaFiguras.size();i++){
            volumen += this.listaFiguras.get(i).getDimension().getVolumen();
        }
        
        return volumen;
        
        
    }
}
