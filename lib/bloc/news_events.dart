abstract class NewsEvents{}

class HomeEvents extends NewsEvents{}
class CategoryEvents extends NewsEvents{
  final String category;
  CategoryEvents({required this.category});
}