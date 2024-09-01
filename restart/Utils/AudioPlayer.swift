//
//  AudioPlayer.swift
//  restart
//
//  Created by Aleksandr Nesterov on 01.09.2024.
//

import Foundation
import AVFoundation

class AudioPlayer {
    private var audioPlayer: AVAudioPlayer?

    func playAudio(path: String, type: String){
        if let soundTrack = Bundle.main.path(forResource: path, ofType: type){
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundTrack))
                self.audioPlayer?.play()
            } catch {
                print("Some error occured")
            }
        }
    }
}
