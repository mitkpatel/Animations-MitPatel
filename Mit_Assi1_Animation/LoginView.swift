//
//  LoginView.swift
//  Mit_Assi1_Animation
//
//  Created by user215540 on 2/24/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        LoginPage()
            .preferredColorScheme(.dark)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginPage : View {
    
    @State var index = 0
    @State private var showDetails = false
    @State private var enabled = false
    @State var amount = 0.0
    @State var amount1 = 0.0
    @State var amount2 = 0.0
    @State var amount3 = 0.0
    
    func moveRight(view: UIView) {
        view.center.x += 100
    }
    
    func moveLeft(view: UIView) {
        view.center.x -= 100
    }
    
 
    var body: some View{
        
        
        GeometryReader{_ in

            VStack{
                
                Image("LoginLogo")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(20)
                .padding(.top, -80)
                
                ZStack{
                    
                    SignupSection(index: self.$index)
                        .zIndex(Double(self.index))
                    
                    LoginSection(index: self.$index)

                }
                
                HStack(spacing: 20){
                    
                    Rectangle()
                    .fill(Color("ColorRed"))
                    .frame(height: 2)
                    
                    Text("Social Media")
                        .fontWeight(.bold)
                    
                    Rectangle()
                    .fill(Color("ColorRed"))
                    .frame(height: 2)
                }
                .padding(.horizontal, 25)
                .padding(.top, 40)
                
                HStack(spacing: 40){
                    
                    Button(action: {
                        withAnimation {
                            amount += 360
                        }
                    }) {
                        
                        Image("linkedin")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .rotation3DEffect(.degrees(amount), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: 0, y: 5)

                    }
                    
                    Button(action: {
                        withAnimation {
                            amount1 += 360
                        }
                    }) {
                        
                        Image("apple")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .rotation3DEffect(.degrees(amount1), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: 0, y: 5)
                        
                    }
                    
                    
                    Button(action: {
                        withAnimation {
                            amount2 += 360
                        }
                    }) {
                        
                        Image("twitter")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .rotation3DEffect(.degrees(amount2), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: 0, y: 5)
                    }
                    
                    Button(action: {
                        withAnimation {
                            amount3 += 360
                        }
                    }) {
                        
                        Image("facebook")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .rotation3DEffect(.degrees(amount3), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: 0, y: 5)
                        
                    }
                }
                .padding(.top, 30)
                
                VStack{
                    Button (action: {
                        withAnimation{
                            self.enabled.toggle()
                            showDetails.toggle()
                        }
                    }) {
                        Text("Show/hide details").font(.system(size: 25))
                            .frame(width: 250, height: 60)
                            .background(enabled ? Color.blue : Color.red)
                            .animation(nil)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                            .animation(.interpolatingSpring(stiffness: 10, damping: 1))
                    }
                    
                }
                .padding(.top, 30)
                
                if showDetails {
                    Text("Assignment 1 - Mit Patel")
                        .transition(.move(edge: .top))
                        .animation(Animation.easeOut(duration: 0.9).delay(0.1))
                        .lineLimit(1)
                        .font(.headline)
                        .padding(.top,5)
                    Text("Play with animations")
                        .transition(.slide)
                        .animation(Animation.easeIn(duration: 0.9).delay(0.3))
                        .lineLimit(1)
                        .padding(.top,5)
                    Text("Click on Social Media icons")
                        .transition(.scale)
                        .animation(Animation.linear(duration: 1).delay(0.6))
                        .lineLimit(1)
                        .padding(.top,5)
                }
                
            }
            
            .padding(.vertical)
        }
        .background(Color("ColorBlack").edgesIgnoringSafeArea(.all))
    }
}

// Shape for the right side

struct RightSection : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
}

// Shape for the left side
struct LeftSection : Shape {

    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}

struct LoginSection : View {
    
    @State var email = ""
    @State var password = ""
    @Binding var index : Int
    @State private var animationAmount = 1
    @State private var amount = 0.0
    @State var isActive = false
    
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
            VStack{
                
                HStack{
                    
                    VStack(spacing: 10){
                        
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 25)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope.fill")
                        .foregroundColor(Color("ColorRed"))
                        
                        TextField("Email", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "eye.slash.fill")
                        .foregroundColor(Color("ColorRed"))
                        
                        SecureField("Password", text: self.$password)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Forget Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()

            .padding(.bottom, 65)
            .background(Color("ColorLightBlack"))
            .clipShape(RightSection())
            .contentShape(RightSection())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
            
                self.index = 0
                    
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
                    
         
            Button(action: {
                withAnimation {
                    amount += 360
                }
            }) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical, 25)
                    .padding(.horizontal, 30)
                    .background(Color("ColorRed"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: 0, y: 5)
                    .rotation3DEffect(.degrees(amount), axis: (x: 0, y: 1, z: 0))

            }
            .offset(y: 30)
            .opacity(self.index == 0 ? 1 : 0)
            
        }
    }
}

// Section for the Signup
struct SignupSection : View {
    
    @State var email = ""
    @State var password = ""
    @State var ConPassword = ""
    @Binding var index : Int
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 20)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope.fill")
                        .foregroundColor(Color("ColorRed"))
                        
                        TextField("Email", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "eye.slash.fill")
                        .foregroundColor(Color("ColorRed"))
                        
                        SecureField("Password", text: self.$password)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "eye.slash.fill")
                        .foregroundColor(Color("ColorRed"))
                        
                        SecureField("Confirm Password", text: self.$ConPassword)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("ColorLightBlack"))
            .clipShape(LeftSection())
            .contentShape(LeftSection())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
            
                self.index = 1
                    
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            Button(action: {
                
            }) {
                
                Text("Signup")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("ColorRed"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }

            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }

}
