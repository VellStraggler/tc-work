//
//  CakeViewModel.swift
//  Assignment7
//
//  Created by David Wells on 6/19/26.
//
import Foundation
import SwiftUI
import Combine

@MainActor
class CakeViewModel : ObservableObject {
    @Published var cakes: [Cake] = []
    
    func callCakes() {
        Task {
            await callCakesAsync()
        }
    }
    
    private func callCakesAsync() async {
        guard let url = URL(string: "https://gist.githubusercontent.com/hart88/79a65d27f52cbb74db7df1d200c4212b/raw/ebf57198c7490e42581508f4f40da88b16d784ba/cakeList") else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from:url)
            let decodedCakes = try JSONDecoder().decode([Cake].self, from: data)
            cakes = decodedCakes
        } catch {
            print(error.localizedDescription)
        }
    }
}
