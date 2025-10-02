//
//  finalView.swift
//  MicroMelody
//
//  Created by Fay  on 01/10/2025.
//


import SwiftUI

import AVFoundation



struct finalView: View {

    @State private var navigateToMainMenu = false
    
    @State private var confettiCounter = 0

    @State private var showCongrats = false

    @State private var vinylSize: CGFloat = 350

    @State private var rotationAngle = 0.0

    @State private var isChecked = false

    @State private var audioPlayer: AVAudioPlayer?

    @AppStorage("habitName") private var habitName: String = ""

    func startVinylAnimation() {

        // Rotate 3600 degrees (10 full rotations over 20 seconds)

        rotationAngle += 3600

    }

    

    

    func playSound() {

        guard let url = Bundle.main.url(forResource: "Final Songg", withExtension: "mp3") else {

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



    

    

    @AppStorage("currentDay") private var currentDay: Int = 1



    var body: some View {

        

        NavigationStack {

            ZStack{
            Image("finalBg")
                   .resizable()
                   .scaledToFill()
                   .ignoresSafeArea()
                
                
                VStack {
                    
                    Spacer()
                    
                    
                    
                    Text(" \(habitName)")
                    
                        .font(.custom("arial rounded mt bold", size: 40))
                    
                        .font(.title)
                    
                        .fontWeight(.bold)
                    
                        .foregroundColor(.mainBlue)
                    
                        .font(.system(size: 24))
                    
                    
                    
                    Spacer()
                    
                    ZStack {
                        
                        ZStack {
                            
                            
                            
                            ZStack {
                                
                                // 🎵 Vinyl image
                                
                                Image("vinylS")
                                
                                    .resizable()
                                
                                    .frame(width: vinylSize, height: vinylSize)
                                
                                    .shadow(radius: 5)
                                
                                    .padding()
                                
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                    .rotationEffect(.degrees(rotationAngle))
                                
                                    .animation(.linear(duration: 60), value: rotationAngle)
                                
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
                                    
                                    
                                }
                                
                                
                                
                                
                                
                                
                                
                                Image("vinyleneedle")
                                
                                    .resizable()
                                
                                    .frame(width: 90, height: 300)
                                
                                    .rotationEffect(.degrees(25), anchor: .topLeading) // tilting the needle
                                
                                    .offset(x: 190, y: -90)  //  for alignment over vinyl
                                
                            }
                            
                            Spacer()
                            
                                .offset(y: 75)
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    Spacer()
                    
                    
                    
                    HStack(spacing: 20) {
                        
                        Button(action: {
                            startVinylAnimation()
                            playSound()
                        }) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Repeat")
                                    .font(.custom("arial rounded mt bold", size: 19))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.mainBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        
                        
                        Button(action: {
                            navigateToMainMenu = true
                        }) {
                            HStack {
                                Image(systemName: "plus")
                                Text("New Habit")
                                    .font(.custom("arial rounded mt bold", size: 19))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.mainBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        
                    }
                    
                    .padding(.horizontal)
                    
                    
                    
                    Spacer()
                    
                }
            }
        }
        .onAppear {
            startVinylAnimation()
            playSound()
        }
        .navigationDestination(isPresented: $navigateToMainMenu) {
            mainMenuView()
        }

    }

}



#Preview {

    finalView()

}


