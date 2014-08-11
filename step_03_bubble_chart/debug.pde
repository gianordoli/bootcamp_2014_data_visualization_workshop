void debug(){
  for(int i = 0; i < myBubbles.size(); i++){
    Bubble tempBubble = myBubbles.get(i);
    println(tempBubble.section + "\t" + tempBubble.nPosts + "\t" + tempBubble.bubbleSize);
  }
}
