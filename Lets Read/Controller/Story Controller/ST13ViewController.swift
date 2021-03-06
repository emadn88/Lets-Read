//
//  ST13ViewController.swift
//  Lets Read
//
//  Created by Emad Abd on 28/05/2022.
//

import UIKit
import AVFoundation

class ST13ViewController: UIViewController   , AVSpeechSynthesizerDelegate {
    var player: AVAudioPlayer?
    var speechSynthesizer = AVSpeechSynthesizer()
    @IBOutlet var lblText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 1,
            target: self,
            selector: #selector(ST13ViewController.changeTxt),
            userInfo: nil,
            repeats: false)
        
        

        
     }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        let mutableAttributedString = NSMutableAttributedString(string: utterance.speechString)
        mutableAttributedString.addAttribute(.foregroundColor, value: UIColor.yellow, range: characterRange)
        lblText.attributedText = mutableAttributedString
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        lblText.attributedText = NSAttributedString(string: utterance.speechString)
    }
    
 
    @objc func changeTxt(){
        
        
        let string =  "هَلْ تَسْتَطِيعُ أَنْ تَحْزِرَ الاِسْمَ؟"
        let utterance = AVSpeechUtterance(string: string)
//        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Ting-Ting-compact")
        utterance.rate = 0.45
        utterance.pitchMultiplier = 1.3
        utterance.volume = 0.0
        speechSynthesizer.speak(utterance)
        
        
        guard let url = Bundle.main.url(forResource: "knowName", withExtension: "mp3") else { return }

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
    

}
