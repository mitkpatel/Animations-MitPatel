//
//  SplashScreenView.swift
//  Mit_Assi1_Animation
//
//  Created by user215540 on 3/4/22.
//

import SwiftUI
import UIKit
import Lottie

struct SplashScreenView: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            ContentView()
            ZStack {
                Color("ColorBlackLight")
                
                Image("MainLogo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animatesplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animatesplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.45)) {
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 0.35)) {
                endSplash.toggle()
            }
        }
    }
}

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    @State var animationInProgress = false
    let heading = Array("Drag Me - Mit");
    @State private var amount = 1.0
    
    var body: some View {
    
        NavigationView {
        GeometryReader{_ in
        
            VStack(alignment: .center){
                
                Image("LoginLogo")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(20)
                .padding(.top, -100)
                
                HStack(alignment: .center, spacing: 2) {
                    ForEach(0..<heading.count) {
                        num in
                        Text(String(self.heading[num]))
                            .padding(5)
                            .font(.title)
                            .background(self.enabled ? Color.blue : Color.red)
                            .offset(self.dragAmount)
                            .animation(Animation.default.delay(Double(num / 10)))
                            .padding(.top, -20)
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged{self.dragAmount = $0.translation}
                        .onEnded{ _ in
                            withAnimation(.spring()) {
                                self.dragAmount = .zero
                                self.enabled.toggle()
                            }
                        }
                )
                
                VStack(alignment: .leading){
                    Text("My First Animation App")
                        .font(.title).bold()
                    Image("Player")
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 250, height: 250, alignment: .center)
                        .padding(.horizontal, 50)
                    
                    if animationInProgress {
                        LottieView(animationInProgress: $animationInProgress)
                            .frame(width: 200, height: 200, alignment: .center)
                            .padding(.horizontal, 60)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        animationInProgress.toggle()
                    }) {
                        Text("Like my App")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 30)
                            .background(Color.accentColor)
                            .clipShape(Capsule())
                            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)

                    }
                    .padding(.horizontal, 90)


                }
                .padding(.vertical, 20)
                .padding(.top, 10)
                
                HStack{
                    NavigationLink(destination: WalkthroughView().navigationBarBackButtonHidden(true)) {
                        Text("Next")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .frame(width: .infinity, height: .infinity, alignment: .trailing)
                            .background(Color.red)
                            .clipShape(Circle())
                            .overlay(
                                    Circle()
                                        .stroke(.red)
                                        .scaleEffect(amount)
                                        .opacity(2 - amount)
                                        .animation(
                                            .easeInOut(duration: 2)
                                                .repeatForever(autoreverses: false),
                                            value: amount
                                        )
                            )
                            .onAppear {
                                amount = 2
                            }
                        }
                    

                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 42)
        }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
