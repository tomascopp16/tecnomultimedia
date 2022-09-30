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
  Juego() {
    //penal=penal.Penaldefault();
    penal=new Penal();
    Cargadeimagenes(); 

    inicializar();
  }
  void Cargadeimagenes() {
    Imagenes=new PImage[4];
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

    if (pantallaActual==0 ) {
      penal.arquero.draw(Imagenes[1]);
      penal.pelota.draw(Imagenes[3]);
      penal.pateador.draw(Imagenes[02]);

      Barraespaciadora();
      if (patear) {
        penal.pateador.PatearPenal();
      }
      if (penal.pateador.Ready) {
        PatearPelota();
      }
      if (pateopelota== true) {
        pantallaActual=1;
      }
    }
  }
  void PatearPelota() {

    //barra amarilla
    if ( PotenciaDeTiro >= 0 && PotenciaDeTiro <= 130 ) {
      penal.pelota.Moverpelota (PotenciaDeTiro, Direcciondetiro, 1);
      penal.arquero.movimientoarquero(PotenciaDeTiro, Direcciondetiro, 1);
      pateopelota=penal.pelota.valorpelota(Direcciondetiro, 1, pateopelota) ;
      if (Direcciondetiro==3) {
        if ( pateopelota) {
          penal.resultado (true);
          textSize(60);
          text("Gooooool", 200, 250);
          pantallaActual=1;
          textSize(40);
          text("pulsa ENTER para continuar", 20, 300);
        }
      } else if (Direcciondetiro==1||Direcciondetiro==2)
      {
        if ( pateopelota) {
          penal.resultado (false);
          textSize(60);
          text("Penal atajado", 100, 250);
          pantallaActual=1;
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
          pantallaActual=1;
          textSize(40);
          text("pulsa ENTER para continuar", 20, 300);
        }
      } else if (Direcciondetiro==1||Direcciondetiro==2)
      {
        if ( pateopelota) {
          penal.resultado (false);
          textSize(60);
          text("Penal atajado", 100, 250);
          pantallaActual=1;
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
        textSize(60);
        text("Erras el penal!!!!", 100, 250);
        pantallaActual=1;
        textSize(40);
        text("pulsa ENTER para continuar", 20, 300);
      }
    }
  }
  void Barraespaciadora() {
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
   
    if (keyCode== ENTER ) {

      patear=true;

      println(PotenciaDeTiro);
    }
    if (keyCode== LEFT && stop==false) {
      stop=true;

      Direcciondetiro=1;
    }
    if (keyCode== UP && stop==false ) {
      stop=true;

      Direcciondetiro=2;
    }
    if (keyCode== RIGHT && stop==false) {
      stop=true;

      Direcciondetiro=3;
    }
    if (pantallaActual==1 && keyCode== ENTER) {
      pantallaActual=2;
    }
    if (pantallaActual==2 && keyCode== ENTER) {
      Direcciondetiro=(0);
      penal.pateador.resetear();
      penal.arquero.resetear();
      penal.pelota.resetear();
      pantallaActual=0;
      patear=false;
      pateopelota=false;
      stop = false;
    }
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
        if (X>=400 && Y <=135) {
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
