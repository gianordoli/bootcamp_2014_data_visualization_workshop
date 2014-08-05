void debug(){
  for(int i = 0; i < posts.length; i++){
    for(int j = 0; j < 7; j++){
      print(posts[i][j] + "\t");
    }
    println();
  }
  for(Map.Entry me : classes.entrySet()){
    println(me.getKey());
  }
  for(Map.Entry me : teams.entrySet()){
    println(me.getKey());
  }  
}
