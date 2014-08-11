/* ---------------------------------------------------------------------------
 Bootcamp 2014 Data Visualization Dorkshop
 MFADT, Parsons The New School for Design
 August 9th, 2014
 Gabriel Gianordoli
 http://gianordoli.com
 
 Visualizing all posts from http://bootcamp.parsons.edu/2013/
 Data Scraped with https://www.kimonolabs.com/
 See more about the original data in
 https://github.com/gianordoli/bootcamp_2013_visualization
 
 This example:
 - loading data from the tsv's
 - creating an ArrayList of Bubbles to display the data
--------------------------------------------------------------------------- */

ArrayList<Bubble> myBubbles;
//We're going to use this number to adjust the scale of the bubbles
float myScale;

void setup(){
  size(800, 800);
  colorMode(HSB);
  myBubbles = new ArrayList<Bubble>();
  myScale = 20;
  
  // Loading our original data (the tsv file) into an Array.
  // Each row becomes an entry. So there are no columns so far 
  String[] originalData = loadStrings("posts_by_team.tsv");
  
  // This function will split our data into columns and add elements to our HashMap
  splitData(originalData);
  
  // Just looping through the ArrayList and printing the values we sent
  debug();  
  
  //Setting the bubbles' brightness
  for(Bubble b : myBubbles){    
    b.setBrightness();
  }   
}

void splitData(String[] myArray){
  for(int i = 0; i < myArray.length; i++){
    // So, each array antry is a row...
    String myRow = myArray[i];         
    
    // ...and we'll split it into columns.
    // To use this function, we need to tell Processing
    // what's the delimiter between the cells. "\t" it's TAB    
    String[] columns = split(myRow, "\t");
    String section = trim(columns[0]);
    int nPosts = parseInt(trim(columns[1]));
    
    // Creating a temporary Bubble object with 2 arguments:
    // section and number os posts
    Bubble tempBubble = new Bubble(section, nPosts);
    
    // Adding the Bubble to the ArrayList
    myBubbles.add(tempBubble);
  }  
}

void draw(){
  background(0);
  
  // Shorter way of writing a for loop
  for(Bubble b : myBubbles){    
    b.display();
  }
  // In this case, the same as writing:
  // for(int i = 0; i < j; i++){
  //   Bubble b = myBubbles.get(i);
  //   b.display();
  // }
    
}
