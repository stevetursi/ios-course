//: Playground - noun: a place where people can play

class Math {
    
    func add(a: Int, b: Int) -> Int {
        return a+b
    }
    
    func subtract(a: Int, b: Int) -> Int {
        return a-b
    }
    
    func multiply(a: Int, b: Int) -> Int {
        return a*b
    }
    
    func divide(a: Int, b: Int) -> Int {
        return a/b
    }
    


}


let math = Math();

math.add(1,b:2)
math.subtract(1,b:2)
math.multiply(5,b:3)
math.divide(6,b:2)


class Student {
    
    let name: String
    var course: String?{
        
        didSet {
            print ("old value \(oldValue) - new value \(course)")
        }
        
    }
    
    var ffff: Int = {
       return 39
    }()
    
    init(name: String) {
        self.name = name
    }
    
    func foo() -> String? {
        return self.course
    }
    
    
    init(name: String, course: String) {
        
        print(name)
        self.name = name
        self.course = course
    }

    func sayHello() -> String {
        if let course = course {
            return "Hello, my name is \(name) and I am taking \(course)"
        } else {
            return "Hello, my name is \(name) and I am not taking anything"
        }
    }
}

let dan = Student(name: "Dan")
dan.sayHello()

dan.course = "Algebra"

dan.course
dan.foo()


dan.sayHello()

let steve = Student(name: "Steve")
steve.sayHello()

let rufus = Student(name: "Rufus", course: "Calculus")
rufus.sayHello()

