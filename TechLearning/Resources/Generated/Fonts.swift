// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length
// swiftlint:disable implicit_return

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum Akrobat {
    internal static let black = FontConvertible(name: "Akrobat-Black", family: "Akrobat", path: "Akrobat-Black.otf")
    internal static let bold = FontConvertible(name: "Akrobat-Bold", family: "Akrobat", path: "Akrobat-Bold.otf")
    internal static let extraBold = FontConvertible(name: "Akrobat-ExtraBold", family: "Akrobat", path: "Akrobat-ExtraBold.otf")
    internal static let extraLight = FontConvertible(name: "Akrobat-ExtraLight", family: "Akrobat", path: "Akrobat-ExtraLight.otf")
    internal static let regular = FontConvertible(name: "Akrobat-Regular", family: "Akrobat", path: "Akrobat-Regular.otf")
    internal static let semiBold = FontConvertible(name: "Akrobat-SemiBold", family: "Akrobat", path: "Akrobat-SemiBold.otf")
    internal static let all: [FontConvertible] = [black, bold, extraBold, extraLight, regular, semiBold]
  }
  internal enum Geometria {
    internal static let regular = FontConvertible(name: "Geometria", family: "Geometria", path: "Geometria.ttf")
    internal static let bold = FontConvertible(name: "Geometria-Bold", family: "Geometria", path: "Geometria-Bold.ttf")
    internal static let extraBold = FontConvertible(name: "Geometria-ExtraBold", family: "Geometria", path: "Geometria-ExtraBold.ttf")
    internal static let heavy = FontConvertible(name: "Geometria-Heavy", family: "Geometria", path: "Geometria-Heavy.ttf")
    internal static let medium = FontConvertible(name: "Geometria-Medium", family: "Geometria", path: "Geometria-Medium.ttf")
    internal static let thin = FontConvertible(name: "Geometria-Thin", family: "Geometria", path: "Geometria-Thin.ttf")
    internal static let all: [FontConvertible] = [regular, bold, extraBold, heavy, medium, thin]
  }
  internal enum Roboto {
    internal static let black = FontConvertible(name: "Roboto-Black", family: "Roboto", path: "Roboto-Black.ttf")
    internal static let bold = FontConvertible(name: "Roboto-Bold", family: "Roboto", path: "Roboto-Bold.ttf")
    internal static let light = FontConvertible(name: "Roboto-Light", family: "Roboto", path: "Roboto-Light.ttf")
    internal static let medium = FontConvertible(name: "Roboto-Medium", family: "Roboto", path: "Roboto-Medium.ttf")
    internal static let regular = FontConvertible(name: "Roboto-Regular", family: "Roboto", path: "Roboto-Regular.ttf")
    internal static let all: [FontConvertible] = [black, bold, light, medium, regular]
  }
  internal static let allCustomFonts: [FontConvertible] = [Akrobat.all, Geometria.all, Roboto.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(macOS)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat, enableAspectRatio isRatio: Bool = true) -> Font! {
    return Font(font: self, size: isRatio ? size * ScreenSize.fontAspectRatio : size)
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(macOS)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
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
