//
//  logoView.swift
//  MicroMelody
//
//  Created by Fay  on 01/10/2025.
//

import SwiftUI
struct logoView: View {

let topGradientColor: Color = Color(hex: "#DEC9AE")
let bottomGradientColor: Color = Color.white

let logoWidth: CGFloat = 350
let logoHeight: CGFloat = 350

let appTitle: String = "Micro Melody"

var body: some View {
ZStack {
LinearGradient(
gradient: Gradient(colors: [
topGradientColor,
bottomGradientColor
]),
startPoint: .top,
endPoint: .bottom
)
.ignoresSafeArea(edges: .all)

VStack {
Spacer()
if UIImage(named: "logo") != nil {
Image("logo")
.resizable()
.scaledToFit()
.frame(width: logoWidth, height: logoHeight)
.clipped()

} else {
Rectangle()
.fill(Color.gray)
.frame(width: logoWidth, height: logoHeight)
.overlay(
Text("No Logo Found")
.foregroundColor(.white)
.bold()
)
}
    /*
Text(appTitle)
.font(
.system(
size: 36,
weight: .bold,
design: .default
)
)
.foregroundColor(Color.black)
.multilineTextAlignment(.center)
.offset(y : -100)
*/
Spacer()

}

}
}
}


#Preview {
logoView()
}
