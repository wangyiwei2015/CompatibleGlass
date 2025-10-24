//
//  ContentView.swift
//  CompatibleGlass
//
//  Created by leo on 2025.10.24.
//

import SwiftUI

struct ContentView: View {
    @State var leftColorSel: Color = .black
    @State var leftOpacity: Double = 1.0
    @State var rightColorSel: Color = .black
    @State var rightOpacity: Double = 1.0
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 0) {
                    leftColorSel.opacity(leftOpacity)
                    rightColorSel.opacity(rightOpacity)
                }.overlay {
                    VStack(spacing: 20) {
                        Text("Normal")
                        GlassButton {} label: {
                            Label("Normal", systemImage: "swift").padding(8)
                        }
                        Button {} label: {
                            Label("Normal", systemImage: "swift").padding(8)
                        }.buttonStyle(FallbackGlassButtonStyle())
                        Text("Large")
                        GlassButton {} label: {
                            Label("Large", systemImage: "swift")
                                .padding(12).padding(.horizontal, 16)
                        }
                        Button {} label: {
                            Label("Large", systemImage: "swift")
                                .padding(12).padding(.horizontal, 16)
                        }.buttonStyle(FallbackGlassButtonStyle())
                    }
                }
                VStack {
                    Picker("left", selection: $leftColorSel) {
                        Text("K").tag(Color.black)
                        Text("W").tag(Color.white)
                        Text("R").tag(Color.red)
                        Text("O").tag(Color.orange)
                        Text("Y").tag(Color.yellow)
                        Text("G").tag(Color.green)
                        Text("C").tag(Color.cyan)
                        Text("B").tag(Color.blue)
                        Text("P").tag(Color.purple)
                        Text("N").tag(Color.pink)
                    }.pickerStyle(.segmented)
                    Slider(value: $leftOpacity, in: 0...1)
                    Divider()
                    Picker("left", selection: $rightColorSel) {
                        Text("K").tag(Color.black)
                        Text("W").tag(Color.white)
                        Text("R").tag(Color.red)
                        Text("O").tag(Color.orange)
                        Text("Y").tag(Color.yellow)
                        Text("G").tag(Color.green)
                        Text("C").tag(Color.cyan)
                        Text("B").tag(Color.blue)
                        Text("P").tag(Color.purple)
                        Text("N").tag(Color.pink)
                    }.pickerStyle(.segmented)
                    Slider(value: $rightOpacity, in: 0...1)
                }.padding().padding(.horizontal)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
