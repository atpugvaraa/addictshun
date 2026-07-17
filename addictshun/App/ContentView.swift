//
//  ContentView.swift
//  addictshun
//
//  Created by Aarav Gupta on 01/03/25.
//

import SwiftUI
import FamilyControls

struct ContentView: View {
    let service = ScreenTimeService()
    @State private var selectedActivity = FamilyActivitySelection()
    
    var body: some View {
        VStack {
            FamilyActivityPicker(selection: $selectedActivity)
        }
        .task {
            do {
                try await service.requestAuthorization()
            } catch {
                print(error.localizedDescription)
            }
        }
        .onChange(of: selectedActivity) {
            service.applyShield(to: selectedActivity)
        }
    }
}

#Preview {
    ContentView()
}
