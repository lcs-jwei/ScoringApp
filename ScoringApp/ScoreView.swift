//
//  ScoreView.swift
//  ScoringApp
//
//  Created by Justin Zack Wei on 2023-11-02.
//

import SwiftUI

struct ScoreView: View {
    //MARK: Stored Properties
    @State var teamOne = ""
    @State var teamTwo = ""
    var body: some View {
        ZStack{
            VStack{
                Text("SCORE")
                    .font(.custom("Avenir Next", size: 70))
                Spacer()
            }
            VStack {
                HStack{
                    Text("Team 1:")
                        .font(.custom("Avenir Next", size: 40))
                    
                    TextField("name", text: $teamOne)
                        .font(.custom("Avenir Next", size: 40))
                    
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 120)
                    Spacer()
                }
                .padding()
                HStack{
                    Text("Team 2:")
                        .font(.custom("Avenir Next", size: 40))
                    
                    TextField("name", text: $teamTwo)
                        .font(.custom("Avenir Next", size: 40))
                    
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 120)
                    Spacer()
                }
                .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    ScoreView()
}
