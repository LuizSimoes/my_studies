package com.cursoandroid.pedrapapeltesoura;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.Random;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    // poderia ter usado botões ao invés de imagens, mas só foi para ver essa abordagem
    public void selecionadoPedra(View view) {
        this.opcaoSelecionada("Pedra");
    }

    public void selecionadoPapel(View view) {
        this.opcaoSelecionada("Papel");
    }

    public void selecionadoTesoura(View view) {
        this.opcaoSelecionada("Tesoura");
    }


    public void opcaoSelecionada(String escolhaUsuario
    ) {

        ImageView imagemResultado = findViewById(R.id.imageResultado);
        TextView textoResultado = findViewById(R.id.textResultado);

        int numero = new Random().nextInt(3);// 0 1 2
        String[] opcoes = {"Pedra", "Papel", "Tesoura"};
        String escolhaApp = opcoes[numero];

        switch (escolhaApp) {
            case "Pedra":
                imagemResultado.setImageResource(R.drawable.pedra);// recebe uma nova imagem a partir de um recurso
                break;
            case "Papel":
                imagemResultado.setImageResource(R.drawable.papel);// recebe uma nova imagem a partir de um recurso
                break;
            case "Tesoura":
                imagemResultado.setImageResource(R.drawable.tesoura);// recebe uma nova imagem a partir de um recurso
                break;
        }

        if (//Teste de todas as possibilidades do App ganhador
                (escolhaApp == "Tesoura" && escolhaUsuario == "Papel") ||
                        (escolhaApp == "Papel" && escolhaUsuario == "Pedra") ||
                        (escolhaApp == "Pedra" && escolhaUsuario == "Tesoura")

        ) {//App ganhador
            textoResultado.setText(escolhaApp+" Ganha de "+escolhaUsuario+"...Você perdeu :(");

        } else if (// Teste de todas as possibilidades do Usuário ganhador
                (escolhaUsuario == "Tesoura" && escolhaApp == "Papel") ||
                        (escolhaUsuario == "Papel" && escolhaApp == "Pedra") ||
                        (escolhaUsuario == "Pedra" && escolhaApp == "Tesoura")
        ) {//Usuário ganhador
            textoResultado.setText(escolhaUsuario+" Ganha de "+escolhaApp+"...Você Ganhou :)");

        } else {//Caso nada ocorra como previsto acima é Empate
            textoResultado.setText("Empatamos ;)");

        }


        System.out.println("item App: " + escolhaApp);

    }

}
