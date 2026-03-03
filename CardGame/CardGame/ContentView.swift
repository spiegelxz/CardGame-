//
//  ContentView.swift
//  CardGame
//
//  Created by Dastan Talantbek on 1/3/26.
//

import SwiftUI

struct ContentView: View {
    // we use @State to access the variable on ContentView and change it on the function, without @State, we cannot access the state properties(variables)
    
    @State var playerCard: String = "card10"
    @State var botCard: String = "card11"
    @State var playerScore: Int = 0
    @State var botScore: Int = 0
    
    var body: some View {
        
        ZStack {
            Image("background-wood-grain")
            VStack {
            // Logo here
                Spacer()
                Image("logo")
                Spacer()
            // Cards here, use HStack, to put cards horizontally
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(botCard)
                    Spacer()
                }
               Spacer()
                
            // Button here
                Button {
                    cardDealer()
                } label: {
                    Image("button")
                }
                Spacer()
               

            // Score here
                HStack {
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.title)
                            .padding(.bottom)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .bold()
                    }
                    Spacer()
                    VStack{
                        Text("Bot")
                            .font(.title)
                            .padding(.bottom)
                        Text(String(botScore))
                            .font(.largeTitle)
                            .bold()
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                Spacer()
                
            }
            .padding()
        }
        
    
       
    }
    
    func cardDealer(){
        // Break the program
        if playerScore == 20 || botScore == 20 {
            // stops the program
            return
        }
        // Randomize card values
        let playerValue = Int.random(in: 2...14)
        let botValue = Int.random(in: 2...14)
        
        // Update the card image
        playerCard = "card" + String(playerValue)
        botCard = "card" + String(botValue)
        
        // Calculate the score cards
        if playerValue > botValue {
            playerScore += 1
        } else if botValue > playerValue {
            botScore += 1
        } else {
            playerScore += 0
            botScore += 0
        }
        // Update the score labels
    }
}

#Preview {
    ContentView()
}
