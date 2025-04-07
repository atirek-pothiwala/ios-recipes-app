struct ToastsView: View {
    @Binding var toasts: [Toast]
    @State private var isExpanded: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            if isExpanded {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()
                    .onTapGesture { isExpanded = false }
            }

            let layout = isExpanded ? AnyLayout(VStackLayout(spacing: 10)) : AnyLayout(ZStackLayout())

            layout {
                ForEach($toasts) { $toast in
                    let index = toasts.count - 1 - (toasts.firstIndex { $0.id == toast.id } ?? 0)

                    toast.content
                        .offset(x: toast.offsetX)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    toast.offsetX = value.translation.width < 0 ? value.translation.width : 0
                                }
                                .onEnded { value in
                                    let xOffset = value.translation.width + value.velocity.width / 2
                                    if -xOffset > 150 {
                                        $toasts.delete(toast.id)
                                    } else {
                                        toast.offsetX = 0
                                    }
                                }
                        )
                        .scaleEffect(isExpanded ? 1 : 1 - min(CGFloat(index) * 0.1, 1), anchor: .bottom)
                        .offset(y: isExpanded ? 0 : -min(CGFloat(index) * 15, 30))
                        .zIndex(toast.isDeleting ? 1000 : 0)
                        .transition(.asymmetric(insertion: .offset(y: 100), removal: .move(edge: .leading)))
                }
            }
            .onTapGesture { isExpanded.toggle() }
            .padding(.bottom, 15)
        }
        .animation(.bouncy, value: isExpanded)
        .onChange(of: toasts.isEmpty) { _, isEmpty in
            if isEmpty { isExpanded = false }
        }
    }
}