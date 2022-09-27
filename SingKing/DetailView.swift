//
//  DetailView.swift
//  SingKing
//
//  Created by RS on 28.09.22.
//

import SwiftUI
import CachedAsyncImage

struct DetailView: View {
    @State var character: Character
    
    var body: some View {
        
        
        Form {
            Section {
                CachedAsyncImage(url: URL(string: character.imageURL), scale: 0.5) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fill)
            }
            
            Section {
                Text("Nickname: \(character.nickname)")
                Text("Portrayed: \(character.portrayed)")
                Text("Birthday: \(character.birthday)")
                Text("Status: \(character.status)")
            }
        }
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
