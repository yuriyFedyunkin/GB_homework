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

var array = [Int]()
for i in 0...99 {
    array.append(i)
}

//MARK:-- TASK 4

for value in array {
    if (value % 2 == 0 || value % 3 != 0) {
        array.remove(at: array.firstIndex(of: value)!)
    }
}
print (array)

//MARK:-- TASK 5

func fibArray (fibNumber: Int) -> Array<Decimal> {
    var arrayOfFib = [Decimal]()

    func fibbonachi (_ n: Int) -> Decimal {
        if (n < 3) {
            return 1
        }
        else {
            var x1: Decimal = 1, x2: Decimal = 1, x: Decimal
            for _ in 3...n {
                x = x1 + x2
                x1 = x2
                x2 = x
            }
            return x2
        }
    }
    for i in 1...fibNumber {
        arrayOfFib.append(fibbonachi(i))
    }
    return arrayOfFib
}
//print (fibArray(fibNumber: 100))


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
