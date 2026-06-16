import UIKit

class BirdCage {
    var birds: [String] = []

    func addBird(_ bird: String) {
        birds.append(bird)
        print("\(bird) entered the cage")
    }
}

struct BirdWatcher {
    let name: String

    func watchBird(_ bird: String) {
        print("\(name) spotted \(bird)")
    }
}

// Main Queue //
DispatchQueue.main.async {
    print("1 Back on the main thread")
}

// Serial Queue (Custom Queue) //
let birdQueue = DispatchQueue(
    label: "com.birds.serialQueue"
)
birdQueue.async { print("\n2 Blue Bird checking in") }
birdQueue.async { print("\n3 Red Bird checking in") }
birdQueue.async { print("\n4 Green Bird checking in (he's throwing up)") }

// Guaranteed order:
// Blue Red Green

// Global Queue //
DispatchQueue.global().async {
    print("5 (Global Queue) Bird migration calculations running")
}

// QoS - UserInteractive //
DispatchQueue.global(
    qos: .userInteractive
).async {
    print("6 (UserInteractive) Bird is about to hit your window. Immediate response required.")
}

// QoS - Utility //
DispatchQueue.global(
    qos: .utility
).async {
    print("7 (Utility) Analyzing yearly bird migration data")
}

// QoS - Default //
DispatchQueue.global(
    qos: .default
).async {
    print("8 (Default) Normal bird business")
}

// QoS - Background //
DispatchQueue.global(
    qos: .background
).async {
    print("9 (Background) Backing up bird records")
}

// QoS - Unspecified //
DispatchQueue.global(
    qos: .unspecified
).async {
    print("10(Unspecified) Bird task with no preference")
}

// Operation Queue //
let operationQueue = OperationQueue()
operationQueue.addOperation { print("11 Counting birds")}
operationQueue.addOperation { print("12 Tagging birds") }
// Operation Queue Dependencies //

let feedBird = BlockOperation {
    print("13 Bird fed")
}

let releaseBird = BlockOperation {
    print("14 Bird released")
}

releaseBird.addDependency(feedBird)

let queue = OperationQueue()

queue.addOperations(
    [feedBird, releaseBird],
    waitUntilFinished: false
)

// Async Await //
// using class gives error
actor BirdService {
    func fetchBirdName() async -> String {

        try? await Task.sleep(
            for: .seconds(2)
        )
        return "15 Blue Jay"
    }
}

let service = BirdService()

Task {
    let bird = await service.fetchBirdName()

    print(bird)
}

// Async Await Multiple Calls //

actor BirdTracker {

    func currentLocation() async -> String {
        try? await Task.sleep(
            for: .seconds(1)
        )
        return "16 Georgia"
    }

    func currentAltitude() async -> Int {
        try? await Task.sleep(
            for: .seconds(1)
        )
        return 1200
    }
}

let tracker = BirdTracker()

Task {

    let location = await tracker.currentLocation()
    let altitude = await tracker.currentAltitude()

    print(location)
    print(altitude)
}

// Async Let //
let tracker2 = BirdTracker()

Task {

    async let location = tracker2.currentLocation()
    async let altitude = tracker2.currentAltitude()

    let resultLocation = await location
    let resultAltitude = await altitude

    print(resultLocation)
    print(resultAltitude)
}

// Tasks //
Task {

    print("17 Bird observation started")

    try? await Task.sleep(
        for: .seconds(2)
    )

    print("18 Bird observation completed")
}
Task {

    print("19 Bird observation started")

    try? await Task.sleep(
        for: .seconds(2)
    )

    print("20 Bird observation completed")
}

// Tasks with Priority //
Task(priority: .high) {

    print("21 Tracking endangered bird")
}

Task(priority: .background) {

    print("22 Archiving old bird reports")
}

// Task Group //

actor BirdDatabase {

    func fetchBird(id: Int) async -> String {

        try? await Task.sleep(
            for: .seconds(1)
        )

        return "Bird \(id)"
    }
}

let database = BirdDatabase()

Task {

    let birds = await withTaskGroup(
        of: String.self,
        returning: [String].self
    ) { group in

        for id in 1...5 {

            group.addTask {
                await database.fetchBird(id: id)
            }
        }

        var results: [String] = []

        for await bird in group {
            results.append(bird)
        }

        return results
    }

    print(birds)
}

// Actors //

actor BirdCounter {

    private var count = 0

    func addBird() {

        count += 1

        print("Bird count: \(count)")
    }

    func getCount() -> Int {
        count
    }
}

let counter = BirdCounter()

Task {

    await counter.addBird()
    await counter.addBird()

    let total = await counter.getCount()

    print(total)
}

// Actor Preventing Race Conditions //

actor Nest {

    private var eggs = 0

    func layEgg() {
        eggs += 1
    }

    func eggCount() -> Int {
        eggs
    }
}

let nest = Nest()

Task {

    await withTaskGroup(of: Void.self) { group in

        for _ in 1...100 {

            group.addTask {
                await nest.layEgg()
            }
        }
    }

    print(await nest.eggCount())
}
