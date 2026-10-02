//
//  AudioPlayer.swift
//  week04-silvia
//
//  Created by Silvia Zhou on 9/28/26.
//

import AVFoundation

class AudioPlayer {
    
    var player: AVAudioPlayer?
    
    func playSound(_ name: String) {
        
        if let url = Bundle.main.url(
            forResource: name,
            withExtension: "mp3"
        ) {
            
            player = try? AVAudioPlayer(
                contentsOf: url
            )
            
            player?.play()
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}
