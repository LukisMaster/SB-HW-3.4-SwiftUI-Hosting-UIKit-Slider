//
//  ContentView.swift
//  SB-HW-3.4-SwiftUI-Hosting-UIKit-Slider
//
//  Created by Sergey Nestroyniy on 05.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    @State private var showAlert = false
    
    private var alpha: CGFloat {
        return CGFloat(Float(computeScore()) / 100)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .padding()
                .font(.footnote)
            
            HStack {
                Text("0")
                UISliderView(value: $currentValue, alpha: alpha)
                Text("100")
            }
            
            if #available(iOS 15.0, *) {
                Button("Проверь меня!", action: {showAlert.toggle()})
                    .alert("Your Score", isPresented: $showAlert) {} message: {
                        Text("\(computeScore())")
                    }
            } else {
                Button("Проверь меня!", action: {showAlert.toggle()})
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Проверь меня!"),
                            message: Text("\(computeScore())"))
                    }
            }
            
            Button("Начать заново", action: newValues)
        }
        .padding()
    }
    
    private func newValues() {
        targetValue = Int.random(in: 0...100)
        currentValue = Double.random(in: 0...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
