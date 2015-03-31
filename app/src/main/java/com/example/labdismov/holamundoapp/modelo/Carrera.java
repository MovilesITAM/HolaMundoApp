package com.example.labdismov.holamundoapp.modelo;

import io.realm.RealmObject;

/**
 * Created by Kenkox on 30/03/2015.
 */
public class Carrera extends RealmObject {
    private int carreraID;
    private String nombreCarrera;

    public int getCarreraID() {
        return carreraID;
    }

    public void setCarreraID(int carreraID) {
        this.carreraID = carreraID;
    }

    public String getNombreCarrera() {
        return nombreCarrera;
    }

    public void setNombreCarrera(String nombreCarrera) {
        this.nombreCarrera = nombreCarrera;
    }
}
