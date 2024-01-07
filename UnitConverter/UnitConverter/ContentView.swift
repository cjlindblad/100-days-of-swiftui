//
//  ContentView.swift
//  UnitConverter
//
//  Created by Carl-Johan Lindblad on 2024-01-07.
//

import SwiftUI

enum Unit: String {
    case seconds, minutes, hours, days
}

struct ContentView: View {
    let units: [Unit] = [.seconds, .minutes, .hours, .days]
    @State private var selectedFromUnit: Unit = .seconds
    @State private var selectedToUnit: Unit = .hours
    @State private var conversionValue = 0.0
    
    private var result: String {
        let conversion = switch (selectedFromUnit, selectedToUnit) {
        case (.seconds, .seconds): conversionValue
        case (.seconds, .minutes): conversionValue / 60
        case (.seconds, .hours): conversionValue / 60 / 60
        case (.seconds, .days): conversionValue / 60 / 60 / 24
        case (.minutes, .seconds): conversionValue * 60
        case (.minutes, .minutes): conversionValue
        case (.minutes, .hours): conversionValue / 60
        case (.minutes, .days): conversionValue / 60 / 24
        case (.hours, .seconds): conversionValue * 60 * 60
        case (.hours, .minutes): conversionValue * 60
        case (.hours, .hours): conversionValue
        case (.hours, .days): conversionValue / 24
        case (.days, .seconds): conversionValue * 60 * 60 * 24
        case (.days, .minutes): conversionValue * 60 * 24
        case (.days, .hours): conversionValue * 24
        case (.days, .days): conversionValue
        }
        
        return "\(conversionValue.formatted()) \(selectedFromUnit) is \(conversion.formatted()) \(selectedToUnit)"
    }
    
    var body: some View {
        Form {
            Section("Convert from") {
                Picker("Convert from", selection: $selectedFromUnit) {
                    ForEach(units, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Convert to") {
                Picker("Convert to", selection: $selectedToUnit) {
                    ForEach(units, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Value to convert") {
                TextField(value: $conversionValue, format: .number) {
                }
                Text(result)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
