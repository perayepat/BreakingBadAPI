    //
    //  CharacterCardView.swift
    //  TheBreakingOfTheBad
    //
    //  Created by IACD-013 on 2022/06/23.
    //

import SwiftUI

struct CharacterCardView: View {
    var character : CharacterElement?
    @State var isFavourited: Bool = false
    
    var body: some View {
        ZStack {
            
            
            VStack {
                CacheAsyncImage(
                    url: URL(string: character!.img)!
                   ) { phase in
                       switch phase {
                       case .success(let image):
                               image
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 160,height: 220)
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
            Color.white
                .frame(width: 200, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .position(x: 80, y: 180)
            
            VStack(spacing: 5){
                
                Text(character!.name)
                    .fontWeight(.bold)
                
                HStack(alignment: .center){
                    Text("Potrayed By:")
                        .font(.system(size: 9))
                        .fontWeight(.light)
                    Text(character!.portrayed)
                        .font(.system(size: 9))
                }
                
                HStack(alignment: .center){
                    Text("Nickname :")
                        .font(.system(size: 9))
                        .fontWeight(.light)
                    Text(character!.nickname)
                        .font(.system(size: 9))
                }
                
                
                
            }
            .frame(maxWidth:.infinity)
            .frame(height: 80)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)),Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                
            )
            .position(x: 80, y: 180)
            .cornerRadius(10)
            
                //favourite section
            Button {
                isFavourited.toggle()
            } label: {
                if isFavourited {
                    Image(systemName: "heart.fill")
                }
                else{
                    Image(systemName: "heart")
                }
            }
            .position(x: 20, y: 20)
            .tint(.red)
            
            
        }  .frame(width: 160, height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 3, x: 2, y: 2)
        
        
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        CharacterCardView(character: previewChar)
            .previewLayout(.sizeThatFits)
        
    }
}
