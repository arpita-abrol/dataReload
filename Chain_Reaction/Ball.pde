class Ball {
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
  
  final static int maxRad = 50; //maximum radius size. shrinks after reaching maxRad
      
  //other constants necessary?
  
  float x; //x coor
  float y; // y coor
  float rad; //radius size
  color c; //color
  float dx; //vel, x
  float dy; //vel, y
  int state; //current state, 0-3
  //int maxRad; //maximum radius size. shrinks after reaching maxRad

  Ball(){
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
    rad = 10;
    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );
    dx = random(10) - 5;
    dy = random(10) - 5;
    state = MOVING;
  }
  
  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }
 
 boolean isTouching( Ball other ) {
   if( sqrt( (this.x - other.x) * (this.x - other.x) + (this.y - other.y) * (this.y - other.y) ) <= (this.rad + other.rad) / 2 ) {
     return true;
   }
   return false;
 }
 
 
 void draw() {
   if ( state != 3 ) {
     smooth();
     fill(c);
     stroke(c);
     ellipse(x,y,rad,rad);
   }
 }
 
 void process() {
   if( this.rad <= 0) {
     state = 3;
   }
   if( this.state == 2 || this.state ==1 ) {
     dx = 0;
     dy = 0;
     changeSize();
   }
   if( this.rad >= maxRad ) {
     state = SHRINKING;
   }
   if( state == 0) {
     move();
   }
 }
 
 void changeSize() {
   if( state == 1 ) {
     rad += .25;
   }
   else {
     rad -= .25;
   }
 }
 
 void bounce() {
   if( x < 0 ) {
     dx = abs(dx); 
   }
   if( x >= height) {
     dx = -1 * abs(dx);
   }
   if( y < 0 ) {
     dy = abs(dy);
   }
   if( y >= width) {
     dy = abs(dy) * -1;
   }
 }
  
}//end class Ball