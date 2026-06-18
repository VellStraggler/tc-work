//
//  ContentView2.swift
//  MySwiftUIProj
//
//  Created by David Wells on 6/18/26.
//

import SwiftUI

struct ContentView2: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Welcome!")
                            .font(.system(size:42).bold())
                            .padding(.bottom, 6)
                        Text("Sign in to continue")
                            .bold()
                            .foregroundStyle(.gray)
                            .padding(.bottom, 84)
                        TextField("username", text: $username)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .frame(height:1)
                                    .foregroundColor(.gray)
                            }
                            .padding(.bottom, 64)
                        SecureField("password", text: $password)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .frame(height:1)
                                    .foregroundColor(.gray)
                            }
                    }.padding(.trailing, 48)
                        .padding(.bottom, 42)
                        .padding(.top, 96)
                    NavigationLink {
                        ContentView4()
                    } label: {
                        Text("LOGIN")
                            .frame(width: 250, height:36)
                            .background {
                                LinearGradient(
                                    colors: [Color(red:0, green:0, blue:0.8), .blue],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            }
                            .bold()
                            .foregroundColor(.white)
                    }
                    Text("Forgot Password?")
                    HStack {
                        Rectangle()
                            .frame(height:1)
                            .foregroundColor(.gray)
                        Text("or").bold()
                        Rectangle()
                            .frame(height:1)
                            .foregroundColor(.gray)
                    }.padding(.bottom, 48)
                    Text("Social Media Login")
                    HStack(spacing:30) {
                        Image("google.logo")
                            .resizable()
                            .frame(width:36, height:36)
                        Image("facebook.logo")
                            .resizable()
                            .frame(width:36, height:36)
                        Image(systemName: "apple.logo")
                            .resizable()
                            .frame(width:36, height:36)
                    }.padding()
                    HStack {
                        Text("Don't have an account?")
                        NavigationLink {
                            ContentView3()
                        } label : {
                            Text("Sign Up")
                        }
                        Spacer()
                    }
                }.padding()
            }.padding()
        }
    }
}

#Preview {
    ContentView2()
}
