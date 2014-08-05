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

//Determines whether we'l use classes or teams to display color
//Setting "classes" as the default
String mode = "classes";

void setup(){
  size(1333, 768);
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
  float margin = 100;
  PVector pos = new PVector(margin, 0);
  
  //Looping throught the posts
  for(int i = 0; i < posts.length; i++){
    
    //Changing position depending on the date
    String currDate = posts[i][6];
    if(!currDate.equals(prevDate) && !prevDate.equals("")){      
      pos.x = margin;
      pos.y += size;
      
      fill(255);
      textAlign(RIGHT, TOP);
      text(currDate, margin, pos.y);      
    }else if(!prevDate.equals("")){
      pos.x += size;
    }
    prevDate = currDate;
    
    //Color
    if(mode.equals("classes")){
      fill(classes.get(posts[i][0]), 255, 255);
    }else if(mode.equals("teams")){
      fill(teams.get(posts[i][1]), 255, 255);
    }
    
    //Drawing
    rect(pos.x, pos.y, size, size);
  }
}

void keyPressed() {
  if (key == ' ') {
    mode = (mode.equals("classes")) ? ("teams"):("classes");
  }   
}
