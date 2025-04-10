//
//  SessionRecord.swift
//  Week7-Animation-MultiPlatform
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import Foundation

struct SessionRecord: Identifiable {
    let id = UUID()
    let start: Date
    let end: Date
    var duration: TimeInterval {
        end.timeIntervalSince(start)
    }
}
