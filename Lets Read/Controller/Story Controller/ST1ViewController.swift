//
//  ST1ViewController.swift
//  Lets Read
//
//  Created by Emad Abd on 28/05/2022.
//

import UIKit
import AVFoundation
class ST1ViewController: UIViewController {

    var player: AVAudioPlayer?

    @IBOutlet weak var txt1: UILabel!
    @IBOutlet weak var txt2: UILabel!
    @IBOutlet weak var txt3: UILabel!
    @IBOutlet weak var txt4: UILabel!
    @IBOutlet weak var txt5: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 14,
            target: self,
            selector: #selector(ST1ViewController.changeText),
            userInfo: nil,
            repeats: false)
        
            playSound2()

    }
 
    @objc  func changeText(){
        
        txt1.text = "لَقَد اِخْتَفَى اسْمُهَا "
        txt5.text =  "صَاحَتِ الفَتَاةُ فِي تَعَجُّبٍ"
        txt2.text =  "الذِي كَانَ مُعَلَّقَاً عَلَى البَابِ،"
        txt3.text = "«لَقَدْ اِخْتَفَى اِسْمِي!"
        txt4.text = "مَا هُوَ اِسْمِي؟ بِمَ يُنَادِينِي الآَخَرُون؟»"

    }

    
    func playSound2() {
        guard let url = Bundle.main.url(forResource: "sound-without-title-girle", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
