
class PagedResponse<T> {
  final List<T> items;
  final bool hasMore;

  PagedResponse({
    required this.items,
    required this.hasMore,
  });
}


