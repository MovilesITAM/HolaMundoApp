package com.example.labdismov.holamundoapp.vista;

import android.os.Bundle;

import com.example.labdismov.holamundoapp.R;
import com.example.labdismov.holamundoapp.modelo.Seccion;
import android.util.Log;
import io.realm.Realm;


public class HomeGUI extends NavigationDrawerBase {
    private Realm realm;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_gui);
        realm = Realm.getInstance(this);
        realm.beginTransaction();

        // Add a person
        Seccion seccion = realm.createObject(Seccion.class);
        seccion.setSeccionID(1);
        seccion.setNombreSeccion("Computacion");
        seccion = realm.where(Seccion.class).findFirst();
        showStatus(seccion.getSeccionID() + ":" + seccion.getNombreSeccion());

        // When the write transaction is committed, all changes a synced to disk.
        realm.commitTransaction();
    }
    private void showStatus(String txt) {
        Log.v("Verbose", txt);

    }


}
