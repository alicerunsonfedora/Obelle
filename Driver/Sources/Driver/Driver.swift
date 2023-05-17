import Foundation
import SwiftGodot
import GDExtension

// Export our entry point to Godot:
@_cdecl ("swift_entry_point")
public func swift_entry_point(
    interfacePtr: OpaquePointer?,
    libraryPtr: OpaquePointer?,
    extensionPtr: OpaquePointer?) -> UInt8
{
    print("Driver extension loaded")
    guard let interfacePtr, let libraryPtr, let extensionPtr else {
        print ("Error: some parameters were not provided")
        return 0
    }
    initializeSwiftModule(interfacePtr, libraryPtr, extensionPtr, initHook: setupScene, deInitHook: { x in })
    return 1
}


/// We register our new type when we are told that the scene is being loaded
func setupScene(level: GDExtension.InitializationLevel) {
    if level == .scene {
        [SpinningCube.self, SelfDrivingGodot.self].forEach(register)
    }
}
