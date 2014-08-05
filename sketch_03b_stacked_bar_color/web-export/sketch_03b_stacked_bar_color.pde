/* ---------------------------------------------------------------------------
 Dorkshop: Data Visualization
 MFADT, Parsons The New School for Design
 August 9th, 2014
 Gabriel Gianordoli
 http://gianordoli.com
 
 * Loading filtered posts
 * Displaying a sort of stacked bar chart, with timeline on x axys
 * Two color modes: classes and teams
--------------------------------------------------------------------------- */

//Storing all data in a 2D array of Strings
//I don' know how many lines it has yet, but I know that there are 7 columns
String[][] posts = new String[0][7];

//Classes and teams will be stored in HashMaps ("name", index)
//Gonna use the index to store different colors
HashMap classes = new HashMap();
HashMap teams = new HashMap();
//Note: after Processing 2.0, StringLists are the best way to store this data
//However, they haven' been implemented in ProcessingJS yet 

void setup(){
  size(800, 600);
  colorMode(HSB);

  //loading posts
  String[] tableString = loadStrings("bootcamp_2013_filtered_posts.tsv");
  for(String lineString : tableString){
    String[] myLine = split(lineString, "\t");
    posts = (String[][])append(posts,
                               new String[]{
                                 trim(myLine[0]),
                                 trim(myLine[1]),
                                 trim(myLine[2]),
                                 trim(myLine[3]),
                                 trim(myLine[4]),
                                 trim(myLine[5]),
                                 trim(myLine[6])
                               });
    //Storing classes
    if(classes.containsKey(myLine[0]) != true){
      classes.put(myLine[0], 0);
    } 
    //Storing teams
    if(teams.containsKey(myLine[1]) != true){
      teams.put(myLine[1], 0);
    }  
  }
  
  //Assigning hue values for each class and team
  createColors(classes);
  createColors(teams);  
//  debug();  
}

void draw(){
  background(0);
  
  //Vars
  String prevDate = "";  
  float size = 16;  
  float x = 0;
  float y = height;
  
  //Looping throught the posts
  for(int i = 0; i < posts.length; i++){
    
    //Changing position depending on the date
    String currDate = posts[i][6];
    if(!currDate.equals(prevDate) && !prevDate.equals("")){
      x += size;
      y = height;
    }else if(!prevDate.equals("")){
      y -= size;
    }
    prevDate = currDate;
    
    //Color
    fill(classes.get(posts[i][0]), 255, 255);
//    fill(teams.get(posts[i][1]), 255, 255);
    
    //Drawing
    rect(x, y, size, -size);
  }
}
void createColors(HashMap hm){
  int i = 0;
  for (Map.Entry me : hm.entrySet()) {
    //Mapping each HashMap entry to a unique hue
    int tempColor = int(map(i, 0, hm.size(), 0, 200));
    me.setValue(tempColor);
    i++;
  }
}
void debug(){
  for(int i = 0; i < posts.length; i++){
    for(int j = 0; j < 7; j++){
      print(posts[i][j] + "\t");
    }
    println();
  }
  for(Map.Entry me : classes.entrySet()){
    println(me.getKey() + ", " + me.getValue());
  }
  for(Map.Entry me : teams.entrySet()){
    println(me.getKey() + ", " + me.getValue());
  }  
}

