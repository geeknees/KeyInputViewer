//
//  KeyboardFetcherViewModel.swift
//  KeyInputViewer
//
//  Created by masumi on 2021/11/30.
//

import SwiftUI
import GameController
import Combine

class KeyFetcherViewModel: ObservableObject {
    @Published public var status: KeyStatus

    init() {
        self.status = KeyStatus()

        NotificationCenter.default.addObserver(
            forName: NSNotification.Name.GCKeyboardDidConnect,
            object: nil,
            queue: OperationQueue.main
        ) { (_) in
            if let keyboard = GCKeyboard.coalesced?.keyboardInput {
                self.status.keyboardEnabled = true
                keyboard.keyChangedHandler = { (input, key, keyCode, pressed) in
                    self.status.input = input.description
                    self.status.key = key.description
                    self.status.keyCode = keyCode.rawValue.description
                }
            } else {
                self.status.keyboardEnabled = false
                self.status.input = ""
                self.status.key = ""
                self.status.keyCode = ""
            }
        }

        NotificationCenter.default.addObserver(
            forName: NSNotification.Name.GCKeyboardDidDisconnect,
            object: nil,
            queue: OperationQueue.main
        ) { (_) in
            self.status.keyboardEnabled = false
            self.status.input = ""
            self.status.key = ""
            self.status.keyCode = ""
        }
    }
}
