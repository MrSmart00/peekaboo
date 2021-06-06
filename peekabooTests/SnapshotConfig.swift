//
//  SnapshotConfig.swift
//  peekabooTests
//
//  Created by 日野森寛也 on 2021/06/06.
//

import Foundation
import SnapshotTesting

public enum SnapshotConfig {
    static let precision: Float = 0.95
    
    public enum DeviceName: String, CaseIterable {
        case iPhoneSe = "iPhone-SE"
        case iPhone8 = "iPhone-8"
        case iPhone8Plus = "iPhone-8-Plus"
        case iPhoneX = "iPhone-X"
        case iPhoneXsMax = "iPhone-Xs-Max"
        case iPhoneXr = "iPhone-XR"
        case iPadPro11Portrait = "iPad-Pro-11-portrait"
        case iPadPro11Landscape = "iPad-Pro-11-landscape"
    }
}
extension SnapshotConfig.DeviceName {
    public var viewImageConfig: ViewImageConfig {
        switch self {
        case .iPhoneSe:
            return .iPhoneSe
        case .iPhone8:
            return .iPhone8
        case .iPhone8Plus:
            return .iPhone8Plus
        case .iPhoneX:
            return .iPhoneX
        case .iPhoneXsMax:
            return .iPhoneXsMax
        case .iPhoneXr:
            return .iPhoneXr
        case .iPadPro11Portrait:
            return .iPadPro11(.portrait)
        case .iPadPro11Landscape:
            return .iPadPro11(.landscape)
        }
    }
}
