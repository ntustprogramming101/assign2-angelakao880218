PImage start,startY,startW;
PImage bg,vegetable,ratdown,rat,ratleft,ratright,life,life2,life3,dust,soldier;
PImage over,restartY,restartW;

final int GAME_START=0;
final int GAME_RUN=1;
final int GAME_OVER=2;
int gameState=GAME_START;

int ratX=320;
int ratY=80;
int soldierX=-80;
int soldierY=floor(random(2,6))*80;
int vegetableX=floor(random(8))*80;
int vegetableY=floor(random(2,6))*80;
int lifeX=10;
int lifeY=10;
int lifeGap=25*2+20;


void setup() {
	size(640, 480, P2D);
  //page1
  start=loadImage("img/title.jpg");
  startY=loadImage("img/startHovered.png");
  startW=loadImage("img/startNormal.png");
  //page2
  bg=loadImage("img/bg.jpg");
  vegetable=loadImage("img/cabbage.png");
  ratdown=loadImage("img/groundhogDown.png");
  rat=loadImage("img/groundhogIdle.png");
  ratleft=loadImage("img/groundgogLeft.png");
  ratright=loadImage("img/groundhogRight.png");
  life=loadImage("img/life.png");
  life2=loadImage("img/life.png");
  life3=loadImage("img/life.png");
  dust=loadImage("img/soil.png");
  soldier=loadImage("img/soldier.png");
  //page3
  over=loadImage("img/gameover.jpg");
  restartY=loadImage("img/restartHovered.png");
  restartW=loadImage("img/restartNormal.png");
  

}




void draw() {
  switch(gameState){
    //page1
    case GAME_START:
      if(mouseX>248 && mouseX<392 && mouseY>360 && mouseY<420){
        image(start,0,0);
        image(startY,248,360);
        if(mousePressed){
         gameState=GAME_RUN; 
        }
        }else{
         image(start,0,0);
         image(startW,248,360);
        }
    break;
    //page2
    case GAME_RUN:
      //background
      image(bg,0,0);
      //sun
      noStroke();
      fill(255,255,0);
      ellipse(590,50,130,130);
      fill(253,184,19);
      ellipse(590,50,120,120);
      //grass
      fill(124,204,25);
      rect(0,145,640,15);
      //dust
      image(dust,0,160);
      
      //heart
      //0
      image(life,lifeX-lifeGap,lifeY);
      //1
      image(life,lifeX,lifeY);
      //2
      image(life2,lifeX+lifeGap,lifeY);

      //rat
      image(rat,ratX,ratY);
      //soldier
      image(soldier,soldierX,soldierY);
      soldierX+=5;
      if(soldierX>640){
       soldierX=-80; 
      }
      if(ratX+80>soldierX && ratX<soldierX+80 && 
      ratY+80>soldierY && ratY<soldierY+80){
      lifeX=lifeX-lifeGap;
      ratX=320;
      ratY=80;

      }
      //vegetable
      image(vegetable,vegetableX,vegetableY);
      if(ratX+80>vegetableX && ratX<vegetableX+80 && 
      ratY+80>vegetableY && ratY<vegetableY+80){
      lifeX=lifeX+lifeGap;  
      vegetableX=-100;
      vegetableY=-100;
      }
      //end
      if(lifeX<0-lifeGap){
      gameState=GAME_OVER; 
      }
    break;
    //page3
    case GAME_OVER:
    if(mouseX>248 && mouseX<392 && mouseY>360 && mouseY<420){
        image(over,0,0);
        image(restartY,248,360);
        if(mousePressed){
         gameState=GAME_RUN;
         vegetableX=floor(random(8))*80;
         vegetableY=floor(random(2,6))*80;
         lifeX=10;
         soldierX=-80;
        soldierY=floor(random(2,6))*80;
         ratX=320;
         ratY=80;
        }
        }else{
         image(over,0,0);
         image(restartW,248,360);
        }
    break;
  }  
}







void keyPressed(){
 if(key==CODED){
   switch(keyCode){

     case DOWN:
     ratY+=80; 
     if(ratY>400){
     ratY=400; 
     }
     break;
      
     case LEFT:
     ratX-=80;
     if(ratX<0){
     ratX=0; 
     }
     break;
     
     case RIGHT:
     ratX+=80;
     if(ratX>560){
     ratX=560; 
     }
     break;    
  }
 }
}
