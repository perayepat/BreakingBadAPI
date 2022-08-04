//
//  URLImage.swift
//  TheBreakingOfTheBad
//
//  Created by IACD-013 on 2022/06/30.
//

import Foundation
import SwiftUI

struct URLImage: View{
    let url: URL?
    @StateObject private var imageLoader = ImageLoader()
    
    
    var body: some View{
        VStack{
            if let uiImage = imageLoader.uiImage{
                Image(uiImage: uiImage)
                
            } else {
                ProgressView()
            }
        }.task {
            await downloadImage()
        }
    }
    
    
    private func downloadImage() async {
        do{
            try await imageLoader.fetchImage(url)
        }
        catch{
            print(error)
        }
    }
}
