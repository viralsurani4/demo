// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length implicit_return

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum Authentication: StoryboardType {
    internal static let storyboardName = "Authentication"

    internal static let initialScene = InitialSceneType<UIKit.UINavigationController>(storyboard: Authentication.self)

    internal static let forgotPasswordVC = SceneType<TechLearning.ForgotPasswordVC>(storyboard: Authentication.self, identifier: "ForgotPasswordVC")

    internal static let loginVC = SceneType<TechLearning.LoginVC>(storyboard: Authentication.self, identifier: "LoginVC")

    internal static let otpVC = SceneType<TechLearning.OtpVC>(storyboard: Authentication.self, identifier: "OtpVC")

    internal static let signUpVC = SceneType<TechLearning.SignUpVC>(storyboard: Authentication.self, identifier: "SignUpVC")

    internal static let welcomeVC = SceneType<TechLearning.WelcomeVC>(storyboard: Authentication.self, identifier: "WelcomeVC")

    internal static let navigationLogin = SceneType<UIKit.UINavigationController>(storyboard: Authentication.self, identifier: "navigationLogin")
  }
  internal enum Home: StoryboardType {
    internal static let storyboardName = "Home"

    internal static let initialScene = InitialSceneType<UIKit.UINavigationController>(storyboard: Home.self)

    internal static let courseDetailVC = SceneType<TechLearning.CourseDetailVC>(storyboard: Home.self, identifier: "CourseDetailVC")

    internal static let homeVC = SceneType<TechLearning.HomeVC>(storyboard: Home.self, identifier: "HomeVC")

    internal static let navigationHome = SceneType<UIKit.UINavigationController>(storyboard: Home.self, identifier: "navigationHome")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
      fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
    }
    return controller
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
