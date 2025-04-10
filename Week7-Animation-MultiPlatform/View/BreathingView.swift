//
//  BreathingView.swift
//  Week7-Animation-MultiPlatform
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import SwiftUI

struct BreathingView: View {
    @ObservedObject var viewModel: BreathingViewModel = BreathingViewModel()

    var body: some View {
        VStack {
            Spacer()
            Circle()
                .fill(viewModel.color)
                .frame(width: 150, height: 150)
                .scaleEffect(viewModel.scale)
                .onTapGesture {
                    viewModel.startAnimation()
                }
            Spacer()
            Button(viewModel.isAnimating ? "Stop" : "Start") {
                viewModel.isAnimating
                    ? viewModel.stopAnimation() : viewModel.startAnimation()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    BreathingView()
}
