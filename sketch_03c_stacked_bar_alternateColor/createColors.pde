void createColors(HashMap hm){
  int i = 0;
  for (Map.Entry me : hm.entrySet()) {
    int tempColor = int(map(i, 0, hm.size(), 0, 200));
    me.setValue(tempColor);
    i++;
  }
}
