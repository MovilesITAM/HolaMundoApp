package com.example.labdismov.holamundoapp.vista;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;

import android.app.Activity;
import android.app.SearchManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v4.app.ActionBarDrawerToggle;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.text.SpannableString;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.SearchView;
import android.view.Menu;
import android.view.MenuItem;

import com.example.labdismov.holamundoapp.R;


public class NavigationDrawerBase extends ActionBarActivity {
    protected DrawerLayout _dlLayout;
    protected ActionBarDrawerToggle _abPalanca;

    protected CharSequence mDrawerTitle;
    protected CharSequence mTitle;

    protected DrawerLayout _dlCapaBase;
    protected FrameLayout _rlContenido;

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        _abPalanca.onConfigurationChanged(newConfig);
    }
    @Override
    protected void onPostCreate(Bundle savedInstanceState) {
        super.onPostCreate(savedInstanceState);
        // Sync the toggle state after onRestoreInstanceState has occurred.
        _abPalanca.syncState();
    }
    @Override
    public void setContentView(final int layoutResID) {
        _dlCapaBase = (DrawerLayout) getLayoutInflater().inflate(R.layout.activity_navigation_drawer_base, null);
        _rlContenido = (FrameLayout) _dlCapaBase .findViewById(R.id.contenido_principal);
        getLayoutInflater().inflate(layoutResID, _rlContenido, true);
        super.setContentView(_dlCapaBase);

        mTitle = mDrawerTitle = getTitle();
        _dlLayout = (DrawerLayout) findViewById(R.id.drawer_layout);

        _dlLayout.setDrawerShadow(R.drawable.drawer_shadow, GravityCompat.START);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setHomeButtonEnabled(true);

        _abPalanca = new ActionBarDrawerToggle(
                this,
                _dlLayout,
                R.drawable.ic_navigation_drawer,
                R.string.drawer_open,
                R.string.drawer_close
        ) {
            public void onDrawerClosed(View view) {

                invalidateOptionsMenu();
            }

            public void onDrawerOpened(View drawerView) {

                invalidateOptionsMenu();
            }
        };
        _dlLayout.setDrawerListener(_abPalanca);


        // here you can get your drawer buttons and define how they should behave and what must they do, so you won't be needing to repeat it in every activity class
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_navigation_drawer_base, menu);


        return super.onCreateOptionsMenu(menu);

    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        return super.onPrepareOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        if (_abPalanca.onOptionsItemSelected(item)) {
            return true;
        }
        return true;

    }


}
