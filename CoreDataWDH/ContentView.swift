//
//  ContentView.swift
//  CoreDataWDH
//
//  Created by Joshua Rück on 21.03.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TaskListView()
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }
            PeopleListView()
                .tabItem {
                    Label("People", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
