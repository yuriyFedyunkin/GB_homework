import UIKit

//Lesson 2 homeWork

//MARK:-- TASK 1
func evenNumber (number: Int) {
    if (number % 2) == 0 {
        print ("\(number) is even number")
    }
    else {
        print ("\(number) is odd number")
    }
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
