//: Playground - noun: a place where people can play

import UIKit

// TODO: Create an array containing three of your favorite foods or bands or drinks...
var favoriteFoods = ["Pizza", "Sushi", "Poutine"]

// TODO: Append two more elements to the array you created above
favoriteFoods.append("Beer")
favoriteFoods.append("Curry")


// TODO: Print the fourth element of the array
print("\(favoriteFoods[3])")

// TODO: Loop through the array and print each element
for food in favoriteFoods {
    print("\(food)")
}

// TODO: Remove the first element of the array
favoriteFoods.removeFirst()

// TODO: Remove the last element of the array
favoriteFoods.removeLast()

// TODO: Remove the middle element of the array
favoriteFoods.removeAtIndex(favoriteFoods.count/2)

// TODO: Insert an element in the middle of the array
favoriteFoods.insert("An Element", atIndex: favoriteFoods.count/2)

// TODO: Print the count of the array
print("\(favoriteFoods.count)")

// TODO: Remove the remaining elements in the array
favoriteFoods.removeAll();
