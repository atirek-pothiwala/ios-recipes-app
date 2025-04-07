struct RootNavigator: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            LoginPage(path: $path)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .register:
                        RegisterPage(path: $path)
                    case .mainTab:
                        MainTabView()
                    }
                }
        }
    }
}