
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_utils.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';

void main() {
  SharedPreferences.setMockInitialValues({'token': '12345678'});
  TestWidgetsFlutterBinding.ensureInitialized();
  test('getAdoptedPetsIdfromStorage returns correct pet ids', () async {
    final prefs = await SharedPreferences.getInstance();
    final expectedIds = ['1', '2', '3'];
    await prefs.setStringList(kAdoptedPets, expectedIds);

    final ids = await getAdoptedPetsIdfromStorage();
    expect(ids, expectedIds);
    await prefs.remove(kAdoptedPets);
  });

  test('getAdoptedPetsIdfromStorage returns empty list if no ids found', () async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(kAdoptedPets);
    final ids = await getAdoptedPetsIdfromStorage();
    expect(ids, []);
  });
}

