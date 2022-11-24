

class Juego {

  int pantallaActual;
  float PotenciaDeTiro;
  boolean Sentido;
  boolean patear;
  int Direcciondetiro;
  boolean stop;
  boolean pateopelota;
  PImage [] Imagenes;
  Penal penal;
  Marcador marcador;
  Juego() {
    //penal=penal.Penaldefault();
    penal=new Penal();
    marcador=new Marcador();
    Cargadeimagenes(); 

    inicializar();
  }
  void Cargadeimagenes() {
    Imagenes=new PImage[6];
    for (int i =0; i < Imagenes.length; i++) {
      Imagenes[i]=loadImage(i+".png");
    }
  }
  void inicializar() {
    stop = false;
    PotenciaDeTiro=0;
    patear=false;
    pateopelota = false;
    Sentido=false;
  }
  void draw() {
    if (pantallaActual==0) {

      background(0);
      image(juego.Imagenes[4], 100, 0, 400, 400);
      rectMode(CENTER);
      fill(0);
      rect(width/2, height/2, 200, 20);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Pulsa flecha abajo para jugar", width/2, height/2);
    }
    if (pantallaActual==1 ) {

      text("marcador "+juego.marcador.jugador1, 300, 100);

      if ( (marcador.jugador1 != 3) && (marcador.jugador2 != 3)) {

        penal.arquero.draw(Imagenes[1]);
        penal.pelota.draw(Imagenes[3]);
        penal.pateador.draw(Imagenes[02]);
        println(patear);
        Barraespaciadora();
        if (patear) {
          penal.pateador.PatearPenal();
        }
        if (penal.pateador.Ready) {
          PatearPelota();
        }
        if (pateopelota== true) {
          // pantallaActual=2;
        }
      } else {
        pantallaActual=4;  // pantalla final ganaste
      }
    }
    if (pantallaActual==4) {

      background(0);

      image(juego.Imagenes[5], 100, 0, 400, 400);
      text("Productores: Manuel Garmendia, Tomas Coppola", 300, 300);
       fill(255);
       text("Pulsa ENTER para regresar al inicio", 300, 280);
     
    }
  }
  void PatearPelota() {

    //barra amarilla
    if ( PotenciaDeTiro >= 0 && PotenciaDeTiro <= 130 ) {
      println("postY"+ penal.pelota.Y); 
      println("postX"+ penal.pelota.X);
      penal.pelota.Moverpelota (PotenciaDeTiro, Direcciondetiro, 1);
      penal.arquero.movimientoarquero(PotenciaDeTiro, Direcciondetiro, 1);
      pateopelota=penal.pelota.valorpelota(Direcciondetiro, 1, pateopelota) ;
      if (Direcciondetiro==3) {
        if ( pateopelota) {
          penal.resultado (true);
          textSize(60);
          text("Gooooool", 200, 250);
          juego.marcador.jugador1 = +1;

          penal.arquero.resetear();
          penal.pelota.resetear();
          penal.pateador.resetear();
          pateopelota=false;
          patear=false;
          println("marcador: "+ juego.marcador.jugador1);
          //   pantallaActual=2;

          textSize(40);
          text("pulsa ENTER para continuar", 20, 300);
        }
      } else if (Direcciondetiro==1||Direcciondetiro==2)
      {
        if ( pateopelota) {
          penal.resultado (false);

          juego.marcador.jugador1 = +1;

          penal.arquero.resetear();
          penal.pelota.resetear();
          penal.pateador.resetear();
          pateopelota=false;
          patear=false;



          textSize(60);
          text("Penal atajado", 100, 250);
          // pantallaActual=2;
          textSize(40);
          text("pulsa ENTER para continuar", 20, 300);
        }
      }
    }

    //barra verde
    else if (PotenciaDeTiro >= 130 && PotenciaDeTiro<= 370) {
      penal.pelota.Moverpelota (PotenciaDeTiro, Direcciondetiro, 2);
      penal.arquero.movimientoarquero(PotenciaDeTiro, Direcciondetiro, 2);
      pateopelota=penal.pelota.valorpelota(Direcciondetiro, 2, pateopelota) ;
      if (Direcciondetiro==3) {
        if ( pateopelota) {
          penal.resultado (true);
          textSize(60);
          text("Gooooool", 200, 250);
          //  pantallaActual=2;
          juego.marcador.jugador1 = +1;

          penal.arquero.resetear();
          penal.pelota.resetear();
          penal.pateador.resetear();
          pateopelota=false;
          patear=false;


          textSize(40);
          text("pulsa ENTER para continuar", 20, 300);
        }
      } else if (Direcciondetiro==1||Direcciondetiro==2)
      {
        if ( pateopelota) {
          penal.resultado (false);
          juego.marcador.jugador1 = +1;

          penal.arquero.resetear();
          penal.pelota.resetear();
          penal.pateador.resetear();
          pateopelota=false;
          patear=false;


          textSize(60);
          text("Penal atajado", 100, 250);
          //  pantallaActual=2;
          textSize(40);
          text("pulsa ENTER para continuar", 20, 300);
        }
      }
    }

    //barra de tiro roja
    else if (PotenciaDeTiro >= 370 && PotenciaDeTiro<=500) {
      penal.pelota.Moverpelota (PotenciaDeTiro, Direcciondetiro, 3);
      penal.arquero.movimientoarquero(PotenciaDeTiro, Direcciondetiro, 3);
      pateopelota=penal.pelota.valorpelota(Direcciondetiro, 3, pateopelota);
      if ( pateopelota) {
        penal.resultado (false);
        juego.marcador.jugador1 = +1;

        penal.arquero.resetear();
        penal.pelota.resetear();
        penal.pateador.resetear();
        pateopelota=false;
        patear=false;


        textSize(60);
        text("Erras el penal!!!!", 100, 250);
        // pantallaActual=2;
        textSize(40);
        text("pulsa ENTER para continuar", 20, 300);
      }
    }
  }
  void Barraespaciadora() {
    rectMode(CORNER);


    //Barra Verde
    fill(0, 255, 2);
    rect (50, 340, 500, 30);
    //Barra AmARILLA
    fill(255, 233, 0);

    rect (50, 340, 130, 30);
    //Barra ROJA
    fill(255, 0, 0);
    rect (430, 340, 130, 30);


    fill(0, 0, 255);
    rect (50, 340, PotenciaDeTiro, 30);


    if (patear==false) {

      if (PotenciaDeTiro < 500 && Sentido==false ) {
        PotenciaDeTiro=PotenciaDeTiro+10;
      } else {
        if (PotenciaDeTiro==500) {
          Sentido=true;
        }
      }
      if (PotenciaDeTiro>0 && Sentido==true) {
        PotenciaDeTiro=PotenciaDeTiro-10;
      } else if (PotenciaDeTiro==0) {
        Sentido=false;
      }
    }
  }

  void teclado() {

    if (pantallaActual==1 && (keyCode== DOWN )  ) { 
      pantallaActual=4;
    }




    if (pantallaActual==4 && (keyCode== ENTER )  ) { 
      pantallaActual=0;
    }    


    if (pantallaActual==0 && (keyCode== DOWN )  ) { 
      pantallaActual=1;
    }  
    if (pantallaActual==1 && (keyCode== ENTER )) {
      patear=true;
    }

    if (pantallaActual==1 && keyCode== LEFT && stop==false) {
      stop=true;

      Direcciondetiro=1;

      penal.pateador.resetear();
      penal.arquero.resetear();
      penal.pelota.resetear();
      pantallaActual=1;
      patear=false;
      pateopelota=false;
      stop = false;
    }
    if (pantallaActual==1 && keyCode== UP && stop==false ) {
      stop=true;

      Direcciondetiro=2;

      penal.pateador.resetear();
      penal.arquero.resetear();
      penal.pelota.resetear();
      pantallaActual=1;
      patear=false;
      pateopelota=false;
      stop = false;
    }
    if (pantallaActual==1 && keyCode== RIGHT && stop==false) {
      stop=true;

      Direcciondetiro=3;

      penal.pateador.resetear();
      penal.arquero.resetear();
      penal.pelota.resetear();
      pantallaActual=1;
      patear=false;
      pateopelota=false;
      stop = false;
    }

    //  if (pantallaActual==2 && keyCode== ENTER) {
    // pantallaActual=3;
  }
}




class Penal {

  Pateador pateador;
  Arquero arquero;
  Pelota pelota;
  Arco arco;
  boolean resultadoPenal;



  Penal(Pateador pateadorPenal, Arquero arqueroPenal, Pelota pelotaPenal, Arco arcoPenal, boolean resultadoPenalPenal) {

    pateador = pateadorPenal;
    arquero= arqueroPenal;
    pelota=pelotaPenal;
    arco= arcoPenal;
    resultadoPenal = resultadoPenalPenal;
  }
  Penal () { 


    Pateador Messi=new Pateador("Messi", "izq", 95);
    Pelota Adidas=new Pelota ("Adidas", 50, 40 );
    Arquero Casillas=new Arquero ("Casillas", 90, 90);
    Arco Arco= new Arco (1, 115, 50, 370, 130);
    pateador=Messi;
    arquero=Casillas;
    pelota=Adidas;
    arco=Arco;
    resultadoPenal=false;
  }


  void resultado (boolean resultado) {


    resultadoPenal= resultado;
  }
}


class Pateador {
  String nombre, piernaHabil;
  float FuerzaDeTiro;
  float X;
  float Y;
  boolean Ready;
  Pateador(String nombrePateador, String piernaDelPateador, float fuerzaDelPateador) {
    nombre = nombrePateador;
    piernaHabil = piernaDelPateador;
    FuerzaDeTiro = fuerzaDelPateador;
    X= 350;
    Y=200;
    Ready=false;
  }
  void resetear() {
    X=350;
    Y=200;
    Ready=false;
  }

  void PatearPenal() {
    if (X >= 280 && Y >= 150 ) {
      X= X-10;
      Y=Y-5;
    } else {
      Ready=true;
    }
  }
  void draw(PImage foto) {

    image(foto, X, Y, 150, 250);
    //  rect(X, Y, 100, 200);
  }
}

class Arquero {
  String Nombre;
  float Agilidad;
  float Movilidad;
  float X;
  float Y;
  Arquero(String nombreArquero, float agilidadArquero, 
    float movilidadArquero) {
    Nombre = nombreArquero;
    Agilidad = agilidadArquero;
    Movilidad = movilidadArquero;
    X=270;
    Y=120;
  }
  void resetear() {
    X=270;
    Y=120;
  }
  void movimientoarquero (float velocidad, int direccion, int Color) {

    if (Color==1 || Color==2) {
      if (direccion==1 ) {
        if (X>= 180) {
          X=X-0.1*velocidad;
        }
      }
      if (direccion==2) {

        if (Y >= 100) {

          Y=Y-0.1*velocidad;
        }
      }
      if (direccion==3) {
        if (X >= 180 ) {
          X=X-0.1*velocidad;
        }
      }
    }
  }

  void draw(PImage foto) {
    image(foto, X, Y, 70, 100);
    //rect(X, Y, 50, 100);
  }
}

class Pelota {

  String modelo ;
  float tamano ;
  float peso;
  float X;
  float Y;


  Pelota(String modeloPelota, float tamanoPelota, float pesoPelota) {

    modelo=modeloPelota;
    tamano=tamanoPelota;
    peso= pesoPelota;
    X=280;
    Y=280;
  }
  void resetear() {
    X=280;
    Y=280;
  }
  boolean valorpelota (int direccion, int Color, boolean valor) {

    if (Color==1 || Color==2) {
      if (direccion==1 ) {
        if (X<= 180 && Y>=110) {
          print(X, Y);
          valor= true;
        }
      }
      if (direccion==2) {
        if (Y <= 120) {
          print(X, Y);
          valor=true;
        }
      }
      if (direccion==3) {    
        if (X>=400 && Y <=136) {
          println("X"+X+"Y"+Y);
          valor=true;
        }
      }
    } else if (Color==3) {

      if (direccion==1 ) {
        print(X, Y);
        if (X<= -10 && Y<= -10) {
          print(X, Y);
          valor=true;
        }
      }
      if (direccion==2) {

        if (Y<= -80) {
          print(X, Y);
          valor=true;
        }
      }
      if (direccion==3) {
        if (X>= 650 && Y>= -200) {
          print(X, Y);
          valor=true;
        }
      }
    }

    return valor ;
  }

  void Moverpelota(float velocidad, int direccion, int Color) {



    if (Color==1 || Color==2) {
      if (direccion==1 ) {
        if (X>= 180 && Y>=120) {
          X=X-0.1*velocidad;
          Y=Y-0.1*velocidad;
        }
      }
      if (direccion==2) {

        if (Y >= 120) {

          Y=Y-0.1*velocidad;
        }
      }
      if (direccion==3) {
        if (X <= 420 && Y >= 120) {
          X=X+0.1*velocidad;
          Y=Y-0.1*velocidad;
        }
      }
    } else if (Color==3) {


      if (direccion==1 ) {
        if (X>= -10 && Y>= -100) {

          X=X-0.1*velocidad;
          Y=Y-0.1*velocidad;
        }
      }
      if (direccion==2) {

        if (Y >= -80) {

          Y=Y-0.1*velocidad;
        }
      }
      if (direccion==3) {
        if (X <= 650 && Y >= -200) {
          X=X+0.1*velocidad;
          Y=Y-0.1*velocidad;
        }
      }
    }
  }

  void draw (PImage foto) {

    image(foto, X, Y, tamano, tamano);
    // ellipse(X, Y, tamano, tamano);
  }
}


class Arco {

  int Ndearco;
  float posicionX;
  float posicionY;

  float ancho;
  float alto;


  Arco(int NdearcoArco, float posicionXArco, float posicionYArco, float dimensionArco, float altodeArco) {

    Ndearco   = NdearcoArco;
    posicionX = posicionXArco;
    posicionY = posicionYArco;

    ancho= dimensionArco;
    alto= altodeArco;
  }


  void draw() {

    rect(posicionX, posicionY, ancho, alto);
  }
}
class Marcador {
  int jugador1;
  int jugador2;

  Marcador() {
    jugador1=0; 
    jugador2=0;
  }
}
