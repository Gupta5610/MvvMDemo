//
//  ImageDownloaderService.swift
//  NotificationServiceExtentsion
//
//  Created by ashish on 10/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation

class ImageDownloaderService {
    
    static var instance = ImageDownloaderService()
    
    func downloadImage(at urlString: String, completetion: @escaping (URL) -> (Void)) {
        guard let url = URL(string : urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let fileManager = FileManager.default
            
            guard let data = data , let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
            
            let fileUrl = documentsUrl.appendingPathComponent("Image.jpg")
            do {
                try data.write(to: fileUrl)
                DispatchQueue.main.async {
                    completetion(fileUrl)
                }
            }catch {
                print(error.localizedDescription)
            }
            }.resume()
    }
    
}
