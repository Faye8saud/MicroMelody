//
//  ContentView.swift
//  MicroMelody
//
//  Created by Fay  on 26/09/2025.
//


import SwiftUI


struct mainFeatureView: View {
    var body: some View {
        ZStack {
            Color(.mainLight)
                .ignoresSafeArea()
            VStack{
            HStack(spacing: 250) {
                Text("day 1")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.mainBrown)
                
                Menu {
                    Button("Menu Item 1") { print("Item 1 selected") }
                    Button("Menu Item 2") { print("Item 2 selected") }
                    Button("Menu Item 3") { print("Item 3 selected") }
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
                        Image("vinyl")
                            .resizable()
                            .frame(width: 400, height: 400)
                            .shadow(radius: 5)
                            .offset(x: 10)
                     
                        ZStack {
                                      Circle()
                                .fill(.mainLight)
                                          .frame(width: 60, height: 60)
                                          .shadow(radius: 2)
                                      
                                      Image(systemName: "checkmark")
                                          .font(.system(size: 35, weight: .bold))
                                          .foregroundColor(.mainBlue)
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
                        .foregroundColor(.mainLight)
                }
                .offset(y: 290)
            }
            .ignoresSafeArea(edges: .bottom)
             }
        }
        }


#Preview {
    mainFeatureView()
}

