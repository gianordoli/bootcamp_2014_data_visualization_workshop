int getMinValue(ArrayList<Bubble> myList) {
  int min = 100000000;
  for (Bubble b : myList) {
    if (b.nPosts < min) {
      min = b.nPosts;
    }
  }
  return min;
}
