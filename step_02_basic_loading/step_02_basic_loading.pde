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
 - just loading data from the tsv's
--------------------------------------------------------------------------- */

// Once again, we'll use a 2D array to store our data: [category][number of posts]
String[][] finalData;

void setup(){
  
  // Loading our original data (the tsv file) into an Array.
  // Each row becomes an entry. So there are no columns so far 
  String[] originalData = loadStrings("posts_by_students.tsv");
  
  // This function will split our data into columns and add elements to our HashMap
  splitData(originalData);
}

void splitData(String[] myArray){
  for(int i = 0; i < myArray.length; i++){
    // So, each array antry is a row...
    String myRow = myArray[i];         
    
    // ...and we'll split it into columns.
    // To use this function, we need to tell Processing
    // what's the delimiter between the cells. "\t" it's TAB    
    String[] columns = split(myRow, "\t");
    

  }  

}

void draw(){

}
