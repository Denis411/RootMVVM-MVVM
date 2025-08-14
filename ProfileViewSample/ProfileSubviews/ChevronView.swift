import SwiftUI

struct ChevronView<Content>: View where Content: View  {
    private let title: String
    @State var isOpened: Bool
    private let content: Content
    
    init(
        title: String,
        isInitiallyOpen: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.isOpened = isInitiallyOpen
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Header(title: title, isOpened: $isOpened)
                .padding()
                .background(Color.orange)
                .onTapGesture {
                    Task { @MainActor in
                        withAnimation(.spring()) {
                            isOpened.toggle()
                        }
                    }
                }
            if isOpened {
                content
            }
        }
        .cornerRadius(5)
    }
}

extension ChevronView {
    struct Header: View {
        let title: String
        @Binding private var isOpened: Bool
        
        init(title: String, isOpened: Binding<Bool>) {
            self.title = title
            self._isOpened = isOpened
        }
        
        var body: some View {
            HStack(alignment: .center) {
                Text(title)
                Spacer()
                Image(systemName: "chevron.up")
                    .scaleEffect(y: isOpened ? 1 : -1)
            }
        }
    }
}
