//
//  ContentView.swift
//  GoTracker1
//
//  Created by Aydin Metanovic on 12/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
            
            
            ZStack{
                // this code is for the custom color on the homepage black with orange
                LinearGradient(
                    colors: [
                        Color.black,
                        Color.orange.opacity(0.9),
                        Color.black
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                
                
                
                
                
                
                
                
                VStack{
                    
                    Image("school")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .opacity(0.9)
                    
                    
                    
                    
                    
                    Text("Hersey Go Tracker")
                        .font(.largeTitle)
                    
                        .foregroundColor(.white)
                        .position(x: 180, y: 10)
                    
                    NavigationLink("Administrator"){
                        Admin()
                            .position(x:180, y: 40)
                        
                    }
                    .font(.title)
                    .foregroundColor(.orange)
                    
                    NavigationLink("Guest page"){
                        Guest()
                    }
                    .font(.title)
                    .foregroundColor(.orange)
                    
                    
                    
                    
                    
                    
                    
                    .bold()
                    .padding()
                    
                    
                }
                
                
            }
            
        }
    }
}
#Preview {
    ContentView()
}

