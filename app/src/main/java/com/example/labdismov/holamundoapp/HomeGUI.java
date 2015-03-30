package com.example.labdismov.holamundoapp;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import io.realm.Realm;
import io.realm.RealmResults;


public class HomeGUI extends NavigationDrawerBase {
    private Realm realm;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_gui);
    }


}
