//
//  ContentView.swift
//  GuesFlag
//
//  Created by UTKARSH on 04/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0
    @State private var selectedWrongFlagName = ""
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),.init(color: .red, location: 0.3)], center: .top, startRadius:
                            200, endRadius: 700).ignoresSafeArea()
            VStack(spacing:30) {
                
                Spacer()
                
                Text("Guess the Flag").foregroundColor(.white).font(.title.weight(.bold))
                
                VStack(spacing:30) {
                    
                    VStack {
                        Text("Tap the flag of").foregroundColor(.secondary).font(.subheadline.weight(.heavy))
                        
                        Text("\(countries[correctAnswer])").foregroundColor(.black).foregroundColor(.white).font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){ number in
                        
                        Button{
                            flagTapped(number)
                        }label: {
                            Image(countries[number]).clipShape(.capsule).shadow(radius: 10)
                        }
                    }
                    
                    
                    
                }.frame(maxWidth: .infinity).padding(.vertical,20).background(.regularMaterial).clipShape(.rect(cornerRadius: 10))
                
                Spacer()
                Spacer()
                
                Text("Score: \(totalScore)").foregroundColor(.white).font(.title.weight(.bold))
                Spacer()
            }.padding()
            
        }.alert(scoreTitle, isPresented: $showingScore){
            Button("Continue",action: askQuestion)
        }message: {
            if scoreTitle == "Correct"{
                Text("Your Score is \(totalScore)")
            }else{
                Text("Wrong! That’s the flag of \(selectedWrongFlagName)")
            }
            
        }
    }
    
    func flagTapped(_ number: Int) {
        
        if number == correctAnswer{
            scoreTitle = "Correct"
            totalScore = totalScore + 1
            print("Correct")
        }else{
            scoreTitle = "Wrong"
            totalScore = totalScore - 1
            print("Wrong")
            selectedWrongFlagName = countries[number]
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}
                     
                     

#Preview {
    ContentView()
}
