import UIKit

// Task 1
func quadraticEquation(a: Double, b: Double, c: Double) {
    var x1 = Double()
    var x2 = Double()
    let discr = b * b - 4 * a * c
    if discr > 0 {
        x1 = (-b + sqrt(discr)) / (2 * a)
        x2 = (-b - sqrt(discr)) / (2 * a)
        print ("TASK 1: x1 = \(x1) and x2 = \(x2)")
    }
    else if discr == 0 {
        x1 = (-b + sqrt(discr)) / (2 * a)
        print ("TASK 1: x1 = \(x1)")
    }
    else if discr < 0 {
        print ("TASK 1: The equation has no solution")
    }
}

quadraticEquation(a: 16, b: -8, c: 1)

// Task 2

func rightTriangle (cathenusOne: Double, cathenusTwo: Double) {
    let square = (cathenusOne * cathenusTwo) / 2
    let hypotenuse = sqrt((cathenusOne * cathenusOne) + (cathenusTwo * cathenusTwo))
    let perimentr = cathenusOne + cathenusTwo + hypotenuse
    
    print("TASK 2: Square = \(square), Hypotenuse = \(hypotenuse), Perimentr = \(perimentr)")
}

rightTriangle(cathenusOne: 3, cathenusTwo: 4)

// Task 3

func bankDeposit (deposit: Double, percent: Double, years: Int) {
    var deposit = deposit
    
    for _ in 1...years {
        deposit += (deposit * percent / 100)
    }
    print ("Task 3: \(deposit)")
}

bankDeposit(deposit: 5000, percent: 10, years: 5)


