//
//  PlayerListView.swift
//  GoTracker1
//
//  Created by Veer Patel on 1/16/26.
//
import SwiftUI
struct PlayerListView: View {
    var body: some View {
        Text("")
        .navigationBarTitle("Player List")
        
        NavigationLink("->") {
            Field()
        }
    }
}

#Preview {
    PlayerListView()
}
