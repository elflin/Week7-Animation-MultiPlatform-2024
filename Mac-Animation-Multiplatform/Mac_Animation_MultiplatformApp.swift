//
//  Mac_Animation_MultiplatformApp.swift
//  Mac-Animation-Multiplatform
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import SwiftUI

@main
struct Mac_Animation_MultiplatformApp: App {
    var body: some Scene {
        WindowGroup {
            BreathingView(viewModel: BreathingViewModel())
        }
    }
}
