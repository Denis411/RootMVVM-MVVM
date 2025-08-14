//
//  OrderTrackView.Cell.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

extension OrderTrackView {
    struct Cell: View {
        private let model: OrderTrackVM.OrderTrackModel
        @MainActor @State private var isOpen: Bool
        
        init(
            model: OrderTrackVM.OrderTrackModel,
            isOpen: Bool
        ) {
            self.model = model
            self.isOpen = isOpen
        }
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text(model.state)
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    Spacer()
                    Image(systemName: "chevron.up")
                        .scaleEffect(y: isOpen ? -1 : 1)
                }
                .padding(15)
                .frame(width: UIScreen.main.bounds.width * 0.90)
                .background(Color.white)
                .onTapGesture {
                    withAnimation {
                        isOpen.toggle()
                    }
                }
                
                HStack(spacing: 20) {
                    Circle()
                        .fill(.blue)
                        .frame(width: 50, height: 50)
                        .padding(.leading, 20)
                    Circle()
                        .fill(.yellow)
                        .frame(width: 50, height: 50)
                    Circle()
                        .fill(.yellow)
                        .frame(width: 50, height: 50)
                    Circle()
                        .fill(.yellow)
                        .frame(width: 50, height: 50)
                    
                    Spacer()
                }
                .padding(.bottom, 10)
                
                if isOpen {
                    VStack(alignment: .leading) {
                        Text("Самовывоз из магазина")
                            .padding(.bottom, 20)
                        HStack(alignment: .center) {
                            Image(systemName: "cat")
                            VStack {
                                Text("Магазин")
                                Text("Fix Price")
                            }
                        }
                        
                        HStack(alignment: .center) {
                            Image(systemName: "cat")
                            VStack {
                                Text("Магазин")
                                Text("Fix Price")
                            }
                        }
                        
                        HStack(alignment: .center) {
                            Image(systemName: "cat")
                            VStack {
                                Text("Магазин")
                                Text("Fix Price")
                            }
                        }
                        
                        HStack(alignment: .center) {
                            Image(systemName: "cat")
                            VStack {
                                Text("Магазин")
                                Text("Fix Price")
                            }
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 10)
                }
            }
            .background(Color.white)
        }
    }
}
