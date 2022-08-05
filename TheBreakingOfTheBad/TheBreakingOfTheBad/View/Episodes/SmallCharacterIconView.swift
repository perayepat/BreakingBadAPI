//
//  SmallCharacterIconView.swift
//  TheBreakingOfTheBad
//
//  Created by IACD-013 on 2022/08/04.
//

import SwiftUI

struct SmallCharacterIconView: View {
    var character : CharacterElement
    var body: some View {
        VStack{
            CacheAsyncImage(
                url: URL(string: character.img ?? "")!
               ) { phase in
                   switch phase {
                   case .success(let image):
                           image
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .clipShape(Circle())
                               .frame(width: 100,height: 100)
                   case .failure(let error):
                       ErrorView(error: error)
                   case .empty:
                       HStack {
                           ProgressView()
                               .progressViewStyle(CircularProgressViewStyle(tint: .red))
                       }
                   @unknown default:
                       // AsyncImagePhase is not marked as @frozen.
                       // We need to support new cases in the future.
                       Image(systemName: "questionmark")
                   }
               }
        }
    }
}

struct SmallCharacterIconView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCharacterIconView(character: .tempCharacter)
        
    }
}
