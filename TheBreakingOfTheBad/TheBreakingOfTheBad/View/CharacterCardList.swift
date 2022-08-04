    //
    //  CharacterCardList.swift
    //  TheBreakingOfTheBad
    //
    //  Created by IACD-013 on 2022/06/30.
    //

import SwiftUI

struct CharacterCardList: View {
    @EnvironmentObject  var network: Network
    @State var chracterName = ""
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(network.characters, id: \.char_id) {characterer in
                        NavigationLink{
                            CharacterDetailView(quotes: network.quotes, character: characterer)
                            
                        }
                    label: {
                        CharacterCardView(character: characterer)
                    }
                    }
                }
                
            }
            .navigationTitle("Characters")
        }
        .onAppear{
            network.getCharacters()
        }
        .task {
            do{
                try await network.getQuotes()
                
            }
            catch{
                print("Error", error)
            }
            
        }
    }
}

struct CharacterCardList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardList()
            .environmentObject(Network())
    }
}
