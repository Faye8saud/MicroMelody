//
//  homeView.swift
//  MicroMelody
//
//  Created by Fay  on 01/10/2025.
//

import SwiftUI


    struct homeView: View {
        @State private var isShowingMainMenu = false

        
        private struct UnderlineStyle {
            let height: CGFloat
            let spacing: CGFloat
            let inset: CGFloat
        }
        private let underline = UnderlineStyle(height: 2, spacing: 10, inset: 8)
        private let buttonSize = CGSize(width: 220, height: 56)
        private let buttonFontSize: CGFloat = 22
        
        var body: some View {
            NavigationStack {
                ZStack {
                    // Gradient background
                    LinearGradient(gradient: Gradient(colors: [
                        Color(hex: "DEC9AE"),
                        Color.white
                    ]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                    VStack {
                        // Title
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Micro Melody")
                                .foregroundColor(Color(.mainBrown))
                                .font(.custom("arial rounded mt bold", size: 40))
                            
                                .overlay(alignment: .bottomLeading) {
                                    GeometryReader { proxy in
                                        Rectangle()
                                            .fill(.mainBrown.opacity(34/100))
                                            .frame(
                                                width: max(0, proxy.size.width + 35 ),
                                                height: underline.height
                                            )
                                            .offset(x: underline.inset - 30, y: underline.spacing + 45)
                                    }
                                    .allowsHitTesting(false)
                                }
                                .padding(.bottom, underline.spacing + underline.height)
                        
                        }
                        .padding(.horizontal)
                        .padding(.top, 50)

                      

                        Spacer()

                        // Quote
                        Text("“Motivation is what gets you started. Habit is what keeps you going”")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(Color(hex: "999999"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)

                        Spacer()
                      
                        // Bottom line
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(hex: "DEC9AE"))
                            .padding(.horizontal, 80)
                            .padding(.bottom, 8)
                        // ✅ Navigation button
                        NavigationLink(destination: mainMenuView()) {
                            Image(systemName: "plus")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 65, height: 65)
                                .background(Color(hex: "0A3644"))
                                .clipShape(Circle())
                        }
                        .padding(.bottom, 30)

                   
                    }
                }
            }
        }
    }


#Preview {
homeView()
}
