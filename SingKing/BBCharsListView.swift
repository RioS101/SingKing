//
//  ContentView.swift
//  SingKing
//
//  Created by RS on 27.09.22.
//

import SwiftUI
import CachedAsyncImage

struct BBCharsListView: View {
    //TODO: Implementd Dependency Injection Swinject
    @StateObject var viewModel = ViewModel.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters, id: \.self) { character in
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
            .navigationTitle("BB: Characters")
            .onAppear {
                viewModel.getData()
            }
        }
    }
}

struct BBCharsListView_Previews: PreviewProvider {
    static var previews: some View {
        BBCharsListView()
    }
}
