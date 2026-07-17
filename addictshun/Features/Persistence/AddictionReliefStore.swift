//
//  AddictionReliefStore.swift
//  addictshun
//
//  Created by Aarav Gupta on 17/07/26.
//

import SwiftUI
import FamilyControls

struct AddictionReliefStore {
    private static let key = "selectedActivities"
    
    static func load() -> FamilyActivitySelection {
        do {
            let data = UserDefaults.standard.data(forKey: key)
            guard let data else { return FamilyActivitySelection() }
            let selectedActivities = try JSONDecoder().decode(FamilyActivitySelection.self, from: data)
            
            return selectedActivities
        } catch {
            print(error.localizedDescription)
        }
        
        return FamilyActivitySelection()
    }
    
    static func save(_ selectedActivities: FamilyActivitySelection) {
        do {
            let data = try JSONEncoder().encode(selectedActivities)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
}
