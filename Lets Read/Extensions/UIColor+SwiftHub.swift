//
//  cTextField.swift
//  Jillion
//
//  Created by Emad Abd on 05/05/2022.
//


import Foundation
//import ChameleonFramework

// MARK: Colors

extension UIColor {
    
    static func primary() -> UIColor {
        return themeService.type.associatedObject.primary
    }
    
    static func primaryDark() -> UIColor {
        return themeService.type.associatedObject.primaryDark
    }
    
    static func secondary() -> UIColor {
        return themeService.type.associatedObject.secondary
    }
    
    static func secondaryDark() -> UIColor {
        return themeService.type.associatedObject.secondaryDark
    }
    
    static func separator() -> UIColor {
        return themeService.type.associatedObject.separator
    }
}

// MARK: Averaging a Color

extension UIColor {
    
    static func averageColor(fromImage image: UIImage?) -> UIColor? {
        guard let image = image else {
            return nil
        }
        return UIColor.gray
        
    }
}

// MARK: Randomizing Colors

extension UIColor {
    
//    static func randomColor() -> UIColor {
//        return randomFlat
//    }
}
