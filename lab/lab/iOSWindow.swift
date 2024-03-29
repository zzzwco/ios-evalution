//
//  iOSWindow.swift
//  Lab
//
//  Created by zzzwco on 2022/8/1.
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

import SwiftUI

struct iOSWindow: View {struct ToggleStates {
  var oneIsOn: Bool = false
  var twoIsOn: Bool = true
}
@State private var toggleStates = ToggleStates()
@State private var topExpanded: Bool = true

var body: some View {
  List {
    DisclosureGroup("Items", isExpanded: $topExpanded) {
      Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
      Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
      DisclosureGroup("Sub-items") {
        Text("Sub-item 1")
      }
    }
  }
}
}

struct iOSWindow_Previews: PreviewProvider {
  static var previews: some View {
    iOSWindow()
  }
}
