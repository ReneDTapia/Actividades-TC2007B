//
//  TranscriptionViewModel.swift
//  CallSign
//
//  Created by Barcelona2009  on 21/09/23.
//

import Foundation

class TranscriptionViewModel: ObservableObject {
    @Published var transcription: Transcription

    init() {
        self.transcription = Transcription()
    }

    func updateTranscription(with newText: String) {
        self.transcription.text = newText
    }
}

