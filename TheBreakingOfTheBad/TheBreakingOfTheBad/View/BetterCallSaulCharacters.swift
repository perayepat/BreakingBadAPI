    //
    //  BetterCallSaulCharacters.swift
    //  TheBreakingOfTheBad
    //
    //  Created by Mphati Maapola on 2022/08/04.
    //

import SwiftUI

struct BetterCallSaulCharacters: View {
    @EnvironmentObject  var network: Network
    var bcsApperences = [ 1, 2, 3, 4, 5 ]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View{
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(network.characters, id: \.char_id) {characterer in
//                        ForEach(characterer.better_call_saul_appearance ?? [], id: \.self){ appearences in
                        if characterer.better_call_saul_appearance.contains(1){
                                NavigationLink{
                                    CharacterDetailView(quotes: network.quotes, character: characterer)
                                }
                            label: {
                                CharacterCardView(character: characterer)
                            }.buttonStyle(.plain)
                            }else{
                                EmptyView()
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

struct BetterCallSaulCharacters_Previews: PreviewProvider {
    static var previews: some View {
        BetterCallSaulCharacters()
    }
}
