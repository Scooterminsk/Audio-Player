//
//  Songs.swift
//  Audio-Player
//
//  Created by Zenya Kirilov on 5.09.22.
//

import Foundation
import UIKit
import AVFoundation

// audio-player global entity
var audioPlayer: AVAudioPlayer!

// protocol for audio-player settings class
protocol PlayerProtocol: AnyObject {
    var songName: String? { get set }
    var songImage: UIImage? { get set }
    func playSong()
}

// enum with song names for better usage
enum SongNames: String {
    case prayerInC = "Lilly Wood The Prick - Prayer in C"
    case believer = "Imagine Dragons - Believer"
}

// audio-player settings class
class PlayerSettings: NSObject, PlayerProtocol, AVAudioPlayerDelegate {
    var songName: String?
    var songImage: UIImage?
    let audioSession = AVAudioSession.sharedInstance()
    
    func playSong() {
        
        // play song
        do {
            if let path = Bundle.main.path(forResource: songName, ofType: "mp3") {
                try audioPlayer = AVAudioPlayer.init(contentsOf: URL(fileURLWithPath: path))
            }
        } catch {
            print("error")
        }
        // trying to set the device volume as default
        do {
            try audioSession.setActive(true)
            audioPlayer.volume = audioSession.outputVolume
        } catch {
            print("Error Setting up Audio Session")
        }
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
}

//
