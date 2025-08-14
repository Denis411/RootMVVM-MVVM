//
//  ContentView.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

struct BasicView: View {
    @State private var isPresented: Bool = true
    private let text: String
    private let bottomOffsetIfPresented: CGFloat
    
    init(
        text: String,
        bottomOffsetIfPresented: CGFloat
    ) {
        self.text = text
        self.bottomOffsetIfPresented = bottomOffsetIfPresented
    }
    
    var body: some View {
        if isPresented {
            HStack {
                Text(text)
                    .padding(.vertical)
                Spacer()
            }
            .background(Color.green)
            .padding(.bottom, bottomOffsetIfPresented)
            .onTapGesture {
                Task { @MainActor in
                    withAnimation(.spring()) {
                        isPresented = false
                    }
                }
            }
        } else {
            EmptyView()
        }
    }
}

extension BasicView: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.isPresented == rhs.isPresented
    }
}

struct ContentView: View {
    
    var body: some View {
        LazyVStack(spacing: 0) {
            BasicView(text: "First", bottomOffsetIfPresented: 10)
            BasicView(text: "Second", bottomOffsetIfPresented: 20)
            BasicView(text: "Third", bottomOffsetIfPresented: 0)
        }
    }
}

#Preview {
    ContentView()
}
