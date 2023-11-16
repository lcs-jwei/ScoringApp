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
    @State var searchText = ""
    var body: some View {
        HStack {
            VStack{
              
                ZStack{
                    Text("\(pointsOne) - \(pointsTwo)")
                        .font(.custom("Avenir Next", size: 90))
                        .foregroundColor(.black)
                        .padding()
                        .border(Color.black)
                }
                VStack {
                  
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
                        .padding(.trailing, 100)
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
            .padding(.trailing, 200)
            VStack{
                Text("HISTORY")
                    .font(.custom("Avenir Next", size: 40))
                TextField("Search", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .frame(width:300)
                List(filtering(originalHistory: historyResult, on: searchText)) { history in
                    VStack{
                        Text("Teams - \(history.nameOne) vs. \(history.nameTwo)")
                            .font(.custom("Avenir Next", size: 30))
                        Text("Score:  \(history.scoreOne) - \(history.scoreTwo)")
                            .font(.custom("Avenir Next", size: 20))
                        Text(Date.now, style: .date)
                            .font(.custom("Avenir Next", size: 20))
                    }
                    .frame(width:300)
                }
                .frame(width:400, height:500)
                .padding()
            }
        }
            VStack{
                Spacer()
                
                HStack {
                    Spacer()
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
                   
                    
                }
                
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10) 
                        .fill(Color.black.opacity(0.7))
                        
                }.padding()
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
