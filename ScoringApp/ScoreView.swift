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
        
       
            VStack{
                //title of the view
                        HStack{
                            Text("SCORE")
                                .padding()
                                .font(.custom("Avenir Next", size: 70))
                            Spacer()
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
                        
                    Spacer()
                }
                Spacer()
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
}

#Preview {
    ScoreView()
}
