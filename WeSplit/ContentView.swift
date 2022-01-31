//
//  ContentView.swift
//  WeSplit
//
//  Created by Gabriel Pereira on 25/01/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    @FocusState private var amountIsFocused: Bool
    
    // MARK: - Computed Properties
    var tipValue: Double {
        let tipSelection: Double = Double(tipPercentage)
        
        return checkAmount / 100 * tipSelection
    }
    
    var totalCheck: Double {
        return checkAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount: Double = Double(numberOfPeople + 2)
        let amountPerPerson: Double = totalCheck / peopleCount
        
        return amountPerPerson
    }
    
    // MARK: - UI Components
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header : {
                    Text("Amount per person")
                }
                
                Section {
                    Text(totalCheck, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total amount")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
