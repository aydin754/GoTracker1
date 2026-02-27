//
//  Admin.swift
//  GoTracker1
//
//  Created by Aydin Metanovic on 12/17/25.
//
import SwiftUI
struct Admin: View {
    var body: some View {
        NavigationStack{
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
                
                
                
                
                
                
                
                VStack{
                    NavigationLink("+ Search For Bluetooth"){
                        searchForBLView()
                            .position(x:180,y:100)
                        
                        
                        
                        Text("")
                    }
                    
                    
                    
                }
                
                
            }
            .navigationTitle("Admin")
        }
    }
}
    #Preview{
        Admin()
    }

