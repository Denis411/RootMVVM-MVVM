//
//  ChevronButton.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

struct ChevronButton: View {
    private let text: String
    private let action: () -> Void
    
    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Text(text)
            Spacer()
            Image(systemName: "chevron.forward")
        }
        .padding()
        .background(Color.white)
        .onTapGesture {
            action()
        }
    }
}

extension ChevronButton: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.text == rhs.text
    }
}
