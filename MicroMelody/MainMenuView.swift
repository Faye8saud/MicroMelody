//
//  MainMenuView.swift
//  MicroMelody
//
//  Created by Bushra Hatim Alhejaili on 30/09/2025.
//
import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [
        Color(red: 236/255, green: 226/255, blue: 216/255),
        .white
    ],
    startPoint: .top,
    endPoint: .bottom
)


struct ContentView: View {
    @State private var name: String = ""
    
    private struct UnderlineStyle {
        let height: CGFloat
        let spacing: CGFloat
        let inset: CGFloat
    }
    private let underline = UnderlineStyle(height: 2, spacing: 10, inset: 8)
    private let buttonSize = CGSize(width: 220, height: 56)
    private let buttonFontSize: CGFloat = 22
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack{
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
                    
                    Spacer()
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
                
                // Centered TextField positioned above the middle of the screen
                VStack {
                    
                    
                    
                    
                    TextField("Enter habit", text: $name)
                    //.textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 20)
                    
                    
                    
                    HorizontalButtonScrollView()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .zIndex(1)
                
                
                VStack {
                    
                    
                    
                    Button(action: {
                        print("Button tapped!")
                    }) {
                        Text("Start journey")
                            .font(.custom("arial rounded mt bold", size: buttonFontSize))
                            .frame(width: buttonSize.width, height: buttonSize.height)
                            .background(.mainBlue)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .shadow(radius: 5)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(.keyboard)
                .padding(20)
            }
        }
    }
}
#Preview {
    ContentView()
}

