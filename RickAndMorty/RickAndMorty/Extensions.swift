//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/23/23.
//

import UIKit


extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
