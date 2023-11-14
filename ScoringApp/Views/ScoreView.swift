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
    @State var pointsOne = 0
    @State var pointsTwo = 0
    @State var historyResult: [History] = []
    var body: some View {
        HStack {
            VStack{
                    //title of the view
                    ZStack{
                        HStack{
                            Text("SCORE")
                                .padding()
                                .font(.custom("Avenir Next", size: 70))
                            
                            
                            Spacer()
                        }
                        Text("\(pointsOne) - \(pointsTwo)")
                            .font(.custom("Avenir Next", size: 90))
                            .foregroundColor(.black)
                            .padding()
                            .border(Color.black)
                    }
                        VStack {
                            //versus display of names of team 1 and team 2
                            HStack{
                               
                                    Text("\(teamOne)")
                                        .font(.custom("Avenir Next", size: 60))
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                                    
                                
                                Image("VS")
                                Text("\(teamTwo)")
                                    .font(.custom("Avenir Next", size: 60))
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                                
                            }
                            HStack{
                                //buttons to add score
                                Button(action: {
                                    pointsOne+=1
                                }) {
                                    Text("point")
                                        .font(.custom("Avenir Next", size: 40))
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.green)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                }
                                .padding(.trailing, 200)
                                Button(action: {
                                    pointsTwo+=1
                                }) {
                                    Text("point")
                                        .font(.custom("Avenir Next", size: 40))
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.green)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                }
                            }
                        Spacer()
                    }
                    Spacer()
            }
            //HistoryView
            VStack{
                
                List(historyResult,id:\.id) { history in
                    
                    VStack{
                        Text("Name one: \(history.nameOne)")
                        Text("Name two: \(history.nameTwo)")
                        Text("Score one \(history.scoreOne)")
                        Text("Score two \(history.scoreTwo)")
                        
                    }
                    
                }
            }
        }
          
        
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    //input names of team 1 and team two
                    HStack{
                        Text("Team 1:")
                            .font(.custom("Avenir Next", size: 40))
                        
                        TextField("name", text: $teamOne)
                            .font(.custom("Avenir Next", size: 40))
                        
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 150)
                        
                    }
                    .padding()
                    HStack{
                        Text("Team 2:")
                            .font(.custom("Avenir Next", size: 40))
                        
                        TextField("name", text: $teamTwo)
                            .font(.custom("Avenir Next", size: 40))
                        
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 150)
                        
                    }
                    
                    .padding()
                    Button(action: {
                        
                        //put code to reset score and names and to add it to the list of history
                        let model = History(nameOne: teamOne, nameTwo: teamTwo, scoreOne: pointsOne, scoreTwo: pointsTwo)
                        addHistory(history: model)
                        pointsOne = 0
                        pointsTwo = 0
                        teamOne = ""
                        teamTwo = ""
                    }) {
                        Text("Game Over")
                            .font(.custom("Avenir Next", size: 40))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding(.leading, 200)
                    Spacer()
                    
                }
                
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10) // Create the shape
                        .fill(Color.black.opacity(0.7))
                }
            }
            .ignoresSafeArea()
         
            
        
    }
    func addHistory(history:History){
        self.historyResult.append(history)
    }
}

#Preview {
    ScoreView()
}
