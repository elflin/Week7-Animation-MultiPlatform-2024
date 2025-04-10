//
//  BreathingViewModel.swift
//  Week7-Animation-MultiPlatform
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import Foundation
import SwiftUI
import Combine

class BreathingViewModel: ObservableObject {
    @Published var scale: CGFloat = 1.0
    @Published var color: Color = .blue
    @Published var isAnimating = false

    private var timer: AnyCancellable?

    func startAnimation() {
        isAnimating = true
        timer = Timer.publish(every: 2.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                withAnimation(.easeInOut(duration: 2.0)) {
                    self?.scale = self?.scale == 1.0 ? 1.5 : 1.0
                    self?.color = self?.color == .blue ? .purple : .blue
                }
            }
    }

    func stopAnimation() {
        isAnimating = false
        timer?.cancel()
        timer = nil
    }
}
