//
//  Matrix.swift
//  Lab
//
//  Created by Macbook Pro on 05/03/2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import Foundation

class Matrix {
    
    var items = [[Item]]()
    var numbers = [Int]()
    
    static let maxNumberOfColumns = 11
    static let maxNumberOfRows = 10
    static let maxAvailableNumber = 100
    
    private func fillNumbers() {
        for number in 0..<Matrix.maxAvailableNumber {
            numbers.append(number)
        }
    }
    
    func getUniqueNumber() -> Int {
        let index = numbers.count.arc4random
        return numbers.remove(at: index)
    }
    
    init(dimension: Int?) {
        self.fillNumbers()
        switch dimension {
        case let dim_1 where dim_1 == 1:
            let columnEnd = Matrix.maxNumberOfColumns.arc4random
            var arr = [Item]()
            for i in 0..<columnEnd {
                let number = self.getUniqueNumber()
                let item = Item(number: number, row: 0, column: i)
                arr.insert(item, at: i)
            }
            items.insert(arr, at: 0)
        case let dim_2 where dim_2 == 2:
            let rowEnd = Matrix.maxNumberOfRows.arc4random
            let columnEnd = Matrix.maxNumberOfColumns.arc4random
            for i in 0..<rowEnd {
                var arr = [Item]()
                for j in 0..<columnEnd {
                    let number = self.getUniqueNumber()
                    let item = Item(number: number, row: i, column: j)
                    arr.insert(item, at: j)
                }
                items.insert(arr, at: i)
            }
        case let dim_3 where dim_3 == 3:
            let rowEnd = Matrix.maxNumberOfRows.arc4random
            for i in 0..<rowEnd {
                var arr = [Item]()
                let columnEnd = Matrix.maxNumberOfColumns.arc4random
                for j in 0..<columnEnd {
                    let number = self.getUniqueNumber()
                    let item = Item(number: number, row: i, column: j)
                    arr.insert(item, at: j)
                }
                items.insert(arr, at: i)
            }
        default: break
        }
    }
    
    public func getMaxItem() -> Item {
        var max = 0
        var defaultItem = Item(number: 0, row: 0, column: 0)
        for rowOfItems in items {
            for item in rowOfItems {
                if item.number > max {
                    max = item.number
                    defaultItem = item
                }
            }
        }
        return defaultItem
    }
    
    public func getMinItem() -> Item {
        var min = 100
        var defaultItem = Item(number: 0, row: 0, column: 0)
        for rowOfItems in items {
            for item in rowOfItems {
                if item.number < min {
                    min = item.number
                    defaultItem = item
                }
            }
        }
        return defaultItem
    }
    
    public func sortByIncrease() {
        for k in 0..<items.count {
            for s in 0..<items[k].count {
                for i in 0..<items.count {
                    for j in 0..<items[i].count {
                        if items[k][s].number < items[i][j].number {
                        
                            let tempRow = items[k][s].row
                            items[k][s].row = items[i][j].row
                            items[i][j].row = tempRow
                            
                            let tempColumn = items[k][s].column
                            items[k][s].column = items[i][j].column
                            items[i][j].column = tempColumn
                        
                            let temp = items[k][s]
                            items[k][s] = items[i][j]
                            items[i][j] = temp
                    
                        }
                    }
                }
            }
        }
    }
    
    public func sortByDecrease() {
        for k in 0..<items.count {
            for s in 0..<items[k].count {
                for i in 0..<items.count {
                    for j in 0..<items[i].count {
                        if items[k][s].number > items[i][j].number {
                            
                            let tempRow = items[k][s].row
                            items[k][s].row = items[i][j].row
                            items[i][j].row = tempRow
                            
                            let tempColumn = items[k][s].column
                            items[k][s].column = items[i][j].column
                            items[i][j].column = tempColumn
                            
                            let temp = items[k][s]
                            items[k][s] = items[i][j]
                            items[i][j] = temp
                            
                        }
                    }
                }
            }
        }
    }
    
    public func getEvenItems() -> [Item] {
        var evenItems = [Item]()
        for arrOfItems in items {
            evenItems.append(contentsOf: arrOfItems.filter { $0.number % 2 == 0 })
        }
        return evenItems
    }
    
    public func getOddItems() -> [Item] {
        var evenItems = [Item]()
        for arrOfItems in items {
            evenItems.append(contentsOf: arrOfItems.filter { $0.number % 2 != 0 })
        }
        return evenItems
    }
    
}

struct Item {
    
    var number: Int
    var row: Int
    var column: Int
    var identifier: Int
    
    static var uniqueidentifier: Int = 0
    static func getUniqueidentifier() {
        uniqueidentifier += 1
    }
    
    init(number: Int, row: Int, column: Int) {
        self.number = number
        self.row = row
        self.column = column
        Item.getUniqueidentifier()
        identifier = Item.uniqueidentifier
    }
    
}


extension Int {
    var arc4random: Int {
        switch self {
        case 1...Int.max:
            var dizeroSelf = 0
            while dizeroSelf == 0 {
                dizeroSelf = Int(arc4random_uniform(UInt32(self)))
            }
            return dizeroSelf
        case -Int.max..<0:
            return -Int(arc4random_uniform(UInt32(abs(self))))
        default:
            return 1
        }
    }
}










