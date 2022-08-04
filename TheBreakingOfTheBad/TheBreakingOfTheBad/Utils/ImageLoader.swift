//
//  ImageLoader.swift
//  TheBreakingOfTheBad
//
//  Created by IACD-013 on 2022/06/30.
//

import Foundation
import UIKit
import SwiftUI

enum NetworkError: Error{
    case badRequest
    case usupportedImage
    case badUrl
}

//becasue it needs to be assigned on the main thread we use main actor
@MainActor
class ImageLoader: ObservableObject {
    
    @Published var uiImage: UIImage?
    let targetSize = CGSize(width: 380, height: 450)
  

    func fetchImage(_ url:URL?) async throws {
        
        guard let url = url else {
            throw NetworkError.badUrl
        }
        
        let request = URLRequest(url: url)
        
        let (data, response)  = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let image = UIImage(data: data) else {
            throw NetworkError.usupportedImage
        }
        
        uiImage = image
    }
    
}
