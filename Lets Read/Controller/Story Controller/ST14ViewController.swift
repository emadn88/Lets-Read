//
//  ST14ViewController.swift
//  Lets Read
//
//  Created by Emad Abd on 28/05/2022.
//

import UIKit
import AVFoundation

class ST14ViewController: UIViewController {
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 1,
            target: self,
            selector: #selector(ST14ViewController.changeTxt),
            userInfo: nil,
            repeats: false)
        
     }
    //
 
    @objc func changeTxt(){
        guard let url = Bundle.main.url(forResource: "know3final", withExtension: "mp3") else { return }

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
