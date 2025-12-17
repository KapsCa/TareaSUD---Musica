import '../models/dog_model.dart';
import '../providers/dog_provider.dart';

class DogRepository {
  DogRepository(this.dogProvider);
  final DogProvider dogProvider;

  Future<List<BreedsDogs>> getBreedsDogs() async {
    final response = await dogProvider.fetchBreedsDogs();
    final responseData = response['data'];
    if (responseData != null) {
      final results = <BreedsDogs>[];
      for (var item in responseData) {
        results.add(BreedsDogs.fromMap(item['attributes']));
      }
      return results;
    }
    return [];
  }
}
