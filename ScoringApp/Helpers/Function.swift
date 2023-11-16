//
//  Function.swift
//  ScoringApp
//
//  Created by Justin Zack Wei on 2023-11-15.
//

import Foundation

func filtering(originalHistory: [History], on desiredTeamName: String) -> [History] {
    if desiredTeamName.isEmpty{
        return originalHistory
    }
    var filteredHistory: [History] = []
    
    for i in originalHistory{
        if (i.nameOne.lowercased().contains(desiredTeamName.lowercased()) || i.nameTwo.lowercased().contains(desiredTeamName.lowercased())){
            filteredHistory.append(i)
        }
        
    }
    return filteredHistory
}
