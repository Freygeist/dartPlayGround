library hero;

import 'dart:html';

class Hero {

  int x = 60;
  int y = 60;
  int oldX = 0;
  int oldY = 0;
  String name = "";
  int speed = 0;


  Hero(int x, int y, int speed){
    this.x = x;
    this.y = y;
    this.oldX = x;
    this.oldY = y;
    this.speed = speed;
  }

  //TODO spriteschneiden

  void moveUp(){
    this.y--;
  }

  void moveDown(){
    this.y++;
  }

  void moveLeft(){
    this.x--;
  }

  void moveRight(){
    this.x++;
  }

  void setOldCoords(){
    this.oldX = x;
    this.oldY = y;
  }

  int getX(){
    return this.x;
  }

  int getY(){
    return this.y;
  }

  int getOldX(){
    return this.oldX;
  }

  int getOldY(){
    return this.oldY;
  }

}
