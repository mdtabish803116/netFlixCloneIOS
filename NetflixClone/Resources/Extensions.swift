//
//  Extensions.swift
//  NetflixClone
//
//  Created by EKINCARE on 10/10/22.
//

import Foundation
import UIKit

extension String {
    func captalizedFirstLetter() -> String{
        self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

extension UIImageView {
    func downloaded(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func download(from link: String) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url)
    }
}
