# HexColor
![build](https://img.shields.io/github/workflow/status/zhiyongzou/IRHexColor/Run%20tests)
![CocoaPods Version](https://img.shields.io/cocoapods/v/IRHexColor.svg?style=flat)
[![License](https://img.shields.io/github/license/zhiyongzou/IRHexColor.svg?style=flat)](https://github.com/zhiyongzou/IRHexColor/blob/master/LICENSE)
![visitors](https://page-views.glitch.me/badge?page_id=zhiyongzou.ir.hex.color)

A convenient way to convert hex strings to UIColor or NSColor. HexColor support RGB 、ARGB and RGBA hex strings.
In addition, **[HexColor will cache hex color for reusing which can improve performance.]()**

# Examples

RGB hex string

```swift
let red = UIColor.hexColor("FF0000")
let green = UIColor.hexColor("#00FF00")
let blue = UIColor.hexColor("0000FF")
```

ARGB hex string

```swift
let aquaAlpha = UIColor.hexColor("99D4F2E7")
let yellowAlpha = UIColor.hexColor("88FFFF00")
```

RGBA hex string

```swift
let aquaAlpha = UIColor.hexColor("D4F2E799", type: .ARGB)
let yellowAlpha = UIColor.hexColor("FFFF0088", type: .ARGB)
```

Set Color cache count limit

```swift
// default is 100
UIColor.cacheCountLimit = 200
```

# Installation
## CocoaPods

```bash
pod 'IRHexColor'
```

## Manually
Drag and drop HexColor.swift file into your project
