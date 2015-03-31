package com.example.labdismov.holamundoapp.modelo;

/**
 * Created by Kenkox on 30/03/2015.
 */
import io.realm.RealmList;
import io.realm.RealmObject;
import io.realm.annotations.Ignore;

public class Seccion extends RealmObject {
    private int seccionID;
    private String nombreSeccion;

    public String getNombreSeccion() {
        return nombreSeccion;
    }

    public void setNombreSeccion(String nombreSeccion) {
        this.nombreSeccion = nombreSeccion;
    }

    public int getSeccionID() {
        return seccionID;
    }

    public void setSeccionID(int seccionID) {
        this.seccionID = seccionID;
    }


}
