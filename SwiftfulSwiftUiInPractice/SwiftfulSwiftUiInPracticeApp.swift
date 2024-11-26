import SwiftUI
import SwiftfulRouting

@main
struct SwiftfulSwiftUiInPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView() { _ in
                ContentView()
            }
        }
    }
}

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
