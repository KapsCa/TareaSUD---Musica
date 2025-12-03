import '../models/dog_model.dart';
import '../providers/dog_provider.dart';

class DogRepository {
  DogRepository(this.dogProvider);
  final DogProvider dogProvider;

  Future<BreedsDogs> getBreedsDogs() async {
    final response = await dogProvider.fetchBreedsDogs();
    return BreedsDogs.fromMap(response);
  }
}