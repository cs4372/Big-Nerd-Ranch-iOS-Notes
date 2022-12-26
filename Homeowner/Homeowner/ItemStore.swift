//
//  ItemStore.swift
//  Homeowner
//
//  Created by Catherine Shing on 12/26/22.
//

import UIKit

// Swift base class, does not inherit from any other class
class ItemStore {
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    var allItems = [Item]()
    
    //@discard annotation means a caller of this function is free to ignore the result of calling this function.
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        print(newItem)
        return newItem
    }
}
