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
 - counting posts by a given category (team, class, student or date)
--------------------------------------------------------------------------- */

//We'll use a 2D array to store our data: [category][number of posts]
String[][] finalData;

void setup(){
  
  //Creating a header
  finalData = new String[1][2];
  finalData[0][0] = "class";
  finalData[0][1] = "value";
  
  // Loading our original data (the tsv file) into an Array.
  // Each row becomes an entry. So there are no columns so far 
  String[] originalData = loadStrings("bootcamp_2013_posts.tsv");
  
  // This function will split our data into columns and add elements to our finalData array
  splitAndFilterData(originalData);
}

void splitAndFilterData(String[] myArray){
  for(int i = 0; i < myArray.length; i++){
    // So, each array entry is a row...
    String myRow = myArray[i];         
    
    // ...and we'll split it into columns.
    // To use this function, we need to tell Processing
    // what's the delimiter between the cells. "\t" it's TAB    
    String[] columns = split(myRow, "\t");
    
    // I'm looking for a specific column now, number 5
    // Data might come messy! Use trim to clean up white spaces from the beginning and end of it
    String thisData = trim(columns[5]);
    
    // I'm going to check if I already have that data in my finalData array
    // (certainly not, in the first time I run this!)
    boolean isStored = false;
    int j = 0;
    while(j < finalData.length){
      if(finalData[j][0].equals(thisData)){
        isStored = true;
        break;
      }
      j++;
    }
    // If this data it's already registered in our array, let's increase its count    
    if(isStored){
      int count = parseInt(finalData[j][1]) + 1;
      finalData[j][1] = nf(count, 0, 0);
    // If this class is not yet registered, create an entry for it
    // and assign a value 1 (beacuse it has appeared just one time so far)      
    }else{
      finalData = (String[][])append(finalData, new String[]{thisData, "1"});   
    }    
  }
  // If everything goes right, you should be able to see this:
  for(int i = 0; i < finalData.length; i++){
    println(finalData[i][0] + " : " + finalData[i][1]);
  }
  
  // Now let's save this data into another tsv file.
  // Processing won't save from 2D Arrays. So:
  String[] newFile = new String[finalData.length];  
  for(int i = 0; i < finalData.length; i++){
    newFile[i] = finalData[i][0] + "\t" + finalData[i][1];
  }  
  
  saveStrings("posts_by_class.tsv", newFile);
}

void draw(){

}
