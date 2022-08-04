    //
    //  EpisodeRow.swift
    //  TheBreakingOfTheBad
    //
    //  Created by IACD-013 on 2022/08/04.
    //

import SwiftUI

struct EpisodeRowView: View {
    var episode: EpisodeElement
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
                .frame(width: 80, height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .opacity(0.8)
                )
                Spacer()
                    
                VStack{
                    Text(episode.title ?? "")
                        .font(.system(size: 15,weight: .bold))
                        .padding(.bottom,1)
                    Text("Season: \(episode.season ?? "")")
                        .font(.callout)
                    Text("Air Date: \(episode.air_date ?? "")")
                        .font(.callout)
                }
                Spacer()
                    .frame(width: 90)
            }
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(lineWidth: 1)
            )
//            .overlay(
//                
//                VStack {
//                    if episode.series == "Breaking Bad" {
//                        Image("brba")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 70, height: 70)
//                    .offset(x: 130, y: -50)
//                    } else {
//                        Image("bcs")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 70, height: 70)
//                    .offset(x: 130, y: -50)
//                    }
//                }
//            )
        .padding([.leading,.trailing], 10)
        }
        
    }
}

struct EpisodeRow_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeRowView(episode: .tempEpisode)
    }
}
