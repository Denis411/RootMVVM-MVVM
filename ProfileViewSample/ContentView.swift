//
//  ContentView.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

struct ContentView: View {
    let lines = (1...100).map { String($0) }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(lines, id: \.self) { num in
                    BasicView(text: "Line \(num)", bottomOffsetIfPresented: 10)
                    ChevronView(title: "Chevron") {
                        HStack {
                            Text("Some text for Chevron")
                                .padding()
                            Spacer()
                        }
                        .background(Color.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
