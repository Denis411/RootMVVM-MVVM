//
//  ContentView.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

struct BasicView: View {
    private var isPresented: Bool
    private let text: String
    
    init(
        isPresented: Bool,
        text: String
    ) {
        self.isPresented = isPresented
        self.text = text
    }
    
    var body: some View {
        if isPresented {
            HStack {
                Text(text)
                    .padding(.vertical)
                Spacer()
            }
            .background(Color.green)
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
    @State var isPresented = true
    
    var body: some View {
        LazyVStack(spacing: 0) {
            BasicView(isPresented: true, text: "First")
            BasicView(isPresented: isPresented, text: "Second")
            BasicView(isPresented: true, text: "Third")
            
            Button {
                isPresented.toggle()
            } label: {
                Text("Hide the second")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .padding(.top, 50)
            }

        }
    }
}

#Preview {
    ContentView()
}
