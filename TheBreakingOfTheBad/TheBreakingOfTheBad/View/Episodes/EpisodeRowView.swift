    //
    //  EpisodeRow.swift
    //  TheBreakingOfTheBad
    //
    //  Created by IACD-013 on 2022/08/04.
    //

import SwiftUI

struct EpisodeRowView: View {
    var episode: EpisodeElement
    @State var showChacracters: Bool = false
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Episode")
                        .font(.caption)
                        Spacer()
                        .frame( height: 5)
                    Text(episode.episode ?? "")
                        .font(.system(size: 55, weight: .bold))
                }
                .foregroundColor(.white)
                .frame(width: 80, height:showChacracters ? 200:100)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .opacity(0.8)
                )
                
                Spacer()
                    
                VStack{
                    Text(episode.title ?? "")
                        .font(.system(size: 15,weight: .bold))
                        .padding(.bottom,1)
                    Text("\(episode.series ?? "")")
                        .font(.caption)
                    Text("Season: \(episode.season ?? "")")
                        .font(.caption)
                    Text("Air Date: \(episode.air_date ?? "")")
                        .font(.caption2)
                  
                }
                Spacer()
                    
            }
            .frame(height:showChacracters ? 200:100)
       
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(lineWidth: 1)
            )
            .onTapGesture {
                showChacracters.toggle()
            }
            .animation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0), value: showChacracters)
        .padding([.leading,.trailing], 10)
        }
        
    }
}

struct EpisodeRow_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeRowView(episode: .tempEpisode)
    }
}
