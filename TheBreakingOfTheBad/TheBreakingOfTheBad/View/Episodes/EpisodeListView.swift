    //
    //  EpisodeListView.swift
    //  TheBreakingOfTheBad
    //
    //  Created by IACD-013 on 2022/08/04.
    //

import SwiftUI

struct EpisodeListView: View {
    @EnvironmentObject  var network: Network
    var body: some View {
        ScrollView{
            ForEach(network.episodes,id: \.episode_id){eps in
             EpisodeRowView(episode: eps)
                
            }
            
            .padding()
            .task {
                
                do{
                    try await network.getEpisodes()
                    
                    
                }
                catch{
                    print("Error", error)
                }
                
                
            }
        }
    }
    
    struct EpisodeListView_Previews: PreviewProvider {
        static var previews: some View {
            EpisodeListView()
                .environmentObject(Network())
        }
    }
}
