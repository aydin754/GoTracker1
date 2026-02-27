//
//  Guest.swift
//  GoTracker1
//
//  Created by Aydin Metanovic on 12/17/25.
//
import SwiftUI
struct Guest: View {
    var body: some View {
        ZStack{
            // this code is for the custom color
            LinearGradient(
                colors: [
                    Color.black,
                    Color.orange.opacity(0.2),
                    Color.black
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            
            
            
            Text("")
                .navigationBarTitle("Guest")
            
            NavigationLink("->") {
                PlayerListView()
            }
        }
    }
    
}
