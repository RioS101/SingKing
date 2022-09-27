//
//  ViewModel.swift
//  SingKing
//
//  Created by RS on 27.09.22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var characters: [Character]
    
    init () { self.characters = [] }
    init(characters: [Character]) {
        self.characters = characters
    }
    
    func getData() {
        SimpleAPICaller.fetch(from: Constants.charactersURL, expecting: [Character].self) { [weak self] result in
            switch result {
            case .success(let characters):
                    self?.characters = characters
                print(characters[0].name)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
