package com.example.labdismov.holamundoapp.modelo;

import io.realm.RealmList;
import io.realm.RealmObject;
import io.realm.annotations.Ignore;
/**
 * Created by Kenkox on 30/03/2015.
 */


public class Articulo extends RealmObject  {

    private int  articuloID;
    private String nombreArticulo;
    private String resumen;
    private String texto;
    private String imagenURL;
    private Seccion seccion;
    private Numero numero;
    private RealmList<Autor> autores;

    public int getArticuloID() {
        return articuloID;
    }

    public void setArticuloID(int articuloID) {
        this.articuloID = articuloID;
    }

    public String getNombreArticulo() {
        return nombreArticulo;
    }

    public void setNombreArticulo(String nombreArticulo) {
        this.nombreArticulo = nombreArticulo;
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getImagenURL() {
        return imagenURL;
    }

    public void setImagenURL(String imagenURL) {
        this.imagenURL = imagenURL;
    }

    public Seccion getSeccion() {
        return seccion;
    }

    public void setSeccion(Seccion seccion) {
        this.seccion = seccion;
    }

    public Numero getNumero() {
        return numero;
    }

    public void setNumero(Numero numero) {
        this.numero = numero;
    }

    public RealmList<Autor> getAutores() {
        return autores;
    }

    public void setAutores(RealmList<Autor> autores) {
        this.autores = autores;
    }
}
