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

//  Card View
struct CardView: View {
    let title: String
    let bodyPlaceholder: String
    var action: () -> Void

    var body: some View {
        
        
        Spacer()
        
        // 1. Button Wrapper
        Button(action: action) {
            ZStack(alignment: .topLeading) {
                // 2. Card Background
                RoundedRectangle(cornerRadius: 14)
                    .fill(cardBackgroundGradient)
                    .frame(width: 235, height: 350)
                    .shadow(color: Color(hex: "#638281").opacity(28/100), radius: 0, x: 14, y: -14).padding(.top, 35)
                
                
                // 3. Card Content
                
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
                        .foregroundColor(Color(hex: "#EFE7DF"))
                        .font(.system(size: 16, weight: .regular))
                        .lineSpacing(6)
                    
                   
                }
                .padding(.horizontal)
                .padding(.top, 35)
              
            }
        }
        
        .buttonStyle(PlainButtonStyle())
        
    }
}

//  Main Scrollable View
struct HorizontalButtonScrollView: View {
    @Binding var selectedDays: Int
    // Data Structure for the Cards
    let cardData = [
           ("14 Days Symphony", 14, """
            Each note is an instant win.
            Complete a satisfying 
            musical phrase in 
            14 days and 
            quickly test drive
            a new habit.
            """),
           ("21 Days Symphony", 21, """
            Every check-in 
            is a rich chord. 
            Layer the sounds over 
            21 days
            to achieve automatic 
            consistency and build 
            a solid harmonic foundation.
            """),
           ("66 Days Symphony", 66, """
            Each note tracks your 
            discipline.
            Compose a full, 
            complex symphony in 
            66 days, 
            turning effort into a 
            permanent lifestyle mastery.
            """)
       ]

       var body: some View {
           ScrollView(.horizontal, showsIndicators: false) {
               HStack(spacing: 25) {
                   ForEach(cardData, id: \.0) { title, days, bodyText in
                       CardView(
                           title: title,
                           bodyPlaceholder: bodyText
                       ) {
                           selectedDays = days
                           print("Selected \(days) days")
                       }
                       
//                       .overlay(
//                           RoundedRectangle(cornerRadius: 14)
//                               .stroke(selectedDays == days ? Color.blue : Color.clear, lineWidth: 3)
                       
                   }
                   Spacer().frame(width: 10)
               }
           }
       }
   }
