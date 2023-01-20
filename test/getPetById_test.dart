import 'package:test/test.dart';
import 'package:nymble_labs_pet_adoption/Utils/sample_data.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_utils.dart';

void main() {
  test('getPetById returns correct pet', () {
    Pet expectedPet = pets[0];
    Pet returnedPet = getPetById(expectedPet.id);
    expect(returnedPet, expectedPet);
  });

  test('getPetById returns default pet if id not found', () {
    Pet returnedPet = getPetById("invalid_id");
    expect(returnedPet.name, "Not Found");
    expect(returnedPet.id, "0");
  });
}
