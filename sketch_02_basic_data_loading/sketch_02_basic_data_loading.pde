/* ---------------------------------------------------------------------------
 Dorkshop: Data Visualization
 MFADT, Parsons The New School for Design
 August 9th, 2014
 Gabriel Gianordoli
 http://gianordoli.com
 
 * Loading and displaying filtered posts
--------------------------------------------------------------------------- */

void setup(){
  //loading posts
  String[][] students = new String[0][2];
  String[] tableString = loadStrings("bootcamp_2013_students.tsv");
  for(String lineString : tableString){
    String[] myLine = split(lineString, "\t");
    students = (String[][])append(students, new String[]{trim(myLine[0]), trim(myLine[1])});
  }
//  for(int i = 0; i < students.length; i++){
//    println(students[i][0] + "\t" + students[i][1]);
//  }

  String[] filteredPosts = new String[0];
    
  tableString = loadStrings("bootcamp_2013_posts.tsv");
  for(int i = 1; i < tableString.length; i++){
    String[] myLine = split(tableString[i], "\t");
    String author = trim(myLine[1]);

    //Is it a student or a teacher?
    for(int j = 0; j < students.length; j++){
      
      //Student!
      if(author.equals(students[j][1])){
        
        //Parsing the date
        String dayString = myLine[5].substring(myLine[5].indexOf(" ") + 1, myLine[5].length() - 2);
//        println(dayString);
        int day = parseInt(dayString);
//        println(day);
        String dateString = "08/" + day + "/2014";
        
        //Store this post as a tab-separated string
        String thisPost = trim(myLine[0]) + "\t" +      //class
                          trim(students[j][0]) + "\t" + //team
                          author + "\t" +               //student
                          trim(myLine[2]) + "\t" +      //student href
                          trim(myLine[3]) + "\t" +      //post
                          trim(myLine[4]) + "\t" +      //post href
                          dateString;              //date
                          
        filteredPosts = append(filteredPosts, thisPost);
      }
    }
  }
//  printArray(filteredPosts);
  saveStrings("bootcamp_2013_filtered_posts.tsv", filteredPosts);
}

void draw(){

}
