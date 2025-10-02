//
//  LaunchView.swift
//  MicroMelody
//
//  Created by Fay  on 01/10/2025.
//
import SwiftUI

struct LaunchView: View {
    @State private var showHome = false

    var body: some View {
        ZStack {
            if showHome {
                homeView()
                    .transition(.opacity)
            } else {
                logoView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 1), value: showHome)
        .onAppear {
            // Delay of 3 seconds before switching
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showHome = true
            }
        }
    }
}
