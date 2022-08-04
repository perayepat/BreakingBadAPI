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
                VStack {
                    HStack {
                        VStack {
                            Text("Episode")
                                .font(.caption)
                            Spacer()
                                .frame( height: 5)
                            Text(eps.episode ?? "")
                                .font(.system(size: 55, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .opacity(0.8)
                        )
                        Spacer()
                        
                        VStack{
                            Text(eps.title ?? "")
                                .font(.system(size: 15,weight: .bold))
                                .padding(.bottom,1)
                            Text("Season: \(eps.season ?? "")")
                                .bold()
                                .font(.caption)
                            Text("Air Date: \(eps.air_date ?? "")")
                                .font(.caption2)
                            Text("Air Date: \(eps.series ?? "")")
                                .font(.caption2)
                        }
                        Spacer()
                            
                    }
                    .background(
                        
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(lineWidth: 1)
                    )
                    
                }
                
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
