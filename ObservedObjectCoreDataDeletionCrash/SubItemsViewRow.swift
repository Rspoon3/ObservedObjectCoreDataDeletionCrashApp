//
//  SubItemsViewRow.swift
//  ObservedObjectCoreDataDeletionCrashApp
//
//  Created by Richard Witherspoon on 11/9/21.
//

import SwiftUI


struct SubItemsViewRow: View{
    @ObservedObject var subItem: SubItem
    @Environment(\.managedObjectContext) var moc
    
    var body: some View{
        VStack(alignment: .leading){
            Text(subItem.title)
                .font(.headline)
            Text(subItem.createdAt.formatted())
                .font(.subheadline)
        }
        .onTapGesture {
            subItem.title = Int.random(in: 0..<999999).formatted()
            try! moc.save()
        }
    }
}
