//
//  Checklist.swift
//  Checklists
//
//  Created by Andela Developer on 6/10/15.
//  Copyright (c) 2015 Andela. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    var name: String!
    var items = [ChecklistItem]()
    var iconName: String!
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
        aCoder.encodeObject(iconName, forKey: "IconName")
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        items = aDecoder.decodeObjectForKey("Items") as! [ChecklistItem]
        iconName = aDecoder.decodeObjectForKey("IconName") as! String
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items {
            if !item.checked {
                count += 1
            }
        }
        return count
    }
    
    func sortChecklistItems() {
        items.sort({item1, item2 in return
            item1.dueDate.compare(item2.dueDate) == NSComparisonResult.OrderedAscending
        })
    }
    
    convenience init(name: String) {
        self.init(name: name, iconName: "No Icon")
    }
    
    init(name: String, iconName: String) {
        self.name = name
        self.iconName = iconName
        super.init()
    }
}
