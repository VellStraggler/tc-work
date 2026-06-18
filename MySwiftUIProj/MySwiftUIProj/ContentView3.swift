//
//  ContentView3.swift
//  MySwiftUIProj
//
//  Created by David Wells on 6/18/26.
//

import SwiftUI

struct ContentView3: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationStack {
            VStack{
                    VStack(alignment: .leading) {
                        Text("Hi!")
                            .font(.system(size:42).bold())
                            .padding(.bottom, 6)
                        Text("Create a new account")
                            .bold()
                            .foregroundStyle(.gray)
                            .padding(.bottom, 48)
                        TextField("username", text: $username)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .frame(height:1)
                                    .foregroundColor(.gray)
                            }
                            .padding(.bottom, 64)
                        TextField("email", text: $email)
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
                        .background(.blue)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 36)
                }
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
                    Text("Already have an account?")
                    NavigationLink {
                        ContentView2()
                    } label: {
                        Text("Sign In")
                    }
                    Spacer()
                }
            }.padding(24)
        }
    }
}

#Preview {
    ContentView3()
}
