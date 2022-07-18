//
//  CustomModalView.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 18/07/2022.
//

import SwiftUI

struct CustomModalView: View {
    
    @State var showModal = false
    
    var body: some View {
        Button(action: {
            showModal = true
        }) {
            Text("Sign in")
        }
        
        if showModal {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showModal = false
                    }
                
                SignInView()
            }
        }
    }
}

struct CustomModalView_Previews: PreviewProvider {
    static var previews: some View {
        CustomModalView()
    }
}

struct GradientIcon: View {
    var icon: String = "envelope.fill"
    var gradient = [Color(#colorLiteral(red: 0.5098039216, green: 0.2549019608, blue: 0.737254902, alpha: 1)), Color(#colorLiteral(red: 0.8823529412, green: 0.2823529412, blue: 0.5215686275, alpha: 1)), Color(#colorLiteral(red: 0.9843137255, green: 0.6470588235, blue: 0.5450980392, alpha: 1))]
    
    var body: some View {
        ZStack {
            Image(systemName: icon)
                .frame(width: 36, height: 36)
                .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
                .cornerRadius(12)
                .foregroundColor(.white)
        }
    }
}

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @ViewBuilder
    var body: some View {
        ZStack() {
            VStack(spacing: 16.0) {
                Text("Sign in")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: 335, alignment: .leading)
                
                Text("Access to 120+ hours of courses, tutorials and livestreams")
                    .font(.subheadline)
                    .frame(maxWidth: 335, alignment: .leading)
                    .opacity(0.7)
                
                HStack {
                    GradientIcon()
                    TextField("Email address", text: $email)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
                .padding(8)
                .frame(width: 335, height: 52, alignment: .leading)
                .background(Color.white)
                .cornerRadius(20)
                
                HStack {
                    GradientIcon(icon: "key.fill")
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
                .padding(8)
                .frame(width: 335, height: 52, alignment: .leading)
                .background(Color.white)
                .cornerRadius(20)
                
                GradientButton(text: "Sign in")
                
                Rectangle()
                    .frame(maxWidth: 335, maxHeight: 1)
                    .foregroundColor(.black).opacity(0.1)
                
                HStack(spacing: 0) {
                    Text("Don’t have an account? ")
                        .opacity(0.7)
                    Text("Sign up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .frame(maxWidth: 335, alignment: .leading)
                
                HStack(spacing: 0) {
                    Text("Forgot password? ")
                        .opacity(0.7)
                    Text("Reset Password")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .frame(maxWidth: 335, alignment: .leading)
                
                HStack(spacing: 0) {
                    Text("Don't have a password yet? ")
                        .opacity(0.7)
                    Text("Set Password")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .frame(maxWidth: 335, alignment: .leading)
            }
            .padding(20)
            
        }
        .frame(width: UIScreen.main.bounds.size.width)
        .background(Color.white)
        .cornerRadius(30)
    }
}

struct GradientButton: View {
    var text: String = "Text here"
    var gradient = [Color(#colorLiteral(red: 0.7294117647, green: 0.4588235294, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.2235294118, green: 0.07450980392, blue: 0.7215686275, alpha: 1))]
    
    var body: some View {
        VStack {
            VStack {
                Text(text)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(16)
            .foregroundColor(.white)
            
        }
    }
}
