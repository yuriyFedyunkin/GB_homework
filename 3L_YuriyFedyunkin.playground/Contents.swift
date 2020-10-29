import UIKit

enum EngineState {
    case started, stopped
}

enum WindowState {
    case opened, closed
}

enum TrunkState {
    case full, empty
}

enum SportBrands: String {
    case sportItaly = "Ferrari"
    case sportGermany = "BMW"
    case sportUsa = "Tesla"
}

enum TruckBrands: String {
    case trkGermany = "MAN"
    case trkSweden = "Volvo"
    case trkRussia = "Zil"
}

struct SportCar {
    let brand: SportBrands
    let releaseDate: Int
    var trunckVolume: Int {
        willSet {
            if (trunkState == .empty) && (trunckVolume > 0) && (newValue < trunckVolume) {
                let space = trunckVolume - newValue
                print("\(brand.rawValue) free trunk space: \(space)")
            }
            else {
                print("ERROR: \(brand.rawValue) is full")
            }
        }
    }
    var engineState: EngineState {
        willSet {
            if newValue == .started {
                print("\(brand.rawValue) engine is on")
            }
            else {
                print("\(brand.rawValue) engine is off")}
            }
    }
    var windowState: WindowState
    var trunkState: TrunkState
    
    mutating func startEngine (state: EngineState) {
        self.engineState = state
    }
    
    mutating func openWindows() {
        guard self.windowState == .closed else { return print("\(brand.rawValue) are already openned") }
        self.windowState = .opened
        print("\(brand.rawValue) Windows are opening")
    }
    
    mutating func trunkUnload(){
        self.trunkState = .empty
        print("All stuff from \(brand.rawValue) has been disharged")
    }
    
    
}

struct Truck {
    let brand: TruckBrands
    let releaseDate: Int
    var bodyVolume: Int {
        willSet {
            if (trunkState == .empty) && (bodyVolume > 0) && (newValue < bodyVolume) {
                let space = bodyVolume - newValue
                print("\(brand.rawValue) free trunk space: \(space)")
            }
            else {
                print("ERROR: \(brand.rawValue) is full")
            }
        }
    }
    var engineState: EngineState {
        willSet {
            if newValue == .started {
                print ("\(brand.rawValue) engine is on")
            }
            else {
                print("\(brand.rawValue) engine is off")
            }
        }
    }
    
    var windowState: WindowState
    var trunkState: TrunkState
    
    mutating func startEngine (state: EngineState) {
        self.engineState = state
    }
    mutating func openWindows () {
        guard self.windowState == .closed else { return print("\(brand.rawValue) are already openned") }
        self.windowState = .opened
        print ("\(brand.rawValue) Windows are openned")
    }
    
    mutating func trunkUnload(){
           self.trunkState = .empty
           print("All stuff from \(brand.rawValue) has been disharged")
       }
}


//MARK:-- Let's try this

var car = SportCar(brand: .sportGermany, releaseDate: 2020, trunckVolume: 100, engineState: .stopped, windowState: .closed, trunkState: .full)

car.openWindows()
car.startEngine(state: .started)
car.trunkUnload()
car.trunckVolume = 40

print("Here is the inforamtion abt SPORT car. Brand: \(car.brand.rawValue), release: \(car.releaseDate), free trunk space: \(car.trunckVolume), engine is \(car.engineState)")


var truck = Truck(brand: .trkSweden, releaseDate: 2018, bodyVolume: 3000, engineState: .stopped, windowState: .opened, trunkState: .empty)
truck.openWindows()
truck.startEngine(state: .started)
truck.bodyVolume = 2800

print("Here is the inforamtion abt TRUCK car. Brand: \(truck.brand.rawValue), release: \(truck.releaseDate), free trunk space: \(truck.bodyVolume), engine is \(truck.engineState)")
