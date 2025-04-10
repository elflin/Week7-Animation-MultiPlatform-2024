//
//  Week7_Animation_MultiPlatformApp.swift
//  Week7-Animation-MultiPlatform
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import SwiftUI

@main
struct Week7_Animation_MultiPlatformApp: App {
    var body: some Scene {
        WindowGroup {
            BreathingView(viewModel: BreathingViewModel())
        }
    }
}
