package com.appkotlin.myapplication;

import android.os.Bundle;
import android.widget.Button;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        Button miBoton = findViewById(R.id.miBoton);
        miBoton.setOnClickListener(v -> {
            Toast.makeText(MainActivity.this, "¡Botón presionado!", Toast.LENGTH_SHORT).show();
        });
    }
}
