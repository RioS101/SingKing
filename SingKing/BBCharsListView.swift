//
//  ContentView.swift
//  SingKing
//
//  Created by RS on 27.09.22.
//

import SwiftUI
import CachedAsyncImage

struct BBCharsListView: View {
    @StateObject var viewModel: ViewModel
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredCharacters, id: \.self) { character in
                    HStack {
                        CachedAsyncImage(url: URL(string: character.imageURL), scale: 0.2) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 70, height: 80)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(35)

                        Spacer()
                        
                        Text(character.name)
                            .bold()
                        
                        Spacer()
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("BB: Characters")
            .onAppear {
                viewModel.getData()
            }
        }
    }
    
    var filteredCharacters: [Character] {
        return searchText.isEmpty ? viewModel.characters : viewModel.characters.filter({
            $0.name.lowercased().contains(searchText.lowercased())
        })
    }
}

struct BBCharsListView_Previews: PreviewProvider {
    static var previews: some View {
        BBCharsListView(viewModel: ViewModel())
    }
}
