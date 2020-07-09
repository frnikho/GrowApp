enum ArticleType {unknown, cosmetic}

ArticleType getTypeFromName(String name) {
  ArticleType.values.forEach((type) {
    if (type.toString().split('.')[1] == name) {
      return (type);
    }
  });
  return (ArticleType.unknown);
}

ArticleType getTypeFromId(int id) {
  for (int i = 0; i < ArticleType.values.length; i++) {
    if (id == i)
      return (ArticleType.values[i]);
  }
  return (ArticleType.values[0]);
}