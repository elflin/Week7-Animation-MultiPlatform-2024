//
//  WatchBreathingView.swift
//  Watch-Animation Watch App
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import SwiftUI

struct WatchBreathingView: View {
    @ObservedObject var viewModel: BreathingViewModel = BreathingViewModel()

    var body: some View {
        VStack {
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

            Button(viewModel.isAnimating ? "Stop" : "Start") {
                viewModel.isAnimating
                    ? viewModel.stopAnimation() : viewModel.startAnimation()
            }
            .font(.footnote)
            .padding(.top, 8)
        }
        .padding()
    }
}

#Preview {
    WatchBreathingView()
}
