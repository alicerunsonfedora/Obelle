//
//  File.swift
//  
//
//  Created by Marquis Kurt on 5/16/23.
//

import Foundation
import SwiftGodot

class SelfDrivingGodot: Node2D {
    var gesla: Sprite2D?

    required init() {
        super.init()
        self.createSelfDrivingCar()
    }

    required init(nativeHandle: UnsafeRawPointer) {
        super.init(nativeHandle: nativeHandle)
        self.createSelfDrivingCar()
    }

    func createSelfDrivingCar() -> Sprite2D {
        let sprite = Sprite2D()
        sprite.name = "Godot"
        if let resource: Texture2D = GD.load(path: "res://icon.svg") {
            sprite.texture = resource
        } else {
            GD.pushWarning(arg1: GString(stringLiteral: "Unable to get resource for some reason.").toVariant())
        }
        addChild(node: sprite)
        GD.print("Created self driving car: \(sprite.name)")
        return sprite
    }

    override func _process(delta: Double) {
        super._process(delta: delta)
        self.rotate(radians: 1)
    }
}
