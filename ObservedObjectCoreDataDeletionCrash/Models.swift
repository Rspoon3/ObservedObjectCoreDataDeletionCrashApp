//
//  Models.swift
//  ObservedObjectCoreDataDeletionCrashApp
//
//  Created by Richard Witherspoon on 11/9/21.
//

import Foundation
import CoreData


@objc(Item)
public class Item : NSManagedObject, Identifiable {
    @NSManaged public var title: String
    @NSManaged public var timestamp: Date
    @NSManaged public var subItems: Set<SubItem>
}



@objc(SubItem)
public class SubItem : NSManagedObject, Identifiable {
    @NSManaged public var title: String
    @NSManaged public var createdAt: Date
    @NSManaged public var item: Item
}
