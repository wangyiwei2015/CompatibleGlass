//
//  GlassButton.swift
//  CompatibleGlass
//
//  Created by leo on 2025.10.24.
//

import SwiftUI

@ViewBuilder func GlassButton<T: View>(
    action: @escaping @MainActor () -> Void, @ViewBuilder label: () -> T
) -> some View {
    if #available(iOS 26, *) {
        Button(action: action, label: label)
            .buttonStyle(.glassProminent)
            .tint(.white.opacity(0.2))
            .foregroundStyle(.primary)
    } else {
        Button(action: action, label: label)
            .buttonStyle(FallbackGlassButtonStyle())
    }
}

struct FallbackGlassButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8).padding(.horizontal, 4)
            .background(.thinMaterial, in: Capsule())
            .compositingGroup()
            .overlay {
                Capsule().stroke(
                    LinearGradient(colors: [
                        Color.white.opacity(0.4),
                        Color.white.opacity(0.1),
                        Color.white.opacity(0.4)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing
                    ), lineWidth: 1
                )
            }.overlay {
                Capsule().fill(Color.white.opacity(
                    configuration.isPressed ? 0.4 : 0
                ))
            }
            .shadow(color: .black.opacity(0.2), radius: 16, y: 4)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(
                .smooth(duration: 0.3),// extraBounce: 0.3),
                value: configuration.isPressed
            )
    }
}

#Preview {
    HStack(spacing: 0) {
        Color.white
        Color.black
    }.overlay {
        VStack(spacing: 20) {
            GlassButton { } label: {
                Label("LabelText", systemImage: "swift")
                    .padding(8)
            }
            Button {} label: {
                Label("LabelText", systemImage: "swift")
                    .padding(8)
            }.buttonStyle(FallbackGlassButtonStyle())
        }
    } // overlay
}
