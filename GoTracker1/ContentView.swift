//
//  ContentView.swift
//  GoTracker1
//
//  Created by Aydin Metanovic on 12/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("school")
            .resizable()
            .scaledToFit()
            .frame(width: 250)
        
        
        
        
        NavigationStack{
        
                VStack{
                    
                
            
                
                    Text("Firebase")
                    Color.red
                    
                
                Text("Hersey Go Tracker")
                        .foregroundStyle(.brown)
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
            
                    
                    
                    
                
                
                

                
                
        }
       
           
        }
        .bold()
        .padding()
    }
}

#Preview {
    ContentView()
}
