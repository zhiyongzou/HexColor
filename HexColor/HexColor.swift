//
//  HexColor.swift
//  HexColor
//
//  Created by zzyong on 2020/9/17.
//  Copyright © 2020 zzyong. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit
  public typealias HexColor = UIColor
#else
  import Cocoa
  public typealias HexColor = NSColor
#endif

public extension HexColor {
    
    enum HexType: Int {
        case ARGB = 0
        case RGBA = 1
    }
    
    /// Default count limit: 100
    class var cacheCountLimit: Int {
        set {
            hexColorCache.countLimit = newValue
        }
        get {
            return hexColorCache.countLimit
        }
    }
    
    private static var hexColorCache: NSCache<NSString, HexColor> = {
        let cache = NSCache<NSString, HexColor>()
        cache.countLimit = 100;
        return cache
    }()
    
    private class func hexToUInt64(_ hexString: String) -> UInt64 {
        var result: UInt64 = 0
        guard Scanner(string: "0X\(hexString)").scanHexInt64(&result) else {
            return 1
        }
        return result
    }
    
    /// Creat real color by hex string
    /// - Parameters:
    ///   - hexString: Hex string like "FFFFFF". Support RGB and ARGB hex string
    ///   - alpha: The opacity value of the color object, specified as a value from 0.0 to 1.0.
    ///   - type: HexType, defaull is ARGB
    /// - Returns: HexColor  (Return clear color when hex format is error)
    class func hexColor(_ hexString: String, alpha: CGFloat = 1.0, type: HexType = .ARGB) -> HexColor {
        
        var resultHex = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if resultHex.hasPrefix("#") {
            resultHex.removeFirst(1)
        } else if resultHex.hasPrefix("0X") {
            resultHex.removeFirst(2)
        }
        
        var resultAlpha: CGFloat = alpha
        if resultHex.count == 8 {
            if type == .ARGB {
                // ARGB
                resultAlpha = CGFloat(self.hexToUInt64("\(resultHex.prefix(2))")) / 255.0
                resultHex.removeFirst(2)
            } else {
                // RGBA
                resultAlpha = CGFloat(self.hexToUInt64("\(resultHex.suffix(2))")) / 255.0
                resultHex.removeLast(2)
            }
        }
        
        if resultHex.count != 6 {
#if DEBUG
            print("Hex format is error: [\(hexString)]")
#endif
            return self.clear
        }
        
        // hex color from cache
        if let cacheColor = self.hexColorCache.object(forKey: resultHex as NSString) {
            return cacheColor.withAlphaComponent(resultAlpha)
        }
        
        // get green hex index
        let greenBegin = resultHex.index(resultHex.startIndex, offsetBy: 2)
        let greenEnd = resultHex.index(resultHex.startIndex, offsetBy: 3)
        
        let red = CGFloat(self.hexToUInt64("\(resultHex.prefix(2))")) / 255.0
        let green = CGFloat(self.hexToUInt64("\(resultHex[greenBegin...greenEnd])")) / 255.0
        let blue = CGFloat(self.hexToUInt64("\(resultHex.suffix(2))")) / 255.0
        
        var resultColor: HexColor
        
        #if os(iOS) || os(watchOS) || os(tvOS)
          resultColor = self.init(red:red, green:green, blue:blue, alpha:resultAlpha)
        #else
          resultColor = self.init(calibratedRed:red, green:green, blue:blue, alpha:resultAlpha)
        #endif
        
        self.hexColorCache.setObject(resultColor, forKey: resultHex as NSString)
        
        return resultColor
    }
}


