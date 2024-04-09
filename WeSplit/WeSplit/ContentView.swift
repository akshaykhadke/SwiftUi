//
//  ContentView.swift
//  WeSplit
//
//  Created by UTKARSH on 08/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState var isAmountKeypadFocusState : Bool
    let tipPercentages = [10, 15, 20, 25, 0]
    
    
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Check Amount",value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad).focused($isAmountKeypadFocusState)
                    
                    
                    Picker("Select Number of People",selection: $numberOfPeople){
                        ForEach(2..<100){ number in
                            Text("\(number) People")
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to tip?"){
                    
                    Picker("Select tip percentage",selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){ per in
                            Text(per,format: .percent)
                        }
                    }.pickerStyle(.segmented)
                    
                    let tipValue = (checkAmount / 100) * Double(tipPercentage)
                    
                    Text("Tip amount: \(tipValue)")
                }
                
                Section("Amount per person"){
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                
                }
            
            }.navigationTitle("We Split").toolbar{
                if isAmountKeypadFocusState == true{
                    Button("Done"){
                        isAmountKeypadFocusState = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
