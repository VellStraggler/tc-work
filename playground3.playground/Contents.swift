import UIKit

// Protocols (Protocols composition, inheritance, POP) //
// Extensions too

protocol Animal {
    func move()
    func eat()
}
protocol CrimeBoss {
    var bodies: Int { get }
    mutating func conductBusiness(howMuch: Int)
}

struct Bird: Animal, CrimeBoss {
    var bodies = 0
    func move() {
        print("We don't just move, we FLY")
    }
    func eat() {
        print("AH YES THE WIRMS, OMNOMNOMNMOMNOM")
    }
    mutating func conductBusiness(howMuch: Int) {
        bodies += howMuch
        if(bodies-howMuch == 0) {
            print("I have started a new, different kind of business today. with \(howMuch) customers already...")
        } else {
            
            print("Business has been conducted. Dug \(howMuch) new holes today. Man I love holes, thats \(bodies) in total!")
        }
    }
}
var bird = Bird()
bird.move()
bird.conductBusiness(howMuch: 2)
bird.conductBusiness(howMuch: 37)

protocol Pet: Animal {
    func play()
}

struct Dog: Pet {
    func eat() {
        print("Literal food rocks. He's just eating rocks.")
    }
    func move() {
        print("He's a runnuh he a track stahh")
    }

    func play() {
        print("He gon getcha")
    }
}

let dog = Dog()
dog.eat()
dog.play()

extension Animal {
    func greet() {
        print("This animal says hello")
    }
}

dog.greet()


// Enums (raw values, associated values) //

enum Direction: String {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
}

print(Direction.north.rawValue)

enum NetworkResponse {
    case success(Int)
    case failure(String)
}

let response = NetworkResponse.success(200)

switch response {
case .success(let message):
    print(message)

case .failure(let error):
    print(error)
}

// Generics //

func sPrint<T>(item: T) {
    print(" \(item) ")
}
struct ContainerStruct<T> {
    var availableContents: T?
    private var contents: T
    init(contents: T) {
        self.contents = contents
        lock()
        print("This was much faster because this container is a struct")
    }
    
    mutating func unlock() {
        print("unlocking contents")
        availableContents = contents
    }
    mutating func lock() {
        availableContents = nil
    }
    func peak() {
        if(availableContents != nil) {
            print("\(availableContents!) from a Container Struct")
        } else {
            print("No peaking!")
        }
    }
}
class Container<T> {
    // this is important for retain cycle section
    
    var availableContents: T?
    private var contents: T
    var soulmateContainer: Container<T>?
    
    init(contents: T) {
        self.contents = contents
        lock()
        print("Creating this box was not as fast as creating the struct version!")
    }
    deinit {
        print("You just destroyed a container full of treasure! It had \(contents)")
    }
    
    func unlock() {
        print("unlocking contents...")
        availableContents = contents
    }
    func lock() {
        availableContents = nil
    }
    func peak() {
        if(availableContents != nil) {
            print("\(availableContents!) from a Container Class")
        } else {
            print("No peaking!")
        }
    }
}

var treasure = "10k in gold and jewels"
var box = ContainerStruct(contents:treasure)
var box2: Container? = Container(contents:treasure)
box.peak()
box.unlock()
box.peak()
box2!.unlock()
box2!.peak()


// Higher Order Functions //

let startingBird = Bird(bodies:0)
let birds = [startingBird, startingBird, startingBird,startingBird,startingBird]

var i = 0.0
@MainActor
func giveAnAmt() -> Int {
    i += 1.4
    return Int(i)
}
let killerBirds = birds.map { Bird(bodies:$0.bodies + giveAnAmt()) }

print(killerBirds)

let legitBirds = killerBirds.filter { $0.bodies >= 3 }

print(legitBirds)
let massOfBird = Bird(bodies: (legitBirds.map {$0.bodies}.reduce(0, +)))

print("mass of bird has legit killed \(massOfBird.bodies) people")

let mysteryNumbers = ["1", "2", "three", "4", "still only counts as 1"]

let actualNumbers = mysteryNumbers.compactMap {
    Int($0)
}

print(actualNumbers)


let birdLoot = [
    ["stick", "worm"],
    ["human kid"],
    ["Bank of America"]
]

let everything = birdLoot.flatMap { $0 }

for pair in zip(killerBirds, everything) {
    print("\(pair.0) found a \(pair.1)")
}



// Error Handling //

enum MicrowaveError: Error {
  case noFood
  case kidDetected
}

func microwave(food: String?) throws {

  guard let food = food else {
      throw MicrowaveError.noFood
  }

  if food.contains("kid") {
      if !food.contains("salt") {
          throw MicrowaveError.kidDetected
      }
  }

  print("Microwaving a \(food)")
}

for thing in everything {
    do {
        try microwave(food: thing)
    }
    catch MicrowaveError.kidDetected {
        print("BRO, you gotta season him, we birds have standards")
    }
}
let kid = everything[2] + " with salt"
do {
    try microwave(food: kid)
}

// ARC Basics //
// Retain Cycles With Closures //
  
box2 = nil
var box3: Container? = Container(contents: "20 bucks")
var box4: Container? = Container(contents: "marble collection")
box4!.soulmateContainer = box3
box3 = nil
print("Box 3 is clearly still alive")
box4 = nil
print("Great, now all our progress is lost in the void...")

