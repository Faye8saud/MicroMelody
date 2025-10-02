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


struct mainMenuView: View {
    @State private var name: String = ""
    
    
    @AppStorage("habitName") private var habitName: String = ""
    @AppStorage("selectedDays") private var selectedDays: Int = 0
    
    @State private var navigateToFeature = false
    
    private struct UnderlineStyle {
        let height: CGFloat
        let spacing: CGFloat
        let inset: CGFloat
    }
    private let underline = UnderlineStyle(height: 2, spacing: 10, inset: 8)
    private let buttonSize = CGSize(width: 220, height: 56)
    private let buttonFontSize: CGFloat = 22
    
    var body: some View {
        ZStack(alignment: .topLeading) {
                    
                    
                    backgroundGradient
                        .ignoresSafeArea()

                    // Main content container (holds only the Header and the ScrollView)
                    VStack(alignment: .leading, spacing: 0) {
                        
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Micro Melody")
                                .foregroundColor(Color(.mainBrown))
                                .font(.custom("arial rounded mt bold", size: 40))

                            Rectangle()
                                .fill(Color.mainBrown.opacity(0.34))
                                .frame(width: 254, height: 2, alignment: .bottomLeading)
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .zIndex(1)

                       
                        ScrollView {
                            VStack(alignment: .leading, spacing: 20) {
                                
                                
                                Spacer().frame(height: 50)
                                
                                TextField("Enter habit", text: $habitName)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    //.background(Color.white.opacity(0.8))
                                    .cornerRadius(8)
                                
                                HorizontalButtonScrollView(selectedDays: $selectedDays)
                                    .padding(.bottom, 10)
                                
                                
                                Spacer().frame(minHeight: 150)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 150)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    
                    VStack {
                        Spacer()
                        
                        NavigationLink(
                                               destination: mainFeatureView(),
                                               isActive: $navigateToFeature,
                                               label: { EmptyView() }
                                           )
                        
                        Button(action: { print("Starting journey with habit: \(habitName), days: \(selectedDays)")
                            navigateToFeature = true
                        }) {
                            Text("Start journey")
                                .font(.custom("arial rounded mt bold", size: 17))
                                .frame(width: 148, height: 50)
                                .background(Color.mainBlue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        .disabled(habitName.isEmpty || selectedDays == 0) // disable if no input
                        
                        .padding(.bottom, 30)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                  //  .background(Color.white.opacity(0.9))
                    .zIndex(2) 
                }
            }
        }
    

#Preview {
    mainMenuView()
}

