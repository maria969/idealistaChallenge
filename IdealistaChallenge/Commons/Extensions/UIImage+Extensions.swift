//
//  File.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL?) {
        guard let url = url else {
            self.image = UIImage.home
            return }
        DispatchQueue.global().async { [weak self] in
            guard let strongSelf = self else { return }
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    strongSelf.image = image
                }
            }
        }
    }
}
