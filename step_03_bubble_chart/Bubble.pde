class Bubble{
  String section;        // Section name, read from data
  int nPosts;            // Number of posts, read from data
  PVector pos;           // A variable that holds (x, y) values — and z, if 3D
  float bubbleSize;      // The final size of the bubble, based on the number of posts
  float tempBubbleSize;  // The actual size of our bubble
  float h, s, b;         // Hue, Saturation, and Brightness of our bubble
  
  Bubble(String _section, int _nPosts){
    section = _section;
    nPosts = _nPosts;
    pos = new PVector(random(width/2 - 50, width/2 + 50), random(width/2 - 50, height/2 + 50));
    tempBubbleSize = 1;
    bubbleSize = calculateDiameter(nPosts);
    h = 235;
    s = 255; 
  }
  
  void setBrightness(){
    // We're gonna map the posts value to the bubble brightness
    // CHECK OUT THESE TWO NEW FUNCTIONS! getMinValue() and getMaxValue()!
    // They'e gonna look for these values in our ArrayList
    b = map(nPosts, getMinValue(myBubbles), getMaxValue(myBubbles), 100, 200);
  }
  
  // Calculate diameter from area
  // A non-void function (float, here) MUST return a value!
  float calculateDiameter(int area){
    float r = sqrt(area/PI);
    return myScale*r;
  }  
  
  // Check if the mouse is hovering over our bubble
  // Another function returning variable
  boolean isHovering(){
    float distance = dist(mouseX, mouseY, pos.x, pos.y);
    if(distance < bubbleSize/2){
      return true;
    }else{
      return false;
    }
  }
  
  // Called before drawing the bubble, this function will
  // make the calculations (repel, growth) to update its position
  void update(){
    // Expand bubble
    if(tempBubbleSize < bubbleSize){
      tempBubbleSize += 0.5;
    }
    
    // Repel effect:
    // loop through the whole array of bubbles
    for(Bubble otherBubble : myBubbles){
      // Calculate the distance from this bubble to the another one
      float distance = dist(pos.x, pos.y, otherBubble.pos.x, otherBubble.pos.y);
      
      // If they overlap AND the other bubble is not the same as this one (dist == 0)
      if(distance <= (tempBubbleSize + otherBubble.tempBubbleSize)/2 &&
         distance > 0){
         PVector escape = new PVector(pos.x - otherBubble.pos.x, pos.y - otherBubble.pos.y);
         escape.normalize();
         // escape woulb be sufficient,
         // but we're adding 10% to make sure they don' get stuck touching each other
         pos.x = pos.x + escape.x * 1.1;
         pos.y = pos.y + escape.y * 1.1;
      }
    }
  }
  
  void display(){
    // Update position
    update();
    
    // Rollover effect
    float _b = b;
    if(isHovering()){
      _b = b + 55;
    }
    
    // Actually drawing
    fill(h, s, _b);
    noStroke();
    ellipse(pos.x, pos.y, tempBubbleSize, tempBubbleSize);
    
    // Text
    fill(255);
      // SECTION
      textAlign(CENTER, BOTTOM);
      
      // Does our section name fit the bubble in just one line?
      if(textWidth(section) < bubbleSize){
        text(section, pos.x, pos.y);
      
      // If not, let's look for white spaces and create a line break
      }else{
        
        String[] words = split(section, " ");
        String msg = words[0] + "\n";
        for(int i = 1; i < words.length; i++){
          msg += words[i] + " ";
        }
        text(msg, pos.x, pos.y);        
      } 
      
      // POSTS
      textAlign(CENTER, TOP);
      text(nPosts, pos.x, pos.y);
  }
}
