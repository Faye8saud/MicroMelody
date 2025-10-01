//
//  homeView.swift
//  MicroMelody
//
//  Created by Fay  on 01/10/2025.
//

import SwiftUI

struct homeView: View {
// 1. حالة لتحديد ما إذا كانت صفحة "الإضافة" مفتوحة أم لا
@State private var isShowingAddView = false

var body: some View {
ZStack {
// الخلفية المتدرجة
LinearGradient(gradient: Gradient(colors: [
Color(hex: "DEC9AE"), // لون البيج الفاتح
Color.white
]), startPoint: .top, endPoint: .bottom)
.ignoresSafeArea()

VStack {
// شريط العنوان (Micro Melody)
HStack {
Text("Micro Melody")
.font(.system(size: 28, weight: .bold))
.foregroundColor(Color(hex: "756354")) // لون نص مشابه للون الصورة
Spacer()
}
.padding(.horizontal)
.padding(.top, 50) // لإنزاله قليلاً من حافة الشاشة

// خط فاصل تحت العنوان
Rectangle()
.frame(height: 1)
.foregroundColor(Color(hex: "DEC9AE"))
.padding(.horizontal)

Spacer()

// نص الاقتباس في المنتصف
Text("“Motivation is what gets you started. Habit is what keeps you going”")
.font(.system(size: 20, weight: .regular))
.foregroundColor(Color(hex: "999999")) // رمادي خافت
.multilineTextAlignment(.center)
.padding(.horizontal, 40)

Spacer()
Spacer() // مسافة أكبر بين النص والزر

// الزر الزائد (Action Button)
Button {
// **هنا يتم تنفيذ الأكشن عند الضغط على الزر**
// لغرض التجربة، سيتم فقط طباعة رسالة في الكونسول وفتح شاشة وهمية
print("Action Button Pressed! Ready to add new item.")
self.isShowingAddView = true // تفعيل الأكشن لفتح شاشة
} label: {
Image(systemName: "plus")
.font(.system(size: 30, weight: .bold))
.foregroundColor(.white)
.frame(width: 65, height: 65)
.background(Color(hex: "0A3644")) // لون أزرق/أخضر داكن
.clipShape(Circle())
}
.padding(.bottom, 30) // رفعه قليلاً فوق شريط القائمة السفلي

// الخط الأفقي السفلي الذي يظهر في الصورة
Rectangle()
.frame(height: 1)
.foregroundColor(Color(hex: "DEC9AE"))
.padding(.horizontal, 80)
.padding(.bottom, 8)
}
}
// إضافة شاشة وهمية تفتح عند الضغط على الزر
.sheet(isPresented: $isShowingAddView) {
// هنا يمكنك وضع الـ View التي تريد عرضها (مثل شاشة إضافة جديدة)
NewItemView()
}
}
}

// MARK: - NewItemView (شاشة تفتح عند الضغط على زر الزائد)

struct NewItemView: View {
@Environment(\.dismiss) var dismiss

var body: some View {
VStack {
Text("New Item Added Successfully! 🎉")
.font(.largeTitle)
.padding()

Button("Dismiss") {
dismiss()
}
.padding()
}
}
}


#Preview {
homeView()
}
