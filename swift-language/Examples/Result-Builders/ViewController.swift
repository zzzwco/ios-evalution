//
//  ViewController.swift
//  swift-language
//
//  Created by zzzwco on 2022/9/1.
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

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    VStack(superView: self.view) {
      UILabel()
        .text("Hello")
        .textColor(.orange)
      
      UILabel()
        .text("World")
        .textColor(.cyan)
      
      if Bool.random() {
        UILabel().text("True")
      } else {
        UILabel().text("False")
      }
    }
  }
}

@resultBuilder struct VStackBuilder {
  
  static func buildBlock(_ components: UIView...) -> [UIView] {
    components
  }
  
  static func buildBlock(_ component: UIView) -> UIView {
    component
  }
  
  static func buildEither(first component: UIView) -> UIView {
    component
  }
  
  static func buildEither(second component: UIView) -> UIView {
    component
  }
}

final class VStack: UIStackView {
  
  @discardableResult
  init(superView: UIView,
       spacing: CGFloat = 10.0,
       @VStackBuilder content: () -> [UIView]) {
    super.init(frame: .zero)
    self.axis = .vertical
    self.spacing = spacing
    self.translatesAutoresizingMaskIntoConstraints = false
    content().forEach { self.addArrangedSubview($0) }
    
    superView.addSubview(self)
    NSLayoutConstraint.activate([
      self.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
      self.centerYAnchor.constraint(equalTo: superView.centerYAnchor),
    ])
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension UILabel {
  
  @discardableResult
  func text(_ text: String?) -> Self {
    self.text = text
    return self
  }
  
  @discardableResult
  func font(_ font: UIFont) -> Self {
    self.font = font
    return self
  }
  
  @discardableResult
  func textColor(_ textColor: UIColor) -> Self {
    self.textColor = textColor
    return self
  }
}
