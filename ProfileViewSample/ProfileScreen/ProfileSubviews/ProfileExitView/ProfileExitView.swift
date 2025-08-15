//
//  ProfileExitView.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

struct ProfileExitView: View {
    @StateObject var vm: ProfileExitViewModel
    
    init(repo: RepositoryProtocol) {
        self._vm = StateObject(wrappedValue: ProfileExitViewModel(repo: repo))
    }
    
    var body: some View {
        if vm.isViewEmpty {
            EmptyView()
        } else {
            HStack {
                Image(systemName: "square.and.arrow.up")
                Text("Выход")
                Spacer()
            }
            .padding()
            .onTapGesture {
                vm.exitAction()
            }
        }
    }
}
