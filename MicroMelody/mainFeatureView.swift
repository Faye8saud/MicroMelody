//
//  ContentView.swift
//  MicroMelody
//
//  Created by Fay  on 26/09/2025.
//


import SwiftUI
import AVFoundation

struct mainFeatureView: View {
    
    @State private var showingActionSheet = false
    
    @AppStorage("currentDay") private var currentDay: Int = 1

    @State private var vinylSize: CGFloat = 350

    @State private var isChecked = false
    @State private var isRotating = false
    @State private var rotationAngle = 0.0

    // Audio
    @State private var audioPlayer: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "FirstNote", withExtension: "mp3") else {
            print("Sound file not found.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func startVinylAnimation() {
        // Rotate 3600 degrees (10 full rotations over 20 seconds)
        rotationAngle += 3600
    }
    var body: some View {
        
     
        
        
        ZStack {
            Color(.mainLight)
                .ignoresSafeArea()
            VStack{
                
            HStack(spacing: 250) {
                
                ZStack {
                    Text("Day \(currentDay) / $")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.mainBrown)
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing).combined(with: .opacity),
                                removal: .move(edge: .leading).combined(with: .opacity)
                            )
                        )
                }
                .animation(.easeInOut(duration: 0.8), value: currentDay)
                
                Menu {
                    Button("Cancel Journey") {
                        showingActionSheet = true
                    }
                                    } label: {
                    Text("...")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.mainBrown)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .cornerRadius(8)
                }
            }
          .padding(.top, 25)
            Spacer()
         }
         .frame(maxWidth: .infinity, alignment: .top)
            
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors:[  .mainBlue, .mainBrown]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(radius: 30)
                    .padding(.top, 80)
                    .padding(.horizontal, 0.1)
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            print("Play tapped")
                        }) {
                         
                            Image(systemName: "backward.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(.mainLight)
                                        .padding(13)
                                        .background(Color.clear)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Color.mainLight, lineWidth: 2)
                                        )
                        }
                        Button(action: {
                            print("Play tapped")
                        }) {
                           Image(systemName: "play.fill")
                                .font(.system(size: 25))
                                .foregroundColor(.mainLight)
                                .padding(13)
                                .background(Color.clear)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.mainLight, lineWidth: 2)
                                )
                        }
                    }
                    .padding(.trailing, 30)
                    .padding(.top, 100)
                    
                        Rectangle()
                        .fill(.mainLight)
                        .frame(width: 160, height: 1)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                      
                        .padding(.top, 8)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                
                
                ZStack {
                  
                    ZStack {
                        // 🎵 Vinyl image
                        Image("vinylS")
                            .resizable()
                               .frame(width: vinylSize, height: vinylSize)
                               .shadow(radius: 5)
                               .padding(10)
                               .frame(maxWidth: .infinity, alignment: .center)
                               .rotationEffect(.degrees(rotationAngle))
                               .animation(.linear(duration: 10), value: rotationAngle)
                               .animation(.easeInOut(duration: 0.4), value: vinylSize)
                           
                     
                        Button(action: {
                            isChecked.toggle()
                            
                            if isChecked {
                                startVinylAnimation()
                                playSound()
                                
                                withAnimation(.easeInOut(duration: 0.4)) {
                                    vinylSize = 390
                                }

                                // ⏱ Delay day increment by 2 seconds
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.easeInOut(duration: 0.8)) {
                                        if currentDay < 30 {
                                            currentDay += 1
                                        }
                                    }
                                }

                                // 🎯 Reset after 10 seconds
                                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                                    withAnimation(.easeInOut(duration: 0.4)) {
                                        vinylSize = 350
                                        isChecked = false
                                    }
                                }
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(isChecked ? Color.mainBlue : Color.mainLight)
                                    .frame(width: 60, height: 60)
                                    .shadow(radius: 2)

                                Image(systemName: "checkmark")
                                    .font(.system(size: 35, weight: .bold))
                                    .foregroundColor(isChecked ? .white : .mainBlue)
                            }
                        }
                        .offset(y: -1)

                        
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
                        .foregroundColor(.mainLight)
                }
                .offset(y: 290)
            }
            .ignoresSafeArea(edges: .bottom)
             }
        .confirmationDialog(
            "Starting over",
            isPresented: $showingActionSheet,
            titleVisibility: .visible
        ) {
            Button("Resume") {
                // Action for Option 1
            }
            Button("Restart journey", role: .destructive) {
                // Action for Delete
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("do you want to let go of this habit?")
        }
        }
        }


#Preview {
    mainFeatureView()
}

