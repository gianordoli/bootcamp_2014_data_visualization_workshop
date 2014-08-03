/* ---------------------------------------------------------------------------
 Dorkshop: Data Visualization
 MFADT, Parsons The New School for Design
 August 9th, 2014
 Gabriel Gianordoli
 http://gianordoli.com
 
 * Loading and displaying filtered posts
--------------------------------------------------------------------------- */

//Storing all data in a 2D array of Strings
//I don' know how many lines it has yet, but I know that there are 7 columns
String[][] posts = new String[0][7];

void setup(){
  size(1333, 768);

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
  }
//  debug();
}

void draw(){
  background(255);
}

void debug(){
  for(int i = 0; i < posts.length; i++){
    for(int j = 0; j < 7; j++){
      print(posts[i][j] + "\t");
    }
    println();
  }
}

