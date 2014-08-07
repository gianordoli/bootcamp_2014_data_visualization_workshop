/* ---------------------------------------------------------------------------
 Dorkshop: Data Visualization
 MFADT, Parsons The New School for Design
 August 9th, 2014
 Gabriel Gianordoli
 http://gianordoli.com
 
 * Loading filtered posts
--------------------------------------------------------------------------- */

//Storing all posts in a 2D array of Strings
//I don' know how many lines it has yet, but I know that there are 7 columns
String[][] posts = new String[0][7];

//Classes and teams will be stored in HashMaps ("name", index)
//Gonna use the index to store different colors
HashMap classes = new HashMap();
HashMap teams = new HashMap();
//Note: after Processing 2.0, StringLists are the best way to store this data
//However, they haven' been implemented in ProcessingJS yet 

void setup(){
  size(1333, 768);

  //loading posts
  String[] tableString = loadStrings("bootcamp_2013_filtered_posts.tsv");
  for(String lineString : tableString){
    String[] myLine = split(lineString, "\t");
    posts = (String[][])append(posts,
                               new String[]{
                                 trim(myLine[0]),  //class
                                 trim(myLine[1]),  //team
                                 trim(myLine[2]),  //student
                                 trim(myLine[3]),  //student href
                                 trim(myLine[4]),  //post
                                 trim(myLine[5]),  //post href
                                 trim(myLine[6])   //date
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
  debug();
}

void draw(){
  
}
