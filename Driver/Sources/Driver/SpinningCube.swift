//
//  File.swift
//  
//
//  Created by Marquis Kurt on 5/14/23.
//

import Foundation
import SwiftGodot

class SpinningCube: Node3D {
    var meshRender: MeshInstance3D?

    required init() {
        super.init()
        self.setupNode()
    }

    required init(nativeHandle: UnsafeRawPointer) {
        super.init(nativeHandle: nativeHandle)
        self.setupNode()
    }

    private func setupNode() {
        let meshRender = MeshInstance3D()
        meshRender.mesh = BoxMesh()
        addChild(node: meshRender)
        self.meshRender = meshRender
    }

    public override func _process(delta: Double) {
        rotateY(angle: delta)
    }
}
