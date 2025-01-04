abstract class Crud {
  // create , read , update , delete
  Future<int> insert();
  Future<int> update();
  Future<int> delete();
  Future<int> select();
}
