//
//  UITextView+YBUI.swift
//  YBUI
//
//  Created by yang bin on 2019/11/28.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit


extension UITextView {
    /**
    *  convert UITextRange to NSRange, for example, [self qmui_convertNSRangeFromUITextRange:self.markedTextRange]
    */
//    Range  暂时不熟
//    func convertRange(from textRange: UITextRange) -> Range<String.Index> {
//        let location = offset(from: beginningOfDocument, to: textRange.start)
//        let length = offset(from: textRange.start, to: textRange.end)
//        let range = Range(NSRange(location: location, length: length))
//    }
//
//    func convertUITextRange(from range: Range<String.Index>) -> UITextRange {
//
//    }

    func keepingSelectedRange(text: String) {
        let selectedTextRange = self.selectedTextRange
        self.text = text
        self.selectedTextRange = selectedTextRange
    }

    func keepingSelectedRange(attributedText: NSAttributedString) {
        let selectedTextRange = self.selectedTextRange
        self.attributedText = attributedText
        self.selectedTextRange = selectedTextRange
    }

    func scrollRangeToVisible(range: Range<String.Index>) {
        guard bounds.isEmpty == false else { return }

    }


    func scrollCaretVisible(animated: Bool) {
        guard bounds.isEmpty == false, let selectedTextRange = self.selectedTextRange else { return }

        let caretRect = self.caretRect(for: selectedTextRange.end)
        var contentOffsetY = self.contentOffset.y

        guard caretRect.minY != contentOffset.y + textContainerInset.top else {
            // 命中这个条件说明已经不用调整了，直接 return，避免继续走下面的判断，会重复调整，导致光标跳动
            return
        }

        if caretRect.minY < contentOffset.y + textContainerInset.top  {
            // 光标在可视区域上方，往下滚动
            contentOffsetY = caretRect.minY - textContainerInset.top - self.contentInset.top
        } else if caretRect.maxX > contentOffset.y + bounds.height - textContainerInset.bottom - contentInset.bottom {
            // 光标在可视区域下方，往上滚动
            contentOffsetY = caretRect.maxY - bounds.height + textContainerInset.bottom + contentInset.bottom
        } else {
            // 光标在可视区域内，不用调整
            return
        }
        setContentOffset(CGPoint(x: contentOffset.x, y: contentOffsetY), animated: animated)
    }


}

