import UIKit

//Lesson 2 homeWork

//MARK:-- TASK 1
func evenNumber (number: Int) {
    print("\(number) is \(number % 2 == 0 ? "even":"odd") number")
}
evenNumber(number: 4)
evenNumber(number: 5)

//MARK:-- TASK 2

func divisibleByThree (number: Int) {
    if (number % 3) > 0 {
        print ("\(number) is not multiple of three")
    }
    else {
        print ("\(number) is multiple of three")
    }
}
divisibleByThree(number: 9)
divisibleByThree(number: 5)

//MARK:-- TASK 3

var array = Array (0...100)


//MARK:-- TASK 4

for value in array {
    if (value % 2 == 0 || value % 3 != 0) {
        array.remove(at: array.firstIndex(of: value)!)
    }
}
print (array)

//MARK:-- TASK 5

func fibbonachi (numbersInArray: Int) -> [Int] {
    var arrayOfFib = [Int]()
    var x1: Int = 1, x2: Int = 1, x: Int
    
    for n in 1...numbersInArray {
        
        if n < 3 {
            arrayOfFib.append(1)
        }
        else {
            x = x1 + x2
            x1 = x2
            x2 = x
            arrayOfFib.append(x2)
            }
        }
    return arrayOfFib
}
   
fibbonachi(numbersInArray: 92)

//MARK:-- TASK 6

func prime (number: Int) -> Bool {
    if number < 2 {
        return false
    }
    for i in 2..<number {
        if (number % i) == 0 {
            return false
        }
    }
    return true
}

func primeArray() -> [Int] {
    var result = [Int]()
    var p = 2
    
    while result.count < 100 {
        if prime(number: p) {
              result.append(p)
        }
         p += 1
    }
    return result
}

primeArray()
