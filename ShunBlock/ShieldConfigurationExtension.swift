//
//  ShieldConfigurationExtension.swift
//  ShunBlock
//
//  Created by Aarav Gupta on 17/07/26.
//

import ManagedSettings
import ManagedSettingsUI
import UIKit

// Override the functions below to customize the shields used in various situations.
// The system provides a default appearance for any methods that your subclass doesn't override.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.
class ShieldConfigurationExtension: ShieldConfigurationDataSource {
    override func configuration(shielding application: Application) -> ShieldConfiguration {
        // Customize the shield as needed for applications.
        print(application.bundleIdentifier ?? "nil")
        
        switch application.bundleIdentifier {
        case let id? where id.hasPrefix("com.burbn.instagram"):
            return ShieldConfiguration(backgroundBlurStyle: .systemUltraThinMaterialDark, backgroundColor: .black, title: ShieldConfiguration.Label(text: "trust me you don't need this", color: .white), subtitle: ShieldConfiguration.Label(text: "get out of the shit hole now", color: .white), primaryButtonLabel: ShieldConfiguration.Label(text: "close this shit", color: .label), primaryButtonBackgroundColor: .systemBlue.withAlphaComponent(0.3))
        case "com.atebits.Tweetie2":
            return ShieldConfiguration(backgroundBlurStyle: .systemUltraThinMaterialDark, backgroundColor: .black, title: ShieldConfiguration.Label(text: "please stop rotting your brain", color: .white), subtitle: ShieldConfiguration.Label(text: "go read some books instead", color: .white), primaryButtonLabel: ShieldConfiguration.Label(text: "save me", color: .label), primaryButtonBackgroundColor: .black.withAlphaComponent(0.3))
        case "com.linkedin.LinkedIn":
            return ShieldConfiguration(backgroundBlurStyle: .systemUltraThinMaterialDark, backgroundColor: .black, title: ShieldConfiguration.Label(text: "holy shit only dorks use this app", color: .white), subtitle: ShieldConfiguration.Label(text: "actually go build stuff ong", color: .white), primaryButtonLabel: ShieldConfiguration.Label(text: "get me out", color: .label), primaryButtonBackgroundColor: .blue.withAlphaComponent(0.3))
        default:
            return ShieldConfiguration()
        }
    }
    
    override func configuration(shielding application: Application, in category: ActivityCategory) -> ShieldConfiguration {
        // Customize the shield as needed for applications shielded because of their category.
        ShieldConfiguration()
    }
    
    override func configuration(shielding webDomain: WebDomain) -> ShieldConfiguration {
        // Customize the shield as needed for web domains.
        ShieldConfiguration(
            backgroundColor: .red,
            title: .init(text: "don't even try this.", color: .white)
        )
    }
    
    override func configuration(shielding webDomain: WebDomain, in category: ActivityCategory) -> ShieldConfiguration {
        // Customize the shield as needed for web domains shielded because of their category.
        ShieldConfiguration()
    }
}
