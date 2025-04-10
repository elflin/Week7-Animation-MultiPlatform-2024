//
//  BreathingView.swift
//  Mac-Animation-Multiplatform
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import SwiftUI

struct BreathingView: View {
    @ObservedObject var viewModel: BreathingViewModel

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

            Text("Session Time: \(viewModel.sessionTime) sec")

            Button(viewModel.isAnimating ? "Stop" : "Start") {
                viewModel.isAnimating
                    ? viewModel.stopAnimation() : viewModel.startAnimation()
            }
            .padding()

            List(viewModel.sessionHistory) { session in
                VStack(alignment: .leading) {
                    Text("Start: \(viewModel.formattedDate(session.start))")
                    Text("Duration: \(Int(session.duration)) sec")
                }
            }
        }
        .padding()
    }
}

#Preview {
    BreathingView(viewModel: BreathingViewModel())
}
