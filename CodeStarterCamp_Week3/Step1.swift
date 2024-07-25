class Person {
    var name: String
    var age: Int
    var gender: String
    var money: Int {
        didSet {
            print("\(name)의 잔액: \(oldValue)원 -> \(money)원")
        }
    }
    
    
    func buyCoffee(from: CoffeeShop, to: Coffee) {
        let cafeName = from.name
        if money >= to.discription {
            print("\(name)(이)가 \(cafeName)에서 \(to)(을)를 주문합니다.")
            money -= to.discription
            
            from.makeCoffee(make: to, customer: name)
            // 잔액이 충분한 경우 coffeeShop에 order를 전달
        } else {
            print("잔액이 부족하여 주문을 할 수 없습니다.(현재 잔액: \(money)원, 부족한 잔액: \(to.discription - money)원)")
        }
    }
    
    init(name: String, age: Int, gender: String, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.money = money
    }
}
// 사람의 이름, 나이, 성별, 재산 설정
// 사람이 할 수 있는 일: 카페에서 커피 구매하기

class CoffeeShop {
    var name: String
    var barista: String {
        didSet {
            print("\(name)의 바리스타가 \(oldValue)에서 \(barista)(으)로 변경되었습니다.")
        }
    }
    var sales: Int
    var menu: [Coffee] = [.Americano, .Cafelatte, .Espresso, .Frappe, .Macchiato]
    var pickUpTable: [Coffee] = []
    
    func makeCoffee(make: Coffee, customer: String) {
        print("\(barista)(이)가 \(customer)(이)가 주문한 \(make)(을)를 만듭니다.")
        sales += make.discription
        
        pickUpTable.append(make)
        if let order = pickUpTable.last {
            print("현재 주문목록: \(order)")
        }
        
        if pickUpTable.count != 0 {
            print("주문하신 \(make) 나왔습니다!")
        }
    }
    
    init(name: String, barista: String, sales: Int) {
        self.name = name
        self.barista = barista
        self.sales = sales
    }
}
// 커피숍의 이름, 바리스타, 매출 설정
// 커피숍이 할 수 있는 일: 커피를 만들어 고객에게 판매하기

enum Coffee: Int {
    case Americano
    case Cafelatte
    case Espresso
    case Macchiato
    case Frappe
    
    var discription: Int {
        switch self {
        case .Americano:
            return 2500
        case .Cafelatte:
            return 3000
        case .Espresso:
            return 2000
        case .Frappe:
            return 4500
        case .Macchiato:
            return 5000
        }
    }
}
// 커피숍의 메뉴와 가격

func todaysCalculate(_ of: CoffeeShop) {
    var calculateCoffee: String = String()
    for calculate in of.pickUpTable {
        calculateCoffee.insert(contentsOf: "\(calculate), ", at: calculateCoffee.endIndex)
    }
    calculateCoffee.removeLast()
    calculateCoffee.removeLast()
  
    print(
        """
        
        \(String(repeating: "&", count: 65))
        <오늘의 주문 목록>
        \(calculateCoffee)
        
        오늘의 수익: \(of.sales) 원
        \(String(repeating: "&", count: 65))
        """
    )
}
// 커피숍의 하루 매출을 확인하는 함수

