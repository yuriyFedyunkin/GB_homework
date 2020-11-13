import Foundation

enum BankCardErrors: Error {
    case frozenBalance
    case notEnoughFunds (fundsNeeded: Int)
}

extension BankCardErrors: CustomStringConvertible {
    var description: String {
        switch self {
        case .notEnoughFunds (let fundsNeeded): return "Недостаточно средств на карте. Вам не хватает \(fundsNeeded) рублей"
        case .frozenBalance: return "Ваш счет заблокирован. Обратитесь в банк"
        }
    }
}

struct Product {
    let price: Int
    let name: String
}

class DebitCard: CustomStringConvertible {
    private var cardIsBlocked = false
    private var balance = 0
    var description: String {
        return !cardIsBlocked ? "Балнс: \(balance) рублей. Карта готова к использванию" : "Балнс: \(balance) рублей. Карта ЗАБЛОКИРОВАНА, обратитесь в банк"
    }
    
    func toBuy(product: Product) throws {
        guard !cardIsBlocked else { throw BankCardErrors.frozenBalance }
        guard product.price <= balance else { throw BankCardErrors.notEnoughFunds(fundsNeeded: product.price - balance) }
        
        balance -= product.price
        print("Вы усешно купили \(product.name). Остаток на счету: \(balance) рублей")
    }
    
    func depositMoney (sumToDeposit: Int) throws {
        guard !cardIsBlocked else { throw BankCardErrors.frozenBalance }
        balance += sumToDeposit
        print("Баланс пополнен. На счету: \(balance)")
    }
    
    func cardBlock(cardIsBlocked: Bool){
        switch cardIsBlocked {
        case true:
            self.cardIsBlocked = true
            print("Карта заблокирована")
        case false:
            self.cardIsBlocked = false
            print("Карта готова к использованию")
        }
    }
}

// MARK:--

let myCard = DebitCard()
let theNewIphone = Product(price: 80000, name: "iPhone 12")
let newPhoneCase = Product(price: 5000, name: "Чехол для iPhone")

do {
    try myCard.toBuy(product: theNewIphone)
} catch {
    let error = error as! BankCardErrors
    print(error)
}

do {
    try myCard.depositMoney(sumToDeposit: 100000)
} catch {
    let error = error as! BankCardErrors
    print(error)
}

do {
    try myCard.toBuy(product: theNewIphone)
} catch {
    let error = error as! BankCardErrors
    print(error)
}

myCard.cardBlock(cardIsBlocked: true)

do {
    try myCard.toBuy(product: newPhoneCase)
} catch {
    let error = error as! BankCardErrors
    print(error)
}
