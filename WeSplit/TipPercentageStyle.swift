//
//  TipPercentageStyle.swift
//  WeSplit
//
//  Created by Gabriel Pereira on 15/03/22.
//

import SwiftUI

struct TipPercentageStyle: ViewModifier {
    let tip: Int
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(tip == 0 ? .red : .gray)
    }
}

extension View {
    func tipStyle(tip: Int) -> some View {
        modifier(TipPercentageStyle(tip: tip))
    }
}
