//
//  ViewModel.swift
//  SingKing
//
//  Created by RS on 27.09.22.
//

import Foundation
//import SwiftUI ???

//TODO: Add protocols

class ViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    static let shared = ViewModel()
    
    private init() {}
    
    func getData() {
        SimpleAPICaller.fetch(from: Constants.charactersURL, expecting: [Character].self) { [weak self] result in
            switch result {
            case .success(let characters):
//                DispatchQueue.main.async {
                    self?.characters = characters
//                }
                print(characters[0].name)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
