//
//  ViewController.swift
//  Lets Read
//
//  Created by Emad Abd on 26/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boyViewContainer: UIView!
    @IBOutlet weak var girlViewContainer: UIView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
    }

    @IBAction func boyBtn(_ sender: Any) {
        boyViewContainer.borderColor = .white
        girlViewContainer.borderColor = UIColor(rgb: 0x73588D)
    }
    @IBAction func girlBtn(_ sender: Any) {
        boyViewContainer.borderColor = UIColor(rgb: 0x73588D)
        girlViewContainer.borderColor = .white

    }
    
}


extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

