//
//  ScreenTimeService.swift
//  addictshun
//
//  Created by Aarav Gupta on 17/07/26.
//

import Foundation
import FamilyControls
import ManagedSettings

//@Observable
class ScreenTimeService {
    private let store = ManagedSettingsStore()
    
    func requestAuthorization() async throws {
        try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
    }
    
    func applyShield(to selection: FamilyActivitySelection) {
        store.shield.applications = selection.applicationTokens
        store.shield.webDomains = selection.webDomainTokens
    }
}
