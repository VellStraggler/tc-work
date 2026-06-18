//
//  ContentView4.swift
//  MySwiftUIProj
//
//  Created by David Wells on 6/18/26.
//

import SwiftUI

struct ContentView4: View {
    var itemList = ["bush", "did", "9", "11", "where did", "4 trillion dollars go"]
    var itemList2 = [9,11,9,11,9,11,10,9,8,7,6,5,4,3,2,1]
    var body: some View {
        VStack {
            Text("Welcome Back, George")
                .font(.title)
            List {
                Section("Claims") {
                    ForEach(itemList, id: \.self) { word in
                        Text(word)
                    }
                }
                Section("Numbers") {
                    ForEach(itemList2, id: \.self) { number in
                        Text(String(number))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView4()
}
