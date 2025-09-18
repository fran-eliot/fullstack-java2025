/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.poo1;

/**
 *
 * @author Imp_06 - Mañana
 */
public class SuperHeroe {
    
    private String nombre;
    private String descripcion;
    private boolean capa;
    
    public SuperHeroe(String nombre){
        this.nombre = nombre;
        this.descripcion = "";
        this.capa = false;
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
   public String getDescripcion(){
       return this.descripcion;
   }
   
   public boolean getCapa(){
       return this.capa;
   }
    
   public void setNombre(String nombre){
       this.nombre=nombre;
   }
    
   public void setDescripcion(String descripcion){
       this.descripcion = descripcion;
   }
   
   public void setCapa(boolean capa){
       this.capa = capa;
   }
   
   @Override
   public String toString(){
       return "Nombre: "+this.nombre+" - Descripcion: "+this.descripcion+" - Capa: "+this.capa;
   }
    
}
