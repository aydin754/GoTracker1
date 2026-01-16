//
//  TeamViewModel.swift
//  GoTracker1
//
//  Created by Veer Patel on 1/8/26.
//
import SwiftUI
import FirebaseFirestore

@Observable class TeamViewModel {
    var teams: [Team] = []
    let database = Firestore.firestore().collection("teams")
    
    func addTeam(nameOfTeam: String, nameOfPlayer: String, numberOfPlayer: String, positionOfPlayer: String ) {
        database.document(nameOfTeam).setData(["teamName": nameOfTeam,"player": nameOfPlayer, "playerNumber": numberOfPlayer, "playerPosition": positionOfPlayer ])
    }
    func pullFromDatabase() {
        let database = Firestore.firestore().collection("teams")
        database.addSnapshotListener { querySnapshot, error in
            if let quertySnapshot = querySnapshot {
                var downloadedTeams: [Team] = []
                for document in quertySnapshot.documents {
                    let nameOfTeam = document["teamName"] as! String
                    let nameOfPlayer = document["player"] as! String
                    let numberOfPlayer = document["playerNumber"] as! String
                    let positionOfPlayer = document["playerPosition"] as! String
                    
                    let newTeam = Team(teamName: nameOfTeam, player: nameOfPlayer, playerNumber: numberOfPlayer, playerPosition: positionOfPlayer)
                    downloadedTeams.append(newTeam)
                }
            }
        }
    }
    
    
}
