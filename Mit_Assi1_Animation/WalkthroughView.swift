//
//  WalkthroughView.swift
//  Mit_Assi1_Animation
//
//  Created by user215540 on 3/4/22.
//

import SwiftUI

struct WalkthroughView: View {
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    @State var animationInProgress = false
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    var body: some View {
        GeometryReader{_ in
        NavigationView{
    
            VStack{
                Home()
                    .padding(.top, -40)
                HStack{
                    NavigationLink(destination: LoginView().navigationBarHidden(true)) {
                    Text("Next")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 40)
                        .frame(width: .infinity, height: .infinity, alignment: .trailing)
                        .background(Color.accentColor)
                        .clipShape(Capsule())
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)

                }
                .buttonStyle(FlatLinkStyle())
            }
            }
           
        }
        }
    }
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct Home: View {
    
    @State var multiColor = false
    
    var body: some View{
        
        VStack(spacing: 25){
            
            TextShimmer(text: "Welcome", multiColors: $multiColor)
            TextShimmer(text: "To", multiColors: $multiColor)
            TextShimmer(text: "SwiftUI", multiColors: $multiColor)
            
            Toggle(isOn: $multiColor, label: {
                Text("Enable Multi Colors")
                    .font(.title)
                    .fontWeight(.bold)
            })
            .padding()
            
            }
        .preferredColorScheme(.dark)
        }
    
    }


struct TextShimmer: View {
    
    var text: String
    @State var animation = false
    @Binding var multiColors: Bool
    
    var body: some View{
        
        ZStack{
            
            Text(text)
                .font(.system(size: 75, weight: .bold))
                .foregroundColor(Color.white.opacity(0.25))
            
            HStack(spacing: 0){
                
                ForEach(0..<text.count,id: \.self){index in
                    
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 75, weight: .bold))
                        .foregroundColor(multiColors ? randomColor() : Color.white)
                }
            }
            .mask(
                Rectangle()
                    .fill(
                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white,Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear(perform: {
            
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    
                    animation.toggle()
                }
            })
        }
    }
        
    func randomColor()->Color{
        
        let color = UIColor(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        
        return Color(color)
    }
}

//struct Home: View {
//    var body: some View {
//
//        VStack(spacing: 25) {
//            TextShimmer(text: "Welcome")
//        }
//        .padding(.horizontal,40)
//        .preferredColorScheme(.dark)
//    }
//}
//
//struct TextShimmer: View {
//
//    var text: String
//    @State var animation = false
//    var body: some View {
//
//        VStack {
//
//            Text(text)
//                .font(.system(size: 70, weight: .bold))
//                .foregroundColor(Color.white.opacity(0.5))
//
//            HStack(spacing: 0) {
//                ForEach(0..<text.count, id: \.self) {index in
//                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
//                        .font(.system(size: 70, weight: .bold))
//                        .foregroundColor(randomColor())
//                }
//
//            }
//            .mask(
//                Rectangle()
//                    .fill(
//                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white,Color.white.opacity(0.5) ]), startPoint: .top, endPoint: .bottom)
//                    )
//                    .rotationEffect(.init(degrees:2))
//                    .offset(x: animation ? 500 : 0)
//
//            )
//            .onAppear(perform: {
//                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
//                    animation.toggle()
//                }
//            })
//
//        }
//    }
//
//    func randomColor()->Color{
//        let color = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
//
//        return Color(color)
//    }
//}

struct WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
.previewInterfaceOrientation(.portrait)
    }
}
