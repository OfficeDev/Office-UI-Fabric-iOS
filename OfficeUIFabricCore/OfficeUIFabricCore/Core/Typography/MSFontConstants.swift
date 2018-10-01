// Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license. See LICENSE in the project root for license information.

import UIKit

public enum MSFontStyle: String {
    case SU = "SU"
    case XXL = "XXL"
    case XL = "XL"
    case L = "L"
    case MPlus = "MPlus"
    case M = "M"
    case SPlus = "SPlus"
    case S = "S"
    case XS = "XS"
    case MI = "MI"
}

public enum MSFontWeight: String {
    case Light = "Thin"
    case SemiLight = "Light"
    case Regular = "Regular"
    case Semibold = "Semibold"
}

public struct MSFontConstants {
    public static func msFontSize(style: MSFontStyle) -> CGFloat {
        switch style {
        case .SU: return 42
        case .XXL: return 28
        case .XL: return 21
        case .L: return 17
        case .MPlus: return 15
        case .M: return 14
        case .SPlus: return 13
        case .S: return 12
        case .XS: return 11
        case .MI: return 10
        }
    }
    
    @available(iOS 8.2, *)
    internal static func fontWeight(msFontWeight: MSFontWeight) -> CGFloat {
        switch msFontWeight {
        case .Light: return UIFont.Weight.thin.rawValue
        case .SemiLight: return UIFont.Weight.light.rawValue
        case .Regular: return UIFont.Weight.regular.rawValue
        case .Semibold: return UIFont.Weight.semibold.rawValue
        }
    }
    
    public static func msPreferredFontWeight(style: MSFontStyle) -> MSFontWeight {
        switch style {
        case .SU, .XXL, .XL:
            return .Light
        case .L:
            return .SemiLight
        case .MPlus, .M, .SPlus, .S, .XS:
            return .Regular
        case .MI:
            return .Semibold
        }
    }
}
