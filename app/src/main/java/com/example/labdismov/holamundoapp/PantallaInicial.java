package com.example.labdismov.holamundoapp;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import java.util.Timer;
import java.util.TimerTask;
import android.content.Intent;
import android.app.Activity;
import android.view.Window;
import android.widget.ProgressBar;
import android.view.Menu;
import android.view.MenuItem;


public class PantallaInicial extends ActionBarActivity {
    private long tiempoPantalla = 2000;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pantalla_inicial);
        creaContador();
    }


    public void creaContador(){

        TimerTask task = new TimerTask() {
            @Override
            public void run() {
                Intent objIntent = new Intent(getApplicationContext(),HomeGUI.class);
                startActivity(objIntent);
                //finish();
            }
        };
        Timer timer = new Timer();
        timer.schedule(task, tiempoPantalla);
    }
}
