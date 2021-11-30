//
//  KeyboardStatusModel.swift
//  KeyInputViewer
//
//  Created by masumi on 2021/11/30.
//

import Foundation
import GameController

protocol KeyStatusInterface {
    var input: String { get set }
    var keyboardEnabled: Bool { get set }
}

struct KeyStatus: KeyStatusInterface {
    var input: String
    var key: String
    var keyCode: String
    var keyboardEnabled: Bool

    init() {
        input = ""
        key = ""
        keyCode = ""
        keyboardEnabled = false
    }
}
