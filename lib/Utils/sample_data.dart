import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';

//sample data on which the application is currently based on
List<Map<String, dynamic>> categories = [
  {
    'name': 'All',
    'icon': 'assets/images/all.png',
    'active': true,
  },
  {
    'name': 'cat',
    'icon': 'assets/images/catoutline.png',
    'active': false,
  },
  {
    'name': 'dog',
    'icon': 'assets/images/dogoutline.png',
    'active': false,
  },
  {
    'name': 'rabbit',
    'icon': 'assets/images/rabbitoutline.png',
    'active': false,
  },
];

List<Pet> pets = [
  Pet(
    id: '11',
    name: 'Rose',
    species: 'Domestic Long Hair',
    animal: 'cat',
    age: 3,
    images: [
      'assets/images/rose1.jpeg',
      'assets/images/rose2.jpeg',
      'assets/images/rose3.jpeg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 2500,
    isadopted: false,
  ),
  Pet(
    id: '12',
    name: 'Reece',
    species: 'American Bobtail',
    animal: 'cat',
    age: 4,
    images: [
      'assets/images/reece.jpg',
    ],
    gender: IconData(0xe3c5, fontFamily: 'MaterialIcons'),
    price: 5750,
    isadopted: false,
  ),
  Pet(
    id: '13',
    name: 'Puff',
    species: 'Abyssinian Cat',
    animal: 'cat',
    age: 2,
    images: [
      'assets/images/cat-1.jpg',
      'assets/images/cat-2.jpg',
      'assets/images/cat-3.jpg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 2999,
    isadopted: false,
  ),
  Pet(
    id: '14',
    name: 'Mikey',
    animal: 'cat',
    species: ' Domestic Medium ',
    age: 3,
    images: [
      'assets/images/Mikey1.jpeg',
      'assets/images/Mikey2.jpeg',
      'assets/images/Mikey3.jpeg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 3000,
    isadopted: false,
  ),
  Pet(
    id: '15',
    name: 'Ray',
    species: 'Rex',
    animal: 'rabbit',
    age: 5,
    images: [
      'assets/images/PRALINE.jpg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 6500,
    isadopted: false,
  ),
  Pet(
    id: '16',
    name: 'Panda',
    species: 'Domestic Long Hair',
    animal: 'cat',
    age: 5,
    images: [
      'assets/images/panda1.jpg',
      'assets/images/panda2.jpg',
      'assets/images/panda3.jpg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 3000,
    isadopted: false,
  ),
  Pet(
    id: '17',
    name: 'Shmoo',
    species: 'Domestic Short Hair',
    animal: 'cat',
    age: 7,
    images: [
      'assets/images/shmoo1.jpg',
      'assets/images/shmoo1.jpg',
      'assets/images/shmoo1.jpg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 4000,
    isadopted: false,
  ),
  Pet(
    id: '18',
    name: 'Patricia',
    species: 'Rabbit',
    animal: 'rabbit',
    age: 5,
    images: [
      'assets/images/patricia1.jpg',
      'assets/images/patricia2.jpg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 6000,
    isadopted: false,
  ),
  Pet(
    id: '19',
    name: 'Rocky',
    species: ' Brindle',
    animal: 'dog',
    age: 6,
    images: [
      'assets/images/rocky1.jpg',
      'assets/images/rocky1.jpg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 3000,
    isadopted: false,
  ),
  Pet(
    id: '20',
    name: 'Willy',
    species: 'Bunny',
    animal: 'rabbit',
    age: 3,
    images: [
      'assets/images/willy1.jpg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 6500,
    isadopted: false,
  ),
  Pet(
    id: '21',
    name: 'Luka',
    species: ' Shepherd Mix ',
    animal: 'dog',
    age: 8,
    images: [
      'assets/images/Luka1.jpeg',
      'assets/images/Luka2.jpeg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 7000,
    isadopted: false,
  ),
  Pet(
    id: '22',
    name: 'Sokka',
    species: 'Mini Rex & New Zealand Mix ',
    animal: 'rabbit',
    age: 5,
    images: [
      'assets/images/Sokka1.jpeg',
      'assets/images/Sokka2.jpeg',
      'assets/images/Sokka3.jpeg',
    ],
    gender: IconData(0xe261, fontFamily: 'MaterialIcons'),
    price: 3000,
    isadopted: false,
  ),
];