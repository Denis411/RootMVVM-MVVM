//
//  RegistrationView.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var vm: RegistrationViewModel
    
    init(repo: RepositoryProtocol) {
        self._vm = StateObject(wrappedValue: RegistrationViewModel(repo: repo))
    }
    
    var body: some View {
        if vm.isUserLoggedIn {
            EmptyView()
        } else {
            VStack {
                Text("Войдите или зарегистрируйтесь, чтобы пользоваться всеми преимуществами программы лояльности и видеть историю покупок")
                    .padding()
                Button {
                    vm.logInUser()
                } label: {
                    Text("Залогиниться")
                        .padding()
                        .background(Color.green)
                        .foregroundStyle(.white)
                        .cornerRadius(15)
                        .padding(.bottom, 10)
                }
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding(.bottom, 25)
        }
    }
}
