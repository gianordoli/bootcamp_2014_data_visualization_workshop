void createColors(HashMap hm){
  int i = 0;
  for (Map.Entry me : hm.entrySet()) {
    //Mapping each HashMap entry to a unique hue
    int tempColor = int(map(i, 0, hm.size(), 0, 200));
    me.setValue(tempColor);
    i++;
  }
}
