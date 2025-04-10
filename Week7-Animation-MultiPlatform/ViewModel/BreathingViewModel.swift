//
//  BreathingViewModel.swift
//  Week7-Animation-MultiPlatform
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import Combine
import Foundation
import SwiftUI

class BreathingViewModel: ObservableObject {
    @Published var scale: CGFloat = 1.0
    @Published var color: Color = .blue
    @Published var isAnimating = false
    @Published var sessionTime: Int = 0
    @Published var sessionHistory: [SessionRecord] = []

    private var timer: AnyCancellable?
    private var animationTimer: AnyCancellable?
    private var currentStartDate: Date?

    func startAnimation() {
        isAnimating = true
        sessionTime = 0
        currentStartDate = Date()

        timer = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.sessionTime += 1
            }

        animationTimer = Timer.publish(every: 2.0, on: .main, in: .common)
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
        animationTimer?.cancel()

        if let start = currentStartDate {
            let end = Date()
            let record = SessionRecord(start: start, end: end)
            sessionHistory.insert(record, at: 0)
        }
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter.string(from: date)
    }
}
