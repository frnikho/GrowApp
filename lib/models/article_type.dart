enum ArticleType {unknown, electronic, book, cooking, living, tools, music}

String getTypeName(ArticleType type) {
  return type.toString().split('.')[1];
}

ArticleType getTypeFromName(String name) {
  for (ArticleType type in ArticleType.values) {
    if (getTypeName(type) == name) {
      return (type);
    }
  }
  return (ArticleType.unknown);
}