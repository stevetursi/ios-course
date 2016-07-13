//: Playground - noun: a place where people can play

import UIKit

// TODO: Create a dictionary that maps an english word with its translation is some other language (make this up to save time if you don't speak another language) Start with three words
var lang = ["Hello": "Hola", "Goodbye": "Adios", "Beer":"Cerveza"]

// TODO: Insert two more word mappings
lang["Steve"] = "Esteban"
lang["Joe"] = "Jose"

// TODO: Access a word that exists in the dictionary and print its value
print("\(lang["Steve"]!)")


// TODO: Access a word that does not exist in the dictionary and see how to deal with this scenario
let foo = lang["gibberish"]
if let foo = foo {
    print("it exists")
} else {
    print ("it's null")
}

// TODO: Loop through the contents on the dictionary and print them (hint: use a tuple)
for (key, val) in lang {
    print("\(key) - \(val)")
}

// TODO: Remove a word that exists in the dictionary
lang["Joe"] = nil

// TODO: Print the count of the dictionary
print("\(lang.count)")

// TODO: Remove all the elements from the dictionary
lang.removeAll()