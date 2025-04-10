//
//  BreathingViewModel.swift
//  Week7-Animation-MultiPlatform
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import Combine
import Foundation
import SwiftUI
import WatchConnectivity

class BreathingViewModel: NSObject, ObservableObject, WCSessionDelegate {

    @Published var scale: CGFloat = 1.0
    @Published var color: Color = .blue
    @Published var isAnimating = false
    @Published var sessionTime: Int = 0
    @Published var sessionHistory: [SessionRecord] = []
    @Published var record: SessionRecord?

    private var timer: AnyCancellable?
    private var animationTimer: AnyCancellable?
    private var currentStartDate: Date?

    private var session: WCSession

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }

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
            record = SessionRecord(start: start, end: end)
            sessionHistory.insert(record!, at: 0)
        }
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter.string(from: date)
    }

    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: (any Error)?
    ) {
    }

    #if os(iOS)
        func sessionDidBecomeInactive(_ session: WCSession) {
        }

        func sessionDidDeactivate(_ session: WCSession) {
        }
    #endif

    func session(_ session: WCSession, didReceiveMessage message: [String: Any])
    {
        DispatchQueue.main.sync {
            print("Received message: \(message)")

            self.sessionHistory.insert(
                SessionRecord(
                    start: message["start"] as! Date,
                    end: message["end"] as! Date
                )
                , at: 0
            )
        }
    }
}
