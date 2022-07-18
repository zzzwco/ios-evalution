//
//  main.swift
//  swift-language
//
//  Created by zzzwco on 2022/6/28.
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
import RegexBuilder


// https://github.com/apple/swift/blob/main/CHANGELOG.md

// MARK: - Clarify the Execution of Non-Actor-Isolated Async Functions

class C { }

// 总是在全局的协作并发池上执行
func f(_: C) async { }

actor A {
  func g(c: C) async {
    // 总是在 actor 上执行
    print("on the actor")

    await f(c)
  }
}

// MARK: - Regex

// MARK: Regex Type

printLog("Regex Type", printType: .section)

let s = "Stay hungry, stay foolish."
let regex1 = try! Regex("[Ss]tay")
let matches1 = s.matches(of: regex1)
for match in matches1 {
  let l = match.range.lowerBound
  let r = match.range.upperBound
  printLog(s[l..<r])
}

// MARK: - Regex builder DSL

printLog("Regex builder DSL", printType: .section)

let regex2 = Regex {
  "Stay "
  Capture {
    OneOrMore(.word) // matches2.1
  }
  ", stay "
  Capture {
    OneOrMore(.word) // matches2.2
  }
  "."
}
if let matches2 = try regex2.wholeMatch(in: s) {
  // matches2.0 是整个匹配的字符串
  printLog(matches2.0, matches2.1, matches2.2)
}

let ref1 = Reference(Substring.self)
let ref2 = Reference(Substring.self)
let regex3 = Regex {
  "Stay "
  Capture(as: ref1) { // res[ref1]
    OneOrMore(.word)
  }
  ", stay "
  Capture(as: ref2) { // res[ref2]
    OneOrMore(.word)
  }
  "."
}
if let matches3 = try regex3.wholeMatch(in: s) {
  printLog(matches3[ref1], matches3[ref2])
}

// MARK: - Regex Literals

printLog("Regex Literals", printType: .section)

let regex4 = /[Ss]tay/
let matches4 = s.matches(of: regex4)
for match in matches4 {
  let l = match.range.lowerBound
  let r = match.range.upperBound
  printLog(s[l..<r])
}

let regex5 = /Stay (?<s1>.+), stay (?<s2>[A-Za-z0-9]+)./
if let matches5 = try regex5.wholeMatch(in: s) {
  printLog(matches5.s1, matches5.s2)
}

let regex6 = Regex {
  "Stay"
  Capture { // 空格使用使用\转义
    /\ .+/
  }
  ", stay"
  Capture {
    /\ [A-Za-z0-9]+/
  }
  "."
}
if let matches6 = try regex6.wholeMatch(in: s) {
  printLog(matches6.1, matches6.2)
}

// MARK: - Regex-powered string processing algorithms

printLog("Regex-powered string processing algorithms", printType: .section)

printLog(s.replacing(/[Ss]tay/, with: "be"))
printLog(s.contains(/\ foo.+/))

// MARK: - Clock, Instant, and Duration

printLog("Clock, Instant, and Duration", printType: .section)

// MARK: Clock

let clock = ContinuousClock()
let elapsed = clock.measure {
  for _ in 0..<999999 {}
}
printLog("Loop duration: \(elapsed)")

func delayWork() async throws {
  // tolerance 为容差，默认为 nil
  // 这里表示任务会睡眠 0.5 至 1 秒
  let elapsed = try await clock.measure {
    try await Task.sleep(until: .now + .seconds(0.5), tolerance: .seconds(0.5), clock: .continuous)
  }
  printLog("Sleep duration: \(elapsed)")
  printLog("Time is up, keep working...")
}

try await delayWork()

// MARK: Instant

// MARK: Duration


// MARK: - Optional shorthand

printLog("Optional shorthand", printType: .section)

let s1: String? = "s1"

if let s1 {
  printLog(s1)
}

guard let s1 else {
  exit(0)
}
printLog(s1)

// MARK: - Stronger opaque types



// MARK: - Lightweight same-type requirements for primary associated types



