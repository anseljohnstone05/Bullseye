//
//  BullseyeScreen.swift
//  Bullseye
//
//  Created by Stephanie Johhstone on 9/15/25.
//

import SwiftUI

struct BullseyeScreen: View {
    
    @State private var target = Int.random(in: 1 ... 100)
    @State private var input = 50.0
    
    @State private var round = 1
    @State private var total = 0
    
    var body: some View {
        VStack {
            Spacer()
            title
            Spacer()
            guessSlider
            Spacer()
            guessButton
            Spacer()
            infoBar
            
        }
    }
    
    private var title: some View {
        Text("Your number is: \(target)")
    }
    
    private var guessSlider: some View {
        Slider(
            value: $input,
            in: 1 ... 100,
            label: {
                Text("Bullseye")
            },
            minimumValueLabel: {
                Text("  1")
            },
            maximumValueLabel: {
                Text("100")
            }
        )
        .monospaced()
    }
    
    private var guessButton: some View {
        Button("Guess") {
            guess()
        }
    }
    
    private var infoBar: some View {
        HStack {
            Button("Reset"){
                print("Reset")
            }
            
            Spacer()
            Text("Score: \(total)")
            Spacer()
            Text("Rounds: \(round)")
            Spacer()
            
            Button("ℹ️") {
                
            }
        }
    }
    
    private func guess() {
        let difference = abs(target - Int(input))
        let score = 100 - difference
        
        total += score
        
        target = Int.random(in: 1 ... 100)
        round += 1
        input = 50
    }
    
}

#Preview {
    BullseyeScreen()
}
