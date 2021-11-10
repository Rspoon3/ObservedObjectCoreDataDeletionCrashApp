//
//  SubItemsView.swift
//  ObservedObjectCoreDataDeletionCrashApp
//
//  Created by Richard Witherspoon on 11/9/21.
//

import SwiftUI
import CoreData


struct SubItemsView: View {
    @FetchRequest var subItems : FetchedResults<SubItem>
    @Environment(\.managedObjectContext) var moc

    init(item: Item){
        let request = SubItem.fetchRequest() as! NSFetchRequest<SubItem>
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "item == %@", item)
        
        _subItems = FetchRequest(fetchRequest: request)
    }
    
    
    var body: some View {
        List(subItems){ item in
            SubItemsViewRow(subItem: item)
                .swipeActions(edge: .trailing){
                    Button(role: .destructive) {
                        moc.delete(item)
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            try! moc.save()
//                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
        }
    }
}
