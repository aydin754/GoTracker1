//
//  ContentView.swift
//  GoTracker1
//
//  Created by Aydin Metanovic on 12/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "jhhs")
            .resizable()
            .scaledToFit()
            .frame(width: 240 , height: 240)
            .padding()
        NavigationStack{
            VStack{
                
                    
                    
                
                Text("Hersey Go Tracker")
                    .position(x: 180, y: 10)
                
                NavigationLink("Administrator"){
                    Admin()
                        .position(x:180, y: 40)
                }
                    
                NavigationLink("Guest page"){
                    Guest()
                }
                
            
                    
                    
                    
                
                
                

                
                
        }
       
           
        }
        .bold()
        .padding()
    }
}

#Preview {
    ContentView()
}
