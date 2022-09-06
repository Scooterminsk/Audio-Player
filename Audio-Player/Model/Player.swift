//
//  Songs.swift
//  Audio-Player
//
//  Created by Zenya Kirilov on 5.09.22.
//

import Foundation
import UIKit
import AVFoundation

protocol PlayerProtocol: AnyObject {
    var songName: String? { get set }
    var songImage: UIImage? { get set }
    var audioPlayer: AVAudioPlayer { get set }
    func playSong()
}

class Player: PlayerProtocol {
    var songName: String?
    var songImage: UIImage?
    var audioPlayer = AVAudioPlayer()
    
    func playSong() {
        do {
            if let path = Bundle.main.path(forResource: songName, ofType: "mp3") {
                try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            }
        } catch {
            print("error")
        }
        self.audioPlayer.play()
    }
}
