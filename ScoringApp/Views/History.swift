//
//  History.swift
//  ScoringApp
//
//  Created by Justin Zack Wei on 2023-11-13.
//

import Foundation

struct History {
    var nameOne: String
    var nameTwo: String
    var scoreOne: Int
    var scoreTwo: Int
}

class HistoryList{
    
    private var historyList:[History] = []
    
    func addHistory(history:History){
        self.historyList.append(history)
    }
    
    func getAllHistories()->[History]{
        return self.historyList
    }
    
    
}

