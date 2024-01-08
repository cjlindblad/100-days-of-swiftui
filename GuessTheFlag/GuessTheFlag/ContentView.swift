//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Carl-Johan Lindblad on 2024-01-08.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Button("Show alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Please read this.")
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting..")
    }
}

#Preview {
    ContentView()
}
