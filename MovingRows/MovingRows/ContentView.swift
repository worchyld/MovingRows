//
//  ContentView.swift
//  MovingRows
//
//  Created by Amarjit on 19/05/2020.
//  Copyright © 2020 Amarjit. All rights reserved.
//

import SwiftUI

struct User : Identifiable {
    let id: UUID = UUID()
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var users = [
        User(firstName: "Tom", lastName: "Thumb"),
        User(firstName: "Alex", lastName: "Riley"),
        User(firstName: "Sarah", lastName: "Connor"),
        User(firstName: "Will", lastName: "Smith"),
        User(firstName: "Anjali", lastName: "Tzlk"),
        User(firstName: "Hans", lastName: "Gruber")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    Text("\(user.firstName) \(user.lastName)")
                }
                .onMove(perform: move)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Move rows")
        }
    }

    func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
