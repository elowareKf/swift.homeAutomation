//
//  Item.swift
//  Home Automation
//
//  Created by Klaus Fischer on 02.12.20.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: Int
    let name: String
    let value: Int
}

struct ItemResult: Codable {
    let names: [String]
    let values: [Int]
    
    func toItems() -> [Item]{
        var result = [Item]()
        for i in 0..<names.count {
            result.append(Item(id: i, name: names[i], value: values[i]))
        }
        return result
    }
}
