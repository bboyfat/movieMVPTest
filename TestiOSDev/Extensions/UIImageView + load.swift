//
//  UIImageView + load.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit


extension UIImageView {
    
    func load(_ url: String) {
        guard let url = URL(string: url) else { return }
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let image = UIImage(data: data ?? Data())
                DispatchQueue.main.async {
                    self.image = image
                }
            }.resume()
        }
    }
    
}
