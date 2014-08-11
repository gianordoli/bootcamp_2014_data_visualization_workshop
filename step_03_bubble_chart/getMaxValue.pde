int getMaxValue(ArrayList<Bubble> myList) {
  int max = 0;
  for (Bubble b : myList) {
    if (b.nPosts > max) {
      max = b.nPosts;
    }
  }
  return max;
}
