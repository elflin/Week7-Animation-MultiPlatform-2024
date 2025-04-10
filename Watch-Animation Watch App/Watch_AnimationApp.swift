//
//  Watch_AnimationApp.swift
//  Watch-Animation Watch App
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import SwiftUI

@main
struct Watch_Animation_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            WatchBreathingView(viewModel: BreathingViewModel(), iOSConnectivityManager: iOSConnectivity())
        }
    }
}
