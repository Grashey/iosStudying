//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `BugsBunny`.
    static let bugsBunny = Rswift.ImageResource(bundle: R.hostingBundle, name: "BugsBunny")
    /// Image `RoadRunner`.
    static let roadRunner = Rswift.ImageResource(bundle: R.hostingBundle, name: "RoadRunner")
    /// Image `Tweety`.
    static let tweety = Rswift.ImageResource(bundle: R.hostingBundle, name: "Tweety")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "BugsBunny", bundle: ..., traitCollection: ...)`
    static func bugsBunny(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.bugsBunny, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "RoadRunner", bundle: ..., traitCollection: ...)`
    static func roadRunner(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.roadRunner, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Tweety", bundle: ..., traitCollection: ...)`
    static func tweety(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tweety, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizible` struct is generated, and contains static references to 22 localization keys.
    struct localizible {
      /// Value: Academy Award Nominations:
      static let movieViewCellAwardNominationsLabel = Rswift.StringResource(key: "movieViewCellAwardNominationsLabel", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Academy Award Wins:
      static let movieViewCellAwardWinsLabel = Rswift.StringResource(key: "movieViewCellAwardWinsLabel", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Auth
      static let loginViewControllerTitle = Rswift.StringResource(key: "loginViewControllerTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Books
      static let booksViewControllerTitle = Rswift.StringResource(key: "booksViewControllerTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Budget, $ millions:
      static let movieViewCellBudgetLabel = Rswift.StringResource(key: "movieViewCellBudgetLabel", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Chapters
      static let chaptersViewControllerTitle = Rswift.StringResource(key: "chaptersViewControllerTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Error
      static let alertErrorTitle = Rswift.StringResource(key: "alertErrorTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Login
      static let loginButtonTitle = Rswift.StringResource(key: "loginButtonTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Logout
      static let logoutButtonTitle = Rswift.StringResource(key: "logoutButtonTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Movie:
      static let quotesViewCellMovieLabel = Rswift.StringResource(key: "quotesViewCellMovieLabel", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Movies
      static let moviesViewControllerTitle = Rswift.StringResource(key: "moviesViewControllerTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: No quotes
      static let quotesEmptyQuotesLabel = Rswift.StringResource(key: "quotesEmptyQuotesLabel", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Quote:
      static let quotesViewCellQuoteLabel = Rswift.StringResource(key: "quotesViewCellQuoteLabel", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Quotes
      static let quotesViewControllerTitle = Rswift.StringResource(key: "quotesViewControllerTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Register
      static let registryButtonTitle = Rswift.StringResource(key: "registryButtonTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Revenue, $ millions:
      static let movieViewCellRevenueLabel = Rswift.StringResource(key: "movieViewCellRevenueLabel", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Rotten Tomatoes Score:
      static let movieViewCellScoreLabel = Rswift.StringResource(key: "movieViewCellScoreLabel", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Runtime, minutes:
      static let movieViewCellRuntimeLabel = Rswift.StringResource(key: "movieViewCellRuntimeLabel", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: enter login
      static let placeholderLogin = Rswift.StringResource(key: "placeholderLogin", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: enter password
      static let placeholderPassword = Rswift.StringResource(key: "placeholderPassword", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: ok
      static let alertActionOkTitle = Rswift.StringResource(key: "alertActionOkTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: show movie quotes
      static let movieViewCellShowQuotesTitle = Rswift.StringResource(key: "movieViewCellShowQuotesTitle", tableName: "Localizible", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Academy Award Nominations:
      static func movieViewCellAwardNominationsLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("movieViewCellAwardNominationsLabel", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "movieViewCellAwardNominationsLabel"
        }

        return NSLocalizedString("movieViewCellAwardNominationsLabel", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Academy Award Wins:
      static func movieViewCellAwardWinsLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("movieViewCellAwardWinsLabel", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "movieViewCellAwardWinsLabel"
        }

        return NSLocalizedString("movieViewCellAwardWinsLabel", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Auth
      static func loginViewControllerTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("loginViewControllerTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "loginViewControllerTitle"
        }

        return NSLocalizedString("loginViewControllerTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Books
      static func booksViewControllerTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("booksViewControllerTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "booksViewControllerTitle"
        }

        return NSLocalizedString("booksViewControllerTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Budget, $ millions:
      static func movieViewCellBudgetLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("movieViewCellBudgetLabel", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "movieViewCellBudgetLabel"
        }

        return NSLocalizedString("movieViewCellBudgetLabel", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Chapters
      static func chaptersViewControllerTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("chaptersViewControllerTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "chaptersViewControllerTitle"
        }

        return NSLocalizedString("chaptersViewControllerTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Error
      static func alertErrorTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("alertErrorTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "alertErrorTitle"
        }

        return NSLocalizedString("alertErrorTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Login
      static func loginButtonTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("loginButtonTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "loginButtonTitle"
        }

        return NSLocalizedString("loginButtonTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Logout
      static func logoutButtonTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("logoutButtonTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "logoutButtonTitle"
        }

        return NSLocalizedString("logoutButtonTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Movie:
      static func quotesViewCellMovieLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("quotesViewCellMovieLabel", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "quotesViewCellMovieLabel"
        }

        return NSLocalizedString("quotesViewCellMovieLabel", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Movies
      static func moviesViewControllerTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("moviesViewControllerTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "moviesViewControllerTitle"
        }

        return NSLocalizedString("moviesViewControllerTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: No quotes
      static func quotesEmptyQuotesLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("quotesEmptyQuotesLabel", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "quotesEmptyQuotesLabel"
        }

        return NSLocalizedString("quotesEmptyQuotesLabel", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Quote:
      static func quotesViewCellQuoteLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("quotesViewCellQuoteLabel", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "quotesViewCellQuoteLabel"
        }

        return NSLocalizedString("quotesViewCellQuoteLabel", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Quotes
      static func quotesViewControllerTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("quotesViewControllerTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "quotesViewControllerTitle"
        }

        return NSLocalizedString("quotesViewControllerTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Register
      static func registryButtonTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("registryButtonTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "registryButtonTitle"
        }

        return NSLocalizedString("registryButtonTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Revenue, $ millions:
      static func movieViewCellRevenueLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("movieViewCellRevenueLabel", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "movieViewCellRevenueLabel"
        }

        return NSLocalizedString("movieViewCellRevenueLabel", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Rotten Tomatoes Score:
      static func movieViewCellScoreLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("movieViewCellScoreLabel", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "movieViewCellScoreLabel"
        }

        return NSLocalizedString("movieViewCellScoreLabel", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: Runtime, minutes:
      static func movieViewCellRuntimeLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("movieViewCellRuntimeLabel", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "movieViewCellRuntimeLabel"
        }

        return NSLocalizedString("movieViewCellRuntimeLabel", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: enter login
      static func placeholderLogin(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("placeholderLogin", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "placeholderLogin"
        }

        return NSLocalizedString("placeholderLogin", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: enter password
      static func placeholderPassword(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("placeholderPassword", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "placeholderPassword"
        }

        return NSLocalizedString("placeholderPassword", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: ok
      static func alertActionOkTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("alertActionOkTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "alertActionOkTitle"
        }

        return NSLocalizedString("alertActionOkTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      /// Value: show movie quotes
      static func movieViewCellShowQuotesTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("movieViewCellShowQuotesTitle", tableName: "Localizible", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizible", preferredLanguages: preferredLanguages) else {
          return "movieViewCellShowQuotesTitle"
        }

        return NSLocalizedString("movieViewCellShowQuotesTitle", tableName: "Localizible", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
