//
//  ContentView.swift
//  MySwiftUIProj
//
//  Created by David Wells on 6/17/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack() {
                HStack(spacing: 12){
                    Image("lens")
                        .resizable()
                        .frame(width:32,height:32)
                        .padding(.leading, 24)
                    Text("SLOPE")
                        .fontWeight(.heavy)
                    Spacer()
                }.padding(.bottom, 36)
                VStack() {
                    Image("beanbagdude")
                        .resizable()
                        .frame(width:280, height:280)
                        .padding(48)
                    Text("Hello !")
                        .font(Font.largeTitle.bold())
                        .padding(4)
                    Text("Best place to write life stories and share your journey experiences")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 48)
                        .padding(.horizontal, 24)
                    NavigationLink {
                        ContentView2()
                    } label: {
                        Text("LOGIN")
                            .frame(width: 250, height:36)
                            .background(.blue)
                            .padding(.bottom, 12)
                            .bold()
                            .foregroundColor(.white)
                    }
                    NavigationLink {
                        ContentView3()
                    } label: {
                        Text("SIGNUP")
                            .frame(width: 250, height:36)
                            .background(.white)
                            .border(Color.blue, width: 1)
                            .bold()
                    }
                }
                .padding()
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
