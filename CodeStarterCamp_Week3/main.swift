//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var missKim = Person(name: "yeona", money: 10000)
var misterSong = Person(name: "dongil", money: 5000)
var misterLee = Person(name: "apple", money: 200000)

var menu: Dictionary<Coffee, Int> = [
    Coffee.espresso: 3000,
    Coffee.americano: 4000,
    Coffee.coldBrew: 5000,
    Coffee.cappuccino: 6000
]

var yagomBucks = CoffeeShop(name: "yagomBucks", revenue: 0, menu: menu, brista: [misterLee])

missKim.order(yagomBucks, of: .espresso, by: missKim.name)
missKim.order(yagomBucks, of: .cappuccino, by: missKim.name)
missKim.order(yagomBucks, of: .coldBrew, by: missKim.name)
