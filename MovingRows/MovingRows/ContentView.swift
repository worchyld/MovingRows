//
//  ContentView.swift
//  MovingRows
//
//  Created by Amarjit on 19/05/2020.
//  Copyright © 2020 Amarjit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var items = ["Item #1", "Item #2", "Item #3", "Item #4"]


    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
//                .onDelete(perform: { (offset: IndexSet) in
//                    guard let firstIndexSet = offset.first else {
//                        return
//                    }
//                    self.items.remove(at: firstIndexSet)
//                })
                .onMove { (indexSet, offset) in
                    self.items.move(fromOffsets: indexSet, toOffset: offset)
                }
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Move rows")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
