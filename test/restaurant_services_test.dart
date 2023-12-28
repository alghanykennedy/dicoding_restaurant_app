import 'package:dicoding_restaurant_app/features/authentication/model/restaurants_model.dart';
import 'package:dicoding_restaurant_app/features/authentication/services/restaurant_services.dart';
import 'package:dicoding_restaurant_app/utils/constants/api_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'restaurant_services_test.mocks.dart';

@GenerateMocks([http.Client, RestaurantService])
void main() {
  late MockClient mockClient;
  late RestaurantService restaurantService;

  setUp(() {
    mockClient = MockClient();
    restaurantService = RestaurantService(mockClient);
  });

  final uri = Uri.parse(
    Constants.listRestaurant,
  );
  const jsonString = '''
{
  "error": false,
  "message": "success",
  "count": 20,
  "restaurants": [
    {
      "id": "rqdv5juczeskfw1e867",
      "name": "Melting Pot",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
      "pictureId": "14",
      "city": "Medan",
      "rating": 4.2
    }
  ]
}
''';
  final restaurants = [
    const RestaurantsModel(
      id: "rqdv5juczeskfw1e867",
      name: "Melting Pot",
      description:
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
      pictureId: "14",
      city: "Medan",
      rating: 4.2,
    ),
  ];

  test('should return a list of articles with success when status code is 200',
      () async {
    // arrange
    when(mockClient.get(uri))
        .thenAnswer((_) async => http.Response(jsonString, 200));
    // act
    final result = await restaurantService.getRestaurantsService();
    // assert
    expect(result, isA<List<RestaurantsModel>>()); // Check if it's a list
    expect(result[0], equals(restaurants[0]));
    verify(mockClient.get(uri)).called(1);
  });

  test(
    'should throw an error when status code is not 200',
    () async {
      // arrange
      when(mockClient.get(uri)).thenAnswer((_) async => http.Response('', 404));
      // act
      final call = restaurantService.getRestaurantsService();
      // assert
      expect(() => call, throwsA(isA<Exception>()));
      verify(mockClient.get(uri));
    },
  );
}
