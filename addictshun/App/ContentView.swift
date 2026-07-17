//
//  ContentView.swift
//  addictshun
//
//  Created by Aarav Gupta on 01/03/25.
//

import SwiftUI
import FamilyControls

struct ContentView: View {
    private let screenTimeService = ScreenTimeService()
    @State private var selectedActivities = AddictionReliefStore.load()
    
    var body: some View {
        VStack {
            FamilyActivityPicker(selection: $selectedActivities)
        }
        .task {
            do {
                try await screenTimeService.requestAuthorization()
            } catch {
                print(error.localizedDescription)
            }
        }
        .onChange(of: selectedActivities) {
            screenTimeService.applyShield(to: selectedActivities)
            AddictionReliefStore.save(selectedActivities)
        }
    }
}

#Preview {
    ContentView()
}
