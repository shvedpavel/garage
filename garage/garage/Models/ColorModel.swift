//
//  ColorModel.swift
//  garage
//
//  Created by Apple on 20.11.23.
//

import UIKit

protocol ThemeProtokol {
    var backgroundColor: UIColor { get }
    var buttonColor: UIColor { get }
    var textColor: UIColor { get }
    var textColorForReference: UIColor { get }
}

class Theme {
    static var currentTheme: ThemeProtokol = LichtTheme()
}

class LichtTheme: ThemeProtokol {
    var backgroundColor: UIColor = UIColor(named: "backgroundColor")!
    var buttonColor: UIColor = UIColor(named: "buttonColor")!
    var textColor: UIColor = UIColor(named: "textColor")!
    var textColorForReference: UIColor = UIColor(named: "textColorForReference")!

}

