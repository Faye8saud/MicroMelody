//
//  cardView.swift
//  MicroMelody
//
//  Created by Joud Almashgari on 30/09/2025.
//

import SwiftUI

extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }

}

let cardBackgroundGradient = LinearGradient(
    gradient: Gradient(colors: [Color(hex: "#9CB8B7"), Color(hex: "#638281")]),
    startPoint: .leading,
    endPoint: .bottomTrailing
)

// MARK: - Reusable Card View
struct CardView: View {
    let title: String
    let bodyPlaceholder: String
    var action: () -> Void

    var body: some View {
        
        
        Spacer()
        
        // 1. Button Wrapper: Provides tap action and visual feedback
        Button(action: action) {
            ZStack(alignment: .topLeading) {
                // 2. Card Background: The rounded rectangle with corner radius
                RoundedRectangle(cornerRadius: 14)
                    .fill(cardBackgroundGradient)
                    .frame(width: 235, height: 350)
                    .shadow(color: Color(hex: "#638281").opacity(28/100), radius: 0, x: 14, y: -14).padding(.top, 35)
                
                
                // 4. Card Content: Stacked vertically
                
                VStack(alignment: .leading, spacing: 10) {
                    Rectangle()
                        .frame(width: 0, height: 0)
                        .padding(.bottom, 15)
                        .padding(.horizontal,-15)
                    
                    // Title
                    Text(title)
                        .font(.custom("Arial Rounded MT Bold", size: 22))
                        .foregroundColor(Color(hex: "#EFE7DF"))
                        .padding(.bottom, 2)
                    
                    // Separator Line
                    Rectangle()
                        .fill(Color(hex: "#EFE7DF"))
                        .frame(width: 109, height: 1.5)
                        .padding(.bottom, 15)
                        .padding(.horizontal,-15)
                    
                    // Body Text
                    Text(bodyPlaceholder)
                        .foregroundColor(Color(hex: "#8D7763"))
                        .font(.system(size: 16, weight: .regular))
                        .lineSpacing(6)
                    
                    //Spacer() // Pushes content to the top
                }
                .padding(.horizontal)
                .padding(.top, 35)
              
            }
        }
        // Use PlainButtonStyle to prevent the text from fading when tapped
        .buttonStyle(PlainButtonStyle())
        
    }
}

// MARK: - Main Scrollable View
struct HorizontalButtonScrollView: View {
    
    // Data Structure for the Cards
    let cardData = [
        ("14 Days Symphony", """
         lorem ipsum dolor sit
         amot lorem ipsum dolor
         sit amot orem ipsum
         dolor sit amot
         lorem ipsum dolor sit
         amot
         """),
        ("21 Days Symphony", """
         adipiscing elit sed do
         eiusmod tempor incididunt
         ut labore et dolore
         magna aliqua ut enim
         ad minim veniam
         """),
        ("66 Days Symphony", """
         quis nostrud exercitation
         ullamco laboris nisi ut
         aliquip ex ea commodo
         consequat duis aute
         irure dolor
         """)
    ]
    

    var body: some View {
        
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) { // Adjusted spacing between cards
                
                // Add padding before the first card starts
                //Spacer()
                
                // Iterate over the card data
                ForEach(cardData, id: \.0) { title, bodyText in
                    CardView(
                        title: title,
                        bodyPlaceholder: bodyText
                    ) {
                        print("Button \(title) tapped!")
                    }
                }
                
                // Add padding after the last card
                Spacer().frame(width: 10)
            }
            
            // Remove the .padding(.horizontal) on the HStack
            // and replace it with Spacers for better visual control.
        }
    }
}

#Preview {
    HorizontalButtonScrollView()
}
