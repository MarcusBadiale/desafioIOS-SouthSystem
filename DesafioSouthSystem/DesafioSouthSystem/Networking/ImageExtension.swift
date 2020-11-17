//
//  ImageExtension.swift
//  DesafioSouthSystem
//
//  Created by Marcus Vinicius Vieira Badiale on 17/11/20.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImageWithUrlString(string: String) {
        
        guard let url = URL(string: string) else { return }
        
        if let imageFromCache = Cache.imageCache.object(forKey: string as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                print(err)
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                
                let imageToCache = UIImage(data: data)
                
                Cache.imageCache.setObject(imageToCache!, forKey: string as NSString)
                
                self.image = imageToCache
            }
        }.resume()
    }
}
