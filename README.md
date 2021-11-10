When deleting a core data object that is an @ObservedObject in a SwiftUI View, the app will crash because of the "createdAt" date property.


**System Info:**
* Xcode 13.1 (13A1030d)
* iPad Air 4th Generation (iOS 15.0 Simulator)
* iPad Pro 11 (2018, iOS 15.1)


**Reproduction steps:**
1. Run app on iPad in landscape
2. Tap the plus button on the sidebar toolbar to add "Item" data
3. Select the "Item" you just created
4. On the details screen, swipe to delete any of the subItems.


**Actual Results:**
App crashes and directs you to the following line in the SubItemsViewRow file:

"Text(subItem.createdAt.formatted())"


**Expected Results:**
SubItem deletes successfully and the row animates away.


**Individual Work Arounds:**
1. Change the SubItem createdAt property to be optional.
2. Add a delay (< ~0.7 seconds) between the core data deletion and save.