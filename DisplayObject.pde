class DisplayObject
{
  PVector position;
  PVector move;
  int R, G, B;
  int syurui;
  int HP;
  
  
  DisplayObject(){
    position = new PVector(0,0);
    move = new PVector(0,0);
    noStroke();
  }
  void Draw(){};
}
