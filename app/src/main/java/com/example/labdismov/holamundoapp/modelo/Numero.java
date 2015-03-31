package com.example.labdismov.holamundoapp.modelo;

import io.realm.RealmObject;

/**
 * Created by Kenkox on 30/03/2015.
 */
public class Numero extends RealmObject {
    private int numeroID;
    private String nombreNumero;
    private String imagenURL;

    public String getNombreNumero() {
        return nombreNumero;
    }

    public void setNombreNumero(String nombreNumero) {
        this.nombreNumero = nombreNumero;
    }

    public String getImagenURL() {
        return imagenURL;
    }

    public void setImagenURL(String imagenURL) {
        this.imagenURL = imagenURL;
    }

    public int getNumeroID() {
        return numeroID;
    }

    public void setNumeroID(int numeroID) {
        this.numeroID = numeroID;
    }
}
