/**
 Day 7. Assignment 7
 1.Complete the implementation for showing use of list with list of data of ur choice in multiple sections in List in SwiftUI
 2.Show use of different property wrappers like State - Binding StateObject ObservedObject EnvoirmentObject Envorinment Published ObservableObject
 3.Create new project in swiftui to get data from this api and show it in list following MVVM
 https://gist.githubusercontent.com/hart88/79a65d27f52cbb74db7df1d200c4212b/raw/ebf57198c7490e42581508f4f40da88b16d784ba/cakeList
 */

import SwiftUI

struct ContentView: View {
    @StateObject var cakeViewModel = CakeViewModel()
    // init vm
    // create environment network object where that belongs
    var body: some View {
        VStack {
            //call button
            Button(action: {
                cakeViewModel.callCakes()
            },
                   label: {Text("Get Cake List")})
            //list of items
            var i = 0
            List {
                Section("Cakes") {
                    ForEach(cakeViewModel.cakes.prefix(7), id: \.self) { cake in
                        VStack {
                            AsyncImage(url: URL(string: cake.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 200)
                            Text(cake.title)
                                .font(.largeTitle)
                            Text(cake.desc)
                        }
                    }
                }
                Section("Alternatives to Cake") {
                    ForEach(cakeViewModel.cakes.dropFirst(7), id: \.self) { cake in
                        VStack {
                            AsyncImage(url: URL(string: cake.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 200)
                            Text(cake.title)
                                .font(.largeTitle)
                            Text(cake.desc)
                        }
                    }
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
