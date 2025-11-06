import 'package:flutter/material.dart';

abstract class Pet{
  static int totalPets = 0;
  String name;
  Pet(this.name){
    totalPets ++;
  }
  void makeSound(); 
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
  Dog.named({required String name}): super.named(name: name); 
    @override
    void makeSound(){
      print(' ${this.name} says : hav hav'); 
  }
  @override
  void beFriendly(){
    print('${this.name} is friendly'); 
  }
}

class Bird extends Pet with Flyable implements Friendly{
  Bird(String name):super(name);
  Bird.named({required String name}): super.named(name: name); 

  @override
  void makeSound(){
    print('${this.name} says:cik cik'); 
  }

  @override
  void beFriendly() {
    print('${this.name} is friendly'); 
  }

}


class Cat extends Pet implements Friendly{
  Cat(String name): super(name);
  Cat.named({required String name}): super.named(name: name);

  @override
  void makeSound(){
    print('${this.name} says:miyaw'); 
  }
  
  @override
  void beFriendly() {
    print('${this.name} is friendly'); 
  }
}


