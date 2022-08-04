    //
    //  ContentView.swift
    //  TheBreakingOfTheBad
    //
    //  Created by IACD-013 on 2022/06/22.
    //

import SwiftUI

struct ContentView: View {
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
                    }.buttonStyle(.plain)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
