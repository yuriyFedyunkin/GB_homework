import UIKit

enum Actions {
    case sportCarActions
    case truckAtctions
}

enum TrunkState: String {
    case full = "Is full"
    case empty = "Has a space"
}

class Car {
    var fuelLevel: Int
    let horsePower: Int
    let releaseDate: Int
    
    func handle (action: Actions) {}
    
    init(fuelLevel: Int, releaseDate: Int, horsePower: Int) {
        self.fuelLevel = fuelLevel
        self.releaseDate = releaseDate
        self.horsePower = horsePower
    }
}

class SportCar: Car {
    var cabrio: Bool
    var nitroBoost: Bool
    
    init(cabrio: Bool, nitroBoost: Bool, fuelLevel: Int, releaseDate: Int, horsePower: Int) {
        self.cabrio = cabrio
        self.nitroBoost = nitroBoost
        
        super.init(fuelLevel: fuelLevel, releaseDate: releaseDate, horsePower: horsePower)
    }
    
    func howOldIsCar() {
        let age = 2020 - self.releaseDate
        guard age > 0 else {return print ("This sport car is brand new")}
        print ("This sport car is \(age) years old")
    }
    
    override func handle(action: Actions) {
        guard action == .sportCarActions else { return }
        print ("This sport car fast as HELL. It has \(horsePower) HP. Fuel level is \(fuelLevel) liters at the moment")
        howOldIsCar()
    }
}

class Truck: Car {
    private var trunkState: TrunkState
    var trunckVolume: Int {
        willSet {
            if (trunkState == .empty) && (trunckVolume > 0) && (newValue < trunckVolume) {
                let space = trunckVolume - newValue
                print("Truck free trunk space: \(space)")
            }
            else {
                print("ERROR: Truck is full")
            }
        }
    }
    
    init(trunkState: TrunkState, trunkVolume: Int, fuelLevel: Int, releaseDate: Int, horsePower: Int) {
        self.trunkState = trunkState
        self.trunckVolume = trunkVolume
        
        super .init(fuelLevel: fuelLevel, releaseDate: releaseDate, horsePower: horsePower)
    }
    
    func trunkUnload(){
        trunkState = .empty
        print("All cargo has been discharged")
    }
    
    override func handle(action: Actions) {
        guard action == .truckAtctions else { return }
        print("This is really good truck. \(trunkState.rawValue) at the moment. Fuel level: \(fuelLevel) liters")
    }
    
}

var car1 = SportCar(cabrio: true, nitroBoost: true, fuelLevel: 100, releaseDate: 2010, horsePower: 150)
car1.handle(action: .sportCarActions)

var car2 = SportCar(cabrio: false, nitroBoost: false, fuelLevel: 50, releaseDate: 2019, horsePower: 100)
car2.howOldIsCar()

var truck = Truck(trunkState: .full, trunkVolume: 200, fuelLevel: 100, releaseDate: 2019, horsePower: 100)
truck.handle(action: .truckAtctions)
truck.trunkUnload()
truck.handle(action: .truckAtctions)
truck.fuelLevel = 200
print ("After gas station truck has \(truck.fuelLevel) liters to go!")

var truck2 = Truck(trunkState: .empty, trunkVolume: 500, fuelLevel: 300, releaseDate: 2015, horsePower: 90)
truck2.fuelLevel = 150
truck2.handle(action: .truckAtctions)

