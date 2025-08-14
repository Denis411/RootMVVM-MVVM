//
//  ContentView.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

struct OrderTrackModel: Identifiable {
    var state = "Приняли"
    var orderName: String = "Заказ №120080 от 05.08.2025"
    var id = UUID().uuidString
    var description: String = "Самовывоз из магазина"
}

final class OrderTrackVM: ObservableObject {
    @Published var models = [
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel()
    ]
}

struct OrderTrackView: View {
    @StateObject private var vm = OrderTrackVM()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
                ForEach(vm.models) { model in
                    Cell(
                        model: model,
                        isOpen: false
                    )
                    .cornerRadius(15)
                }
            }
        }
    }
}

extension OrderTrackView {
    struct Cell: View {
        private let model: OrderTrackModel
        @MainActor @State private var isOpen: Bool
        
        init(
            model: OrderTrackModel,
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

struct ContentView: View {
    @StateObject var vm = ProfileRootVM()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                OrderTrackView()
                    .padding(.bottom, 25)
                ChevronView(
                    leftImage: Image(systemName: "cart"),
                    title: "Покупки"
                ) {
                    ChevronButton(text: "Избранные товары", action: vm.didTapFavoriteProducts)
                }
                
                ChevronView(
                    leftImage: Image(systemName: "creditcard.and.123"),
                    title: "Программа лояльности"
                ) {
                    ChevronButton(text: "О программе лояльности", action: vm.didTapLoyaltyProgramInfo)
                }
                
                ChevronView(
                    leftImage: Image(systemName: "location.fill"),
                    title: "Адрес"
                ) {
                    ChevronButton(text: "Геолокация", action: vm.didTapGeolocation)
                }
                
                ChevronView(
                    leftImage: Image(systemName: "envelope.fill"),
                    title: "Обратная связь"
                ) {
                    ChevronButton(text: "Помощь", action: vm.didTapHelp)
                    ChevronButton(text: "Правовая информация", action: vm.didTapLegalInfo)
                }
                
                ChevronView(
                    leftImage: Image(systemName: "backpack"),
                    title: "Работа у нас"
                ) {
                    ChevronButton(text: "Отправить резюме", action: vm.didTapSendResume)
                }
            }
        }
        .background(Color.gray)
    }
}

#Preview {
    ContentView()
}
