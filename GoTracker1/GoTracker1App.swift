//
//  GoTracker1App.swift
//  GoTracker1
//
//  Created by Aydin Metanovic on 12/17/25.
//

import SwiftUI
import Firebase

@main
struct GoTracker1App: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        @State var viewModel: TeamViewModel = TeamViewModel()

        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
