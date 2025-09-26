//
//  ContentView.swift
//  MicroMelody
//
//  Created by Fay  on 26/09/2025.
//


import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(hex: "#ECE1D7")
                .ignoresSafeArea()
            
            HStack(spacing: 250) {
                Text("day 1")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(Color(hex: "#8D7763"))
                
                Menu {
                    Button("Menu Item 1") { print("Item 1 selected") }
                    Button("Menu Item 2") { print("Item 2 selected") }
                    Button("Menu Item 3") { print("Item 3 selected") }
                } label: {
                    Text("...")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color(hex: "#8D7763"))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .cornerRadius(8)
                }
            }
            .padding(.top, -370)
            
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(hex: "#044158"), Color(hex: "#9A907E")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(radius: 30)
                    .padding(.top, 80)
                    .padding(.horizontal, 0.1)
                
                HStack {
                    Spacer()
                    Button(action: {
                        print("Play tapped")
                    }) {
                        Image(systemName: "backward.fill")
                            .font(.system(size: 35))
                            .foregroundColor(Color(hex: "#ECE1D7"))
                    }
                    Button(action: {
                        print("Play tapped")
                    }) {
                        Image(systemName: "play.fill")
                            .font(.system(size: 35))
                            .foregroundColor(Color(hex: "#ECE1D7"))
                    }
               
                }
                .padding(.bottom, 550)
                .padding(.trailing, 30)
                
                
                ZStack {
                  
                    ZStack {
                        // 🎵 Vinyl image
                        Image("vinyl")
                            .resizable()
                            .frame(width: 400, height: 400)
                            .shadow(radius: 5)
                            .offset(x: 10)
                     
                        ZStack {
                                      Circle()
                                          .fill(Color(hex: "#ECE1D7"))
                                          .frame(width: 60, height: 60)
                                          .shadow(radius: 2)
                                      
                                      Image(systemName: "checkmark")
                                          .font(.system(size: 35, weight: .bold))
                                          .foregroundColor(Color(hex: "#09435B"))
                                  }
                        .offset(y : -10)
                        
                        Image("vinyleneedle")
                            .resizable()
                            .frame(width: 90, height: 300)
                            .rotationEffect(.degrees(25), anchor: .topLeading) // tilting the needle
                            .offset(x: 190, y: -90)  //  for alignment over vinyl
                    }
                    .offset(y: 75)
                }
                HStack(spacing: 250) {
                    Text("Taking a walk")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(Color(hex: "#ECE2D9"))
                }
                .offset(y: 290)
            }
            .ignoresSafeArea(edges: .bottom)
             }
        }
        }


#Preview {
    ContentView()
}

