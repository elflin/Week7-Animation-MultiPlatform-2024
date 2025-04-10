//
//  WatchBreathingView.swift
//  Watch-Animation Watch App
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import SwiftUI

struct WatchBreathingView: View {
    @ObservedObject var viewModel: BreathingViewModel
    @ObservedObject var iOSConnectivityManager: iOSConnectivity

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "heart.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(viewModel.color)
                .scaleEffect(viewModel.scale)
                .onTapGesture {
                    viewModel.startAnimation()
                    WKInterfaceDevice.current().play(.start)
                }

            Text("\(viewModel.sessionTime) sec")

            Button(viewModel.isAnimating ? "Stop" : "Start") {
                if viewModel.isAnimating {
                    viewModel.stopAnimation()
                    iOSConnectivityManager.sendToiOS(data: viewModel.record!)
                } else {
                    viewModel.startAnimation()
                }
            }
        }
        .padding()
    }
}

#Preview {
    WatchBreathingView(
        viewModel: BreathingViewModel(),
        iOSConnectivityManager: iOSConnectivity()
    )
}
