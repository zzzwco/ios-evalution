//
//  Utils.swift
//  swift-language
//
//  Created by zzzwco on 2022/7/13.
//
//  Copyright (c) 2021 zzzwco <zzzwco@outlook.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

public enum PrintType: String {
  case `default` = "🍺🍺🍺"
  case warning = "⚠️⚠️⚠️"
  case error = "❌❌❌"
}

public func printLog<T>(
  _ msg: T..., file: String = #file, method: String = #function,
  line: Int = #line, printType: PrintType = .default
) {
  #if DEBUG
  let msg = msg.enumerated().map { i, v in
    "\(v)\n"
  }.joined()
  let content = "\(Date()) \((file as NSString).lastPathComponent)[\(line)], \(method): \n\(msg)\n"
  let rawValue = printType.rawValue
  print("\(rawValue) \(content)")
  #endif
}

