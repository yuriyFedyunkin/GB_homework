import UIKit

protocol HeroOfGame: CustomStringConvertible {
    var damage: Int { get set }
    var health: Int { get set }
    var name: String { get }
}

struct Queue<T: HeroOfGame> {
    private var heroes: [T] = []
    
    subscript (index: Int) -> Int? {
        guard heroes.count > 0, index >= 0, index <= heroes.count else { return nil }
        return heroes[index].health
    }
    
    mutating func pop() -> T? {
        guard heroes.count > 0 else { return nil }
        return heroes.removeFirst()
    }
    
    mutating func push (hero: T) {
        heroes.append(hero)
    }
    
    func printName() {
        self.heroes.forEach{ print($0.name) }
    }
    
    func calculateTotalDamage() -> Int {
        var totalDamage = 0
        heroes.forEach{ totalDamage += $0.damage }
        return totalDamage
    }
    
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in heroes {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

class Mage: HeroOfGame {
    var damage: Int
    var health: Int
    let name: String
    
    var description : String {
        return "Mage name: \(name)"
    }
    
    init(damage: Int, health: Int, name: String) {
        self.damage = damage
        self.health = health
        self.name = name
    }
}

class Warrior: HeroOfGame {
    var damage: Int
    var health: Int
    let name: String
    
    var description : String {
        return "Warrior name: \(name)"
    }
    
    init(damage: Int, health: Int, name: String) {
        self.damage = damage
        self.health = health
        self.name = name
    }
}

let mage1 = Mage(damage: 5, health: 5, name: "mage1")
let mage2 = Mage(damage: 10, health: 7, name: "mage2")
let mage3 = Mage(damage: 15, health: 9, name: "mage3")
let mage4 = Mage(damage: 11, health: 15, name: "mage4")
let mage5 = Mage(damage: 8, health: 11, name: "mage5")

var array = [mage1, mage2, mage3, mage4, mage5]
var armyOfMages = Queue<Mage>()
array.forEach { armyOfMages.push(hero: $0)}
print(armyOfMages)
armyOfMages.pop()
print(armyOfMages)
armyOfMages.calculateTotalDamage()

let strongestMages = armyOfMages.myFilter(predicate: {$0.damage > 9})
print(strongestMages)

armyOfMages[0] // 7
armyOfMages[6] // nil


let warrior1 = Warrior(damage: 5, health: 5, name: "warrior1")
let warrior2 = Warrior(damage: 10, health: 7, name: "warrior2")
let warrior3 = Warrior(damage: 15, health: 9, name: "warrior3")
let warrior4 = Warrior(damage: 11, health: 15, name: "warrior4")
let warrior5 = Warrior(damage: 8, health: 11, name: "warrior5")

var armyOfWars = Queue<Warrior>()
armyOfWars.push(hero: warrior1)
armyOfWars.push(hero: warrior2)
armyOfWars.push(hero: warrior3)
armyOfWars.push(hero: warrior4)
armyOfWars.push(hero: warrior5)
armyOfWars.calculateTotalDamage()
