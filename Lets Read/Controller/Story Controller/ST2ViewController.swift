//
//  ST2ViewController.swift
//  Lets Read
//
//  Created by Emad Abd on 28/05/2022.
//

import UIKit

class ST2ViewController: UIViewController {

    @IBOutlet weak var txt1: UILabel!
    @IBOutlet weak var txt2: UILabel!
    @IBOutlet weak var txt3: UILabel!
    @IBOutlet weak var txt4: UILabel!
    @IBOutlet weak var txt5: UILabel!
    
    @IBOutlet weak var tranLb: UILabel!
    @IBOutlet weak var dicBtn: UIButton!
    
    
    @IBOutlet weak var settingVC: UIView!
    @IBOutlet weak var showSetting: UIButton!
    
    @IBOutlet weak var activeSelectGril: UIButton!
    @IBOutlet weak var selectGirle: UIButton!
    @IBOutlet weak var mutallBtn: UIButton!

    @IBOutlet weak var unmuteBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dicBtn.isHidden = true
        tranLb.isHidden = true
        Timer.scheduledTimer(timeInterval: 8,
            target: self,
            selector: #selector(ST2ViewController.changeTxt),
            userInfo: nil,
            repeats: false)
        
        
        
        
        self.settingVC.alpha = 0
        activeSelectGril.isHidden = true
        
        unmuteBtn.isHidden = true
        
        settingVC.layer.shadowOffset = .zero
        settingVC.layer.shadowColor = UIColor(rgb: 0x73588D).cgColor
        settingVC.layer.shadowRadius = 10
        settingVC.layer.shadowOpacity = 1
        settingVC.layer.shadowPath = UIBezierPath(rect: settingVC.bounds).cgPath
        
        
        
     }
    //
 
    @objc func changeTxt(){
        txt1.text = "مَا هَذَا الشَيُّء؟"
        txt2.text = "جِسْرٌ مُلَوَّنٌ بِأَلْوَانِ قَوْسِ المَطَرِ!"
        txt3.text = "لَم يَكُنْ مَوجُودَاً مِن قَبْل!"
        txt4.text = "هَل يَا تُرَى ذَهَبَ اسْمُ الفَتَاةِ عَبْرَ هَذَا الجِسْرِ؟ "
        txt5.text = "هَل سَيَكُونُ لَدَيهَا الجُرْأةُ لِلاكْتِشَافِ؟ "
        
        dicBtn.isHidden = false

        
    }
    @IBAction func dicTranBtn(_ sender: Any) {
        tranLb.isHidden = false
    }
    
    @IBAction func selectGirleBtn(_ sender: Any) {
        let image = UIImage(named: "select-narrating-woman.png")! as UIImage
 

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
