import SwiftUI

struct ChevronView<Content>: View where Content: View  {
    private let leftImage: Image?
    private let title: String
    @State var isOpened: Bool
    private let content: Content
    
    init(
        leftImage: Image? = nil,
        title: String,
        isInitiallyOpen: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.leftImage = leftImage
        self.title = title
        self.isOpened = isInitiallyOpen
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Header(leftImage: leftImage, title: title, isOpened: $isOpened)
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
        private let leftImage: Image?
        let title: String
        @Binding private var isOpened: Bool
        
        init(
            leftImage: Image?,
            title: String,
            isOpened: Binding<Bool>
        ) {
            self.leftImage = leftImage
            self.title = title
            self._isOpened = isOpened
        }
        
        var body: some View {
            HStack(alignment: .center) {
                if let leftImage {
                    leftImage
                }
                Text(title)
                Spacer()
                Image(systemName: "chevron.up")
                    .scaleEffect(y: isOpened ? 1 : -1)
            }
        }
    }
}
