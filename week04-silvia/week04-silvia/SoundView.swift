//
//  SoundView.swift
//  week04-silvia
//
//  Created by Silvia Zhou on 9/28/26.
//

import SwiftUI

struct SoundView: View {
    
    var mood: String
    var sound: String
    
    let audioPlayer = AudioPlayer()
    
    @State var isPlaying = false
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Text(mood == "Rainy" ? "🌧" :
                 mood == "Cozy" ? "☕" : "🌙")
                .font(.system(size: 100))
            
            Text(mood)
                .font(.largeTitle)
            
            Text("Take a moment.")
                .foregroundStyle(.gray)
            
            Button(isPlaying ? "■ Stop" : "▶︎ Play") {
                
                if isPlaying {
                    audioPlayer.stopSound()
                } else {
                    audioPlayer.playSound(sound)
                }
                
                isPlaying.toggle()
            }
            .font(.title2)
            
        }
        .padding()
        .navigationTitle("Listen")
        
        // When we leave this page, stop the music
        .onDisappear {
            audioPlayer.stopSound()
            isPlaying = false
        }
    }
}
