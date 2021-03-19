//
//  ViewController.swift
//  SimpleAudioPlayer
//
//  Created by Sergei Isaikin on 19.03.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Added Outlets
    @IBOutlet weak var sliderBoard: UISlider!
    
    // создаем экземпляр класса AVAudioPlayer
    var player = AVAudioPlayer()
    // создаем экземпляр класса UISlider
    let slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // распологаем и настраиваем слайдер в коде
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 25)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.slider.minimumTrackTintColor = .red
        self.slider.maximumTrackTintColor = .white
        self.view.addSubview(slider)
        
        // добавляем наблюдателя для слайдера
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        // проверяем есть ли трэк по указанному пути
        do {
            if let audioPath = Bundle.main.path(forResource: "Dismay", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
    
    }

    // MARK: - Added method for change slider
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    // MARK: - Added Actions
    
    @IBAction func playButtonPress(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func pauseButtonPress(_ sender: Any) {
        self.player.pause()
    }
    @IBAction func sliderAction(_ sender: Any) {
        self.player.volume = self.sliderBoard.value
    }
    
}

