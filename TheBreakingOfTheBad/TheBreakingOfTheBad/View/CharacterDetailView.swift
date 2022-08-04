    //
    //  CharacterDetailView.swift
    //  TheBreakingOfTheBad
    //
    //  Created by IACD-013 on 2022/06/24.
    //

import SwiftUI

struct CharacterDetailView: View {
    var quotes: [QuoteElement]?
    var charQuotes = QuoteElement(quote_id: 0, quote: "", author: "", series: "")
    var character : CharacterElement?
        //get the character and check if they have a quote to print
    
    var body: some View {
        
        ZStack {
            VStack {
                
                AsyncImage(url: URL(string: character!.img), content: { image in
                    image.resizable()
                        .frame(width: 380, height: 450)
                        .aspectRatio(contentMode: .fit)
                    
                    
                }, placeholder: {
                    ProgressView()
                })
                Spacer()
            }.ignoresSafeArea()
            
            VStack{}
                .frame(width: 380, height: 300)
                .background(
                    LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), location: 0),
                        Gradient.Stop(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0.50),
                    ]), startPoint: .top, endPoint: .bottom)
                )
                .position(x: 190, y: 280)
            
            VStack{
                
                ScrollView {
                    Text(character!.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer(minLength: 40)
                    HStack{
                        Text("Portayed by:")
                        Text(character!.portrayed)
                    }
                    Spacer(minLength: 20)
                    HStack{
                        Text("Nickname :")
                        Text(character!.nickname)
                    }
                    Spacer(minLength: 20)
                    HStack{
                        Text("Occupation :")
                        VStack {
                            Text(character!.occupation[0])
                        }
                    }
                    Spacer(minLength: 40)
                    Text("Quotes")
                        .font(.title)
                        .fontWeight(.bold)
                    ForEach(quotes!, id: \.quote_id) { quote in
                        if (quote.author == character!.name){
                        Text(quote.quote)
                                .padding()
                                .multilineTextAlignment(.center)
                                .lineSpacing(10)
                                .font(.body)
                        }
                        else{
                            Text("")
                        }
                    }
                }
                
            }
            .position(x: 190, y: 660)
        }
        
    }
    
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView()
    }
}
