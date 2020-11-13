import UIKit

protocol Car: AnyObject, CustomStringConvertible {
    var engineStarted: Bool { get set }
    var windowClosed: Bool { get set}
    var release: Int { get }
    var model: String { get }
    
    func toDrive()
}

extension Car {

    func handleEngine()  {
        engineStarted.toggle()
        engineStarted ? print ("Двигатель запущен") : print ("Двигатель заглушен")
    }
    func handleWindow() {
        windowClosed.toggle()
        !windowClosed ? print ("Окно открыто") : print ("Окно закрыто")
    }
    
    func parking(){
        engineStarted = false
        windowClosed = true
        print("Машина припаркована. Двигатель заглушен, окна закрыты")
    }
}

class SportCar: Car {
    
    var engineStarted = false
    var windowClosed = true
    let model: String
    var release: Int
    
    private var nitroBoost = false
    var description: String {
        return "Машина марки: \(model), \(release) года выпуска. Это спортивный автомобиль и может ехать с ускорением"
    }
    
    func boostModeHandle() {
        nitroBoost.toggle()
        nitroBoost ? print ("Ускорение активировано") : print ("Ускорение выключено")
    }
    
    func toDrive() {
        guard engineStarted == true else { return print("Сначала заведите двигатель!") }
        nitroBoost ? print("Машина едет в спортивном режиме") : print("Машина едет в спокойном режиме")
    }
    
    init(model: String, release: Int) {
        self.model = model
        self.release = release
    }
}

class TruckCar: Car {
    var engineStarted = false
    var windowClosed = true
    let model: String
    var release: Int
    
    private var truckIsFull: Bool
    var cargoInTruck: Int = 0
    let maxCargoVolume: Int
    
    var description: String {
        return "Машина марки: \(model), \(release) года выпуска. Это грузовой автомобиль. Он может перевозить различный груз и вмещает \(maxCargoVolume) куб м"
    }
    
    init(model: String, release: Int, maxCargoVolume: Int, truckIsFull: Bool) {
        self.model = model
        self.release = release
        self.maxCargoVolume = maxCargoVolume
        self.truckIsFull = false
    }
    
    
    func toDrive() {
        guard engineStarted == true else { return print("Сначала заведите двигатель!") }
        print("Грузовик едет")
    }

    func loadCargo(cargoVolume: Int){
        if (cargoVolume <= maxCargoVolume) && (cargoVolume + cargoInTruck <= maxCargoVolume) && !truckIsFull {
            self.cargoInTruck += cargoVolume
            print("Погружено \(cargoVolume) куб м. В грузовике сейчас свободно \(maxCargoVolume - cargoInTruck) куб м груза")
        } else if truckIsFull {
            print ("Грузовик полон. Разгрузите.")
        }
        else {
            let overweight = cargoVolume - maxCargoVolume
            cargoInTruck = maxCargoVolume
            truckIsFull = true
            print("ВНИМАНИЕ: Мало места! Грузовик полон, в кузове \(cargoInTruck) куб м. Не влезло \(overweight) куб м")
        }
    }
    
    func trunkUnload(){
        truckIsFull = false
        cargoInTruck = 0
        print("Весь груз выгружен")
    }
}


var car = SportCar(model: "BMW", release: 2019)
print(car)
car.handleEngine()
car.toDrive()
car.boostModeHandle()
car.toDrive()
car.handleWindow()
car.parking()


var truck = TruckCar(model: "MAN", release: 2015, maxCargoVolume: 300, truckIsFull: false)
print(truck)
truck.loadCargo(cargoVolume: 305)
truck.cargoInTruck
truck.loadCargo(cargoVolume: 5)
truck.engineStarted
truck.trunkUnload()
truck.loadCargo(cargoVolume: 5)

