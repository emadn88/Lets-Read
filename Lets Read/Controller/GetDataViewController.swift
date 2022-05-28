//
//  GetDataViewController.swift
//  Lets Read
//
//  Created by Emad Abd on 27/05/2022.
//

import UIKit
import GlowingView

class GetDataViewController: UIViewController {
    var isClick = "0"
    @IBOutlet weak var settingVC: UIView!
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var showSetting: UIButton!
    
    @IBOutlet weak var activeSelectGril: UIButton!
    @IBOutlet weak var selectGirle: UIButton!
    @IBOutlet weak var mutallBtn: UIButton!

    @IBOutlet weak var unmuteBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingVC.alpha = 0
        activeSelectGril.isHidden = true
        userNameTxt.attributedPlaceholder = NSAttributedString(
                string: "أدخل اسمك هنا",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
        
        unmuteBtn.isHidden = true
        
        settingVC.layer.shadowOffset = .zero
        settingVC.layer.shadowColor = UIColor(rgb: 0x73588D).cgColor
        settingVC.layer.shadowRadius = 10
        settingVC.layer.shadowOpacity = 1
        settingVC.layer.shadowPath = UIBezierPath(rect: settingVC.bounds).cgPath
        
  
        
    }
    @IBAction func selectGirleBtn(_ sender: Any) {
        let image = UIImage(named: "narrating-child-green.png")! as UIImage
 

    }
    
    @IBAction func hideSelectGirle(_ sender: Any) {
        activeSelectGril.fadeIn()
        selectGirle.isHidden = true
    }
    @IBAction func showSelectGirle(_ sender: Any) {
        activeSelectGril.fadeOut()
        selectGirle.isHidden = false
    }
    
    @IBAction func showSettings(_ sender: Any) {
        settingVC.fadeIn()
        showSetting.isHidden = true
     }
    
    @IBAction func hideSettings(_ sender: Any) {
        settingVC.fadeOut()
        showSetting.isHidden = false
    }
    
    @IBAction func mute(_ sender: Any) {
        mutallBtn.isHidden = true
        unmuteBtn.isHidden = false

        print("0")
    }
    
    @IBAction func unMute(_ sender: Any) {
        unmuteBtn.isHidden = true
        
        mutallBtn.isHidden = false

        print("1")

    }
    
}
extension UIView {
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }

    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.isHidden = true
            self.alpha = 0.0
        }, completion: completion)
    }
    
    enum GlowEffect: Float {
        case small = 0.4, normal = 2, big = 30
    }

    func doGlowAnimation(withColor color: UIColor, withEffect effect: GlowEffect = .normal) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowRadius = 0
        layer.shadowOpacity = 0.8
        layer.shadowOffset = .zero

        let glowAnimation = CABasicAnimation(keyPath: "shadowRadius")
        glowAnimation.fromValue = 0
        glowAnimation.toValue = effect.rawValue
        glowAnimation.fillMode = .removed
        glowAnimation.repeatCount = .infinity
        glowAnimation.duration = 2
        glowAnimation.autoreverses = true
        layer.add(glowAnimation, forKey: "shadowGlowingAnimation")
    }
    
}
