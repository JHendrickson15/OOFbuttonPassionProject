//
//  ViewController.swift
//  OOFApp
//
//  Created by Jordan Hendrickson on 6/10/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import UIKit
import AVFoundation
class ButtonViewController: UIViewController {


    @IBOutlet weak var volumeSliderOutlet: UISlider!
    
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func oofButtonTapped(_ sender: AnyObject) {
        playSound()
    }
    @IBAction func audioSliderChanged(_ sender: Any) {
        
    }
    
    
    func playSound(){
        guard let oofSound = Bundle.main.url(forResource: "OOFSOUND", withExtension: "mp3") else {return}
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true, options: AVAudioSession.SetActiveOptions(rawValue: 1))
            
            audioPlayer = try AVAudioPlayer(contentsOf: oofSound, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let audioPlayer = audioPlayer else {return}
            
            audioPlayer.prepareToPlay()
            
        }catch{
            print("couldnt load file")
        }
        audioPlayer?.volume = volumeSliderOutlet.value
        audioPlayer?.play()
    }
}





