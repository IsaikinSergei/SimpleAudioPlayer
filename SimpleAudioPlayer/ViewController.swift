//
//  ViewController.swift
//  SimpleAudioPlayer
//
//  Created by Sergei Isaikin on 19.03.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // создаем экземпляр класса AVAudioPlayer
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // проверяем есть ли трэк по указанному пути и если есть, запускаем плеер
        do {
            if let audioPath = Bundle.main.path(forResource: "Dismay", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("Error")
        }
        
        self.player.play()
    }

    // MARK: - Added Actions
    
    @IBAction func playButton(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()
    }
    
}

