//
//  HexColorDemoTests.swift
//  HexColorDemoTests
//
//  Created by zzyong on 2020/9/21.
//  Copyright © 2020 zzyong. All rights reserved.
//

import XCTest
import HexColor
@testable import HexColorDemo

class HexColorDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHexColor() throws {
        
        let red: UIColor = UIColor.red
        let hexRed: HexColor = UIColor.hexColor("FF0000")
        XCTAssertEqual(red, hexRed)
        
        let green: UIColor = UIColor.green
        let hexGreen: HexColor = UIColor.hexColor("00FF00")
        XCTAssertEqual(green, hexGreen)
        
        let blue: UIColor = UIColor.blue
        let hexBlue: HexColor = UIColor.hexColor("0000FF")
        XCTAssertEqual(blue, hexBlue)
        
        let lightPink: UIColor = UIColor.init(red: 1, green: 182/255.0, blue: 193/255.0, alpha: 1)
        let hexLightPink: HexColor = UIColor.hexColor("FFB6C1")
        XCTAssertEqual(lightPink, hexLightPink)
        
        let aqua: UIColor = UIColor.init(red: 212/255.0, green: 242/255.0, blue: 231/255.0, alpha: 1)
        let hexAqua: HexColor = UIColor.hexColor("D4F2E7")
        XCTAssertEqual(aqua, hexAqua)
    }
    
    // MARK: ARGB hex color
    func testHexAlphaColor() throws {
        
        let aquaAlpha: UIColor = UIColor.init(red: 212/255.0, green: 242/255.0, blue: 231/255.0, alpha: 16/255.0)
        let hexAquaAlpha: HexColor = UIColor.hexColor("10D4F2E7")
        XCTAssertEqual(aquaAlpha, hexAquaAlpha)
        
        let yellowAlpha: UIColor = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 0, alpha: 8/255.0)
        let hexYellowAlpha: HexColor = UIColor.hexColor("08FFFF00")
        XCTAssertEqual(yellowAlpha, hexYellowAlpha)
    }
    
    // MARK: Test cache color
    func testHexCacheColor() throws {
        
        let aquaAlpha: UIColor = UIColor.init(red: 212/255.0, green: 242/255.0, blue: 231/255.0, alpha: 16/255.0)
        let hexAquaAlpha: HexColor = UIColor.hexColor("#10D4F2E7")
        XCTAssertEqual(aquaAlpha, hexAquaAlpha)
        
        let hexAquaCache: HexColor = UIColor.hexColor("#10D4F2E7")
        XCTAssertEqual(aquaAlpha, hexAquaCache)
        
        let yellowAlpha: UIColor = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 0, alpha: 8/255.0)
        let hexYellowAlpha: HexColor = UIColor.hexColor("#08FFFF00")
        XCTAssertEqual(yellowAlpha, hexYellowAlpha)
        
        let hexYellowCache: HexColor = UIColor.hexColor("#08FFFF00")
        XCTAssertEqual(yellowAlpha, hexYellowCache)
        
        let hexYellowCache1: HexColor = UIColor.hexColor("#FFFF00")
        XCTAssertEqual(UIColor.yellow, hexYellowCache1)
    }
}
