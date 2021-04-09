//
//  Extensions.swift
//  PallaviDipke_NewsTask
//
//  Created by Admin on 4/8/21.
//

import UIKit

extension UIImageView {
    func setWebImage(_ path: String) {
        self.contentMode = .scaleAspectFill
        let image = UIImage(named: "placeHolder")
        if !path.isEmpty {
            if let fileURL:URL = URL(string: path) {
                self.sd_setImage(with: fileURL , placeholderImage: image)
            }
        } else {
            self.image = image
        }
    }
}
