import 'package:flutter/material.dart';

abstract class Pet{
  static int totalPets = 0;
  String name;
  Pet(this.name){
    totalPets ++;
  }
  void makeSound(); // Abstract method
  Pet.named({required this.name}){
    totalPets ++;
  }
}
mixin Flyable{
  void fly(){
    print('Flying');
  }
}

abstract class Friendly{
  void beFriendly(){
  }
}


class Dog extends Pet implements Friendly{
  Dog(String name): super(name);
  Dog.named({required String name}): super.named(name: name); // Named constructor
    @override
    void makeSound(){
      print(' ${this.name} says : hav hav'); // this keyword kullanımı
  }
  @override
  void beFriendly(){
    print('${this.name} is friendly'); // this keyword kullanımı
  }
}

class Bird extends Pet with Flyable implements Friendly{
  Bird(String name):super(name);
  Bird.named({required String name}): super.named(name: name); // Named constructor

  @override
  void makeSound(){
    print('${this.name} says:cik cik'); // this keyword kullanımı
  }

  @override
  void beFriendly() {
    print('${this.name} is friendly'); // this keyword kullanımı
  }

}


class Cat extends Pet implements Friendly{
  Cat(String name): super(name);
  Cat.named({required String name}): super.named(name: name); // Named constructor

  @override
  void makeSound(){
    print('${this.name} says:miyaw'); // this keyword kullanımı
  }
  
  @override
  void beFriendly() {
    print('${this.name} is friendly'); // this keyword kullanımı
  }
}


