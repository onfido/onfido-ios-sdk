# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

**Note**: If the strings translations change it will result in a MINOR version change, therefore you are responsible for testing your translated layout in case you are using custom translations. [More on language localisation](README.md#language-customisation)

## [29.0.0] - 2023-05-03

### Changed

- Changed the Studio API to be compatible with Objective-C
- Added Objective-C support for the Custom Media Callback feature
- Removed Canadian driver's license autocapture beta feature `withCanadianDrivingLicenceAutoCaptureBetaFeatureEnabled()`

## [28.3.2] - 2023-05-16

### Fixed

- Fixed SPM `28.3.1` packaging that was pointing to `28.3.0`

## [28.3.1] - 2023-04-18

### Fixed

- Fixed SPM `28.3.0` packaging that was pointing to `28.2.0`

## [28.3.0] - 2023-04-05

### Changed

- Enhanced security around payload tampering

### Fixed

- Fixed the text cut-off issue on document confirmation screen which happens on small screen devices (e.g iPhone SEs)
- Fixed missing `OnfidoApiError` and `OnfidoFlowError` types

## [28.2.0] - 2023-03-21

### Added

- Added user analytics tracked events for Motion

### Changed

- Fixed "Umbrella header missing" warnings with SPM

### Fixed

- Fixed OnfidoExtended framework variant

## [28.1.0] - 2023-03-02

### Changed

- Added backward compatible `withDocumentStep(ofType:...` signature
- Improved translations
- Increased the Facial Similarity Video upload timeout from 5 seconds to 60 seconds

### Fixed

- Accessibility: Fixed Document capture VoiceOver support
- Fixed potential crash when dismissing Motion during recording
- Re-added missing FACIAL_INTRO event
- Fixed issue with Privacy Notices and Consent screen appearing when not required

## [28.0.1] - 2023-03-06

### Fixed

- Accessibility: Fixed Document capture VoiceOver support
- Fixed potential crash when dismissing Motion during recording
- Re-added missing FACIAL_INTRO event
- Fixed issue with Privacy Notices and Consent screen appearing when not required

## [28.0.0] - 2023-02-06

### Added

- Added ability to configure Motion face step to enable audio recording

### Changed

- Removed deprecated Document variant public APIs
- Removed SegmentSDK for analytics
- Removed requirement for hardcoded `onfido_locale` value in the Localised strings files

### Fixed

- Crash occurring with iOS 11/12
- Crash occurring during document capture related to a rare race condition
- Image orientation for RTL languages

## [27.4.0] - 2023-01-13

### Added

- Support for NFC with ID Cards (PACEv2), CAN-based authentication

## [27.3.0] - 2023-01-05

### Changed

- Reduce size of SDK binaries 

## [27.2.0] - 2022-12-22

### Added

- Extended localisation support to 44 languages
- Added RTL languages support

### Fixed

- Fix issue with registration of Appearance
- Fix crash when user stops recording video
- Remove unnecessary camera exposure mode configuration

## [27.1.0] - 2022-12-12

### Added

- Added support for address cards as proof of address in certain regions
- Create Onfido Studio documentation file
- Added Studio support for Motion

### Changed

- Added documentation for Motion to the README
- : Add support of Dashboard feature to configure supported documents

### Fixed

- UI: Fixed the crash issue on iPads when device rotated while any alert is shown on UI

## [27.0.0] - 2022-10-27

### Added

- Added ability to configure Motion face step with Photo or Video fallback in the case that Motion is unsupported by the device

### Changed

- Renamed withNFCReadBetaFeatureEnabled SDK configuration functions to withNFCReadFeatureEnabled

### Fixed

- Fix possibility that UI freezes when green checkmark displayed after successfully taking photo of document

## [26.1.1] - 2022-10-20

### Fixed

- Fixed crash on devices without the ability to use pixel binning

## [26.1.0] - 2022-09-30

### Added

- Motion can be set as the face step
- UX Selfie improvements, the end users knows the image that Onfido is storing
- Added support for DG11 and DG14 extraction on NFC
- Added Image Quality Service validations when NFC is enabled

### Changed

- Increased image resolution and change camera stream UI (full width view in 4:3 aspect ratio) for document capture
- Updated readme file to reflect the combined document type selection and country selection screen

### Fixed

- Fixed video freezing when another app has ongoing audio that we are unable to interrupt, displaying a message to the user when this is the case (most common case is ongoing phone calls)
- Fixed end user stuck on Selfie-Video task

## [26.0.1] - 2022-09-08

### Fixed

- Fix end user stuck on Selfie-Video task

## [26.0.0] - 2022-08-10

### Added

- Set secondary button border color to equal secondaryTitleColor
- Update readme file to reflect the combined document type selection and country selection screen

### Fixed

- Fix response handle doesn't fire in the iOS release 25.1.0
- Disable image quality validations before submission on the backside of Romanian National Identity Cards (fixing issues with blank backsides)
- Missing texts in DE locale

## [25.2.0] - 2022-07-22

### Added

- Exposed Enterprise Features through WorkflowConfig

### Fixed

- Fixed crashing at end of the Studio flow in loading screen
- Fixed error message to give a more accurate reason to the user when there is a missing media type connection error
- UI: Fixed the issue which caused standard font to be shown even when the custom font feature was enabled
- Fixed wrong screen being displayed and no error being returned after microphone permission denied
- Fixed the issue where it was not possible to dismiss the SDK after the consent screen was shown
- Fixed missing document types (Visa, Work permit, Generic) for customized `withDocumentStep` API

## [25.1.1] - 2022-07-13

### Added

- Geoblocking alert at document upload

## [25.1.0] - 2022-06-09

### Changed

- Improved NFC scanning tutorial with video

### Fixed

- Fix iOS fatal error for could not resolve BuildConfigurationRepository

## [25.0.0] - 2022-04-21

### Added

- Remove user consent from the public API
- Added secondaryTitleColor appearance configuration

### Changed

- Download updated supported countries for Proof of Address from endpoint
- Make Proof of Address work with Orchestration workflows

## [24.6.0] - 2022-04-11

### Added

- Includes the Alpha release of the Onfido next generation facial similarity product. To join the Alpha program customers need to get in touch with their sales representative.

## [24.5.0] - 2022-03-31

### Added

- Added support for capture of documents for proof of address reports

### Fixed

- UI: Fixed the missing body label in the CaptureConfirmationScreen
- NFC: Fixed the intro screen layout and user interaction
- UI: Fixed iOS crashes on Obj-C interface

## [24.4.0] - 2022-03-03

### Added

- Allow document type configurability on UI selection screen

### Changed

- Added dsyms into xcframework shipment

## [24.3.0] - 2022-02-08

### Changed

- UI: Improve barcode detection failures user experience by reducing warnings
- UI: Shutter button always visible, no longer hidden while waiting for auto-capture.
- UI: Add turn icon to document back side capture screen

### Fixed

- No longer showing unsupported documents i.e. GBR National ID
- Fixed a bug which caused not receiving analytics events on Objective-C interface
- Fix layout constraints issues on Intro screens

## [24.2.0] - 2022-01-04

### Added

- UI: Added language localisation for Dutch (NL)
- Add instructions carousel to NFC intro screen
- UI: Added support for capturing paper-based German driving license

### Changed

- Added: suggest user to hold the device still during the capture

### Fixed

- Updated iOS version in generated Package.swift file
- The SelfieViewController was rarely crashing during viewDidLoad.

## [24.1.0] - 2021-12-13

### Changed

- Now extracting face photo from NFC chips in documents so you can access that data on document report

### Fixed

- Now preventing crashes on the document capture coordinator by sending exceptions back to the integrator
- Fixed SDK crashing app on launch on iOS 11 and 12 due to missing CoreNFC framework

## [24.0.0] - 2021-12-07

### Changed

- Removed mobile token support
- Dropped iOS 10 support. Now supporting iOS 11 or newer.
- Removed initialisers with parameters for Appearance (ONAppearance) and CaptureSuccessColors (ONCaputreSuccessColors), and made properties public.
- Renamed withPassportNFCReadBetaFeatureEnabled sdk configuration function to withNFCReadBetaFeatureEnabled.
- Removed EnterpriseFeature convenience initialiser. Use EnterpriseFeatures.builder().withHideOnfidoLogo(_:).build() instead.

### Fixed

- Documentation correction for the document step in README file.

## [23.1.0] - 2021-11-02

### Added

- UI: Now making sure applicant's face is within oval during selfie video capture
- Updated document capture experience for better image quality (multiframe)
- UI: Live document position feedback during capture

### Changed

- Added links on how to create a check containing a document report with NFC on the README

### Fixed

- Added missing NFC library license to onfido_licenses.json
- Fix Xcode double quoted warning
- Removed unused localisation keys and values
- Removed unused and erroneous keys
- Added missing IT and PT localisation files

## [23.0.1] - 2021-10-22

### Fixed

- Improved iOS 15 compatibility

## [23.0.0] - 2021-10-01

### Added

- This version of SDK is built using Xcode 13 and would allow building your app on Xcode 13. This version of SDK would only support building your app with Xcode 13 due to lack of backward compatibility introduced by Apple with Xcode 13.

### Fixed

- Added missing IT and PT localisation files
- UI: Fix navigation bar color for iOS 15.

## [22.4.0] - 2021-09-07

### Changed

- UI: Added loading spinner at the beginning of the flow when configuration is loaded.

## [22.3.0] - 2021-08-31

### Added

- Added enterprise feature disableMobileSdkAnalytics

### Fixed

- Fixed missing throwed error when the user didn't give camera permission

## [22.2.0] - 2021-08-09

### Added

- UI: Now autocapturing Netherlands ID
- UI: Now able to extract NFC data from Netherlands Identity card

### Changed

- Accessibility: announcing successful autocapture for documents
- Changed video bitrate configuration for document capture flow
- Accessibility: announcing successful face and face turn detection
- UI: Now fetching NFC key and properties from backend servers

### Fixed

- Fixed Canadian Driving Licence not autocapturing when CAN DL beta feature enabled

## [22.1.0] - 2021-06-18

### Added

- UI: Added language localisation for italian(IT) and portuguese(PT)
- Added nfcMediaId property to DocumentResult object

### Changed

- UI: Now uploading NFC extracted data to Onfido servers
- UI: Copy updates

## [22.0.0] - 2021-06-10

### Added

- UI: Image quality service integration
- UI: Ability to customise button corner radius

### Changed

- Accessibility: improved instructions for capturing various document types
- Accessibility: improved instructions for selfie camera capture
- Now returning a single document and face result object. Only last capture returned.
- Accessibility: announcing number of results when searching for countries
- UI: Now showing auto capure message below capture frame area. Same as manual capture.
- UI: Now showing capture instructions at all times even when warning present to user
- Accessibility: improved the instruction for selfie and video capture
- Accessibility: added reference that video is being played on intro video screen
- UI: Now showing spinner instead of deterministic progress bar

### Fixed

- Value of keys onfido_video_intro_list_item_time_limit and onfido_video_intro_list_item_move_speak were swapped
- Fixed residence permit documents sent as unknown document type

## [21.4.0] - 2021-04-12

### Added

- Added ability to remote config blur detection for image quality optimisation

### Changed

- Swapped primary and secondary key names for consent denied prompt

## [21.3.0] - 2021-04-06

### Added

- M1 Mac support

### Fixed

- Fixed prod appending wrong path to framework link on Package.swift

## [21.2.0] - 2021-03-29

### Added

- UI: Now managing consent screen content load error

### Changed

- UI: Now primary button is retake and secondary is confirm on capture confirmation screen when warning present
- Made some improvements around video recording logic to prevent several crash issues which have been reported on github. [Issue 1](https://github.com/onfido/onfido-ios-sdk/issues/220), [Issue 2](https://github.com/onfido/onfido-ios-sdk/issues/222). Those issues are: https://github.com/onfido/onfido-ios-sdk/issues/227

### Fixed

- Removed incorrect keys mentioned in MIGRATION.MD document
- Fixed user cancellation Objective-C API. Now returning correct status.
- Updated README.MD to correct the function name to enable user consent screen for swift interface

## [21.1.0] - 2021-03-18

### Changed

- Now forcing user to retake image when blurry

## [21.0.0] - 2021-03-01

### Added

- UI: Added consent screen
- Now sending user reached consent screen to tracked evenets

### Changed

- UI: Added cancellation prompt to consent screen
- Updated README to provide solution for potantial App Rejection problems related with NFC

### Fixed

- Fixed onfido_locale value in Localizable.strings for German language

## [20.1.0] - 2021-02-01

### Changed

- UI: Updated upload progress view design

## [20.0.1] - 2021-01-20

### Fixed

- Fixed Swift Package Manager Package.swift pointing to the wrong SDK build

## [20.0.0] - 2021-01-18

### Added

- UI: Added accessibility header traits to title and section header elements
- Now support Swift Package Manager(SPM) as dependency manager

### Changed

- Changed dynamic framework format from fat universal framework to xcframework
- UI: Changed voiceover behaviour to focus on main content rather than back button on the SDK screen. (only for iOS 13+ versions)
- Updated README clarify Xcode version support

### Fixed

- UI: Fixed progress bar not reflecting progress
- UI: Fixed liveness capture reloading delay after retry on timeout
- UI: Fixed the errors in translation (strings) files
- Now returning error to the integrator if the camera device does not function properly

### Removed

- Carthage support due to Carthage not supporting XCFramework

## [19.0.0] - 2020-12-07

### Added

- Added Canadian driver's license autocapture as an experimental feature. Follow [README](README.md#enabling-canadian-driver-licence-auto-capture-beta) to understand how to enable this feature

### Changed

- Now sending selected document country information to the API
- UI: Country list items are treated as button for better accessibility

### Fixed

- UI: Fixed the bug causing stuck on country search screen when the search mode and voice over are on

## [18.10.1] - 2020-11-26

### Fixed

- Fixed certificate pinning bug which causes all network requests fail with `invalid_certificate` error message when `withCertificatePinning` is used

## [18.10.0] - 2020-11-24

### Added

- UI: Added search functionality on country selection screen
- UI: Added shadow view on scrollable views

### Changed

- UI: Improved US DL autocapture experience
- Updated readme to mention `NFCReaderUsageDescription` key in app permission section
- UI: Updated video capture confirmation
- Now sharing .strings files for all suported languages

### Fixed

- UI: Fixed capture confirmation error bubble not being read by VoiceOver as the first view

## [18.9.0] - 2020-10-27

### Added

- Added ability to skip selfie intro.
- UI: User can now enlarge capture document for detailed inspection

### Changed

- UI: Changed text and background colors in light mode
- Now sharing Onfido license files in github repository along with SDK bundle
- UI: Changed Onfido logo position in capture screens
- UI: Changed Onfido logo position in intro and permission screens
- UI: Added Onfido logo to the document type selection screen
- Removed unused strings from localisation
- Renamed some generic keys
- UI: Changed bubble view position and apperance for document capture flow
- Now disabling passport autocapture on simulators

### Fixed

- UI: Now showing wrong side head turn warning again
- UI: Fixed the incorrect captured document positon on confirmation screen for multi format document types

## [18.8.1] - 2020-10-22

### Fixed

- UI: Fixed several bugs causing camera freeze, laggy interaction on document capture screen

## [18.8.0] - 2020-10-07

### Changed

- Renamed most localisation keys. Now names are more explicit to in which screens they are used. [See MIGRATION to easily migrate Strings from 18.7.0 to 18.8.0](MIGRATION.md#onfido-ios-sdk-1880-migration-guide).

### Fixed

- UI: Not preventing interactive dismissal of SDK view controllers while presented modally on iPad to not have unexpected flow issues

## [18.7.0] - 2020-09-30

### Added

- UI: Passport NFC read feature (beta)

### Fixed

- UI: Fixed liveness pre-recoding screen stuck on loading state after retrying connection when connection is established

## [18.6.0] - 2020-09-21

### Changed

- Post capture confirmation error bubble on modals now grows to button width
- Removed 'Version' prefix on github release title to align with other Onfido SDKs

### Fixed

- UI: Fixed the crash problem when SDK integrates to the app running on Xcode 12 project
- UI: Fixed user able to go back during face video upload

## [18.5.0] - 2020-09-14

### Added

- Added support for South African ID folded paper document capture

### Changed

- UI: Removed separator line from the UI
- UI: Removed timer icon from subtitle in welcome screen

### Fixed

- UI: Fixed the problem about showing pause button right after playing video on liveness intro screen
- UI: Re-added `onfido_message_capture_face` key which is for screen reader (accessibility) during liveness capture flow

## [18.4.0] - 2020-08-27

### Added

- UI: Now auto capturing Passport documents
- Added configuration option to enable manual liveness capture

## [18.3.3] - 2020-08-17

### Fixed

- Fixed bundle localisation issue. [Related Github issue](https://github.com/onfido/onfido-ios-sdk/issues/162)

## [18.3.2] - 2020-08-06

### Changed

- UI: Removed Singapore endonym

### Fixed

- UI: Fix the problem about having buttons in different height. [Github Issue](https://github.com/onfido/onfido-ios-sdk/issues/169)
- Fixed localisation language selection when app and device preferred language is not supported by Bundle

## [18.3.1] - 2020-07-27

### Fixed

- Fix for sending duplicate VIDEO_FACIAL_CAPTURE_CONFIRMATION analytic event.[Related github issue](https://github.com/onfido/onfido-ios-sdk/issues/167)
- Improved memory usage
- UI: Fixed the camera load problem in some specific cases
- UI: Fixed incorrect VoiceOver focus on video capture intro video
- UI: Fixed error problem user taps shutter button right after presenting SDK.[Related github issue](https://github.com/onfido/onfido-ios-sdk/issues/168)

## [18.3.0] - 2020-07-03

### Changed

- Removed unnnecessary `advertisingIdentifier` usage

### Fixed

- Fixed folded paper documents confirmation showing warning and instructions texts when returning from following step

## [18.2.0] - 2020-06-17

### Added

- Enterprise can cobrand Onfido logo

### Changed

- UI: Changed continuous glare detection logic for US DL documents
- UI: Autocapture manual fallback alert UI has changed
- UI: No longer running glare validation on back side of Romanian identity card
- Added eventHandler and corresponding event method to ONFlow.swift for User Analytic Events
- UI: Improved US Driver Licence edge detection
- Sending barcode detection result to the API

### Fixed

- Fixed the face similarity report documentation url in README.

## [18.1.1] - 2020-06-03

### Changed

- Updated SampleApps to clarify modalPresentationStyle setting

### Fixed

- Fixed SDK crash when invalid SDK token provided
- Fixed sdk not showing document format selection when document type and country preselected but no format specified
- UI: Fix the issue related with having incorrect navigation bar theme when dark mode disabled for SDK
- UI: Now showing upload progress when user taps upload button immediately

## [18.1.0] - 2020-04-30

### Added

- UI: Now showing document template for US driving licence front capture
- Added enterprise feature 'hideOnfidoLogo

### Changed

- UI: Updated Onfido logo
- Now voice over read upload alert view element when uploading image or video
- Added information on api/token regions to documentation
- UI: Changed screen reader order (Accessibility)
- UI: Removed selfie capture title

### Fixed

- UI: Fixed the problem about having unnecessary extra height for primary button when onfido logo is hidden

## [18.0.0] - 2020-04-20

### Added

- Added German as supported language
- Added document format option for document capture step. Also changed the way to configure document capture step. Please check [README]('https://github.com/onfido/onfido-ios-sdk/blob/18.0.0/README.md#document-type-configuration') for the details
- Added integrator defined event hook to allow integrators to collect user analytics
- UI: Added icon to differentiate document back capture from front capture

### Changed

- UI: Now showing play pause button on liveness intro without delay
- UI: Now allowing user to proceed during selfie capture process on simulator

### Fixed

- Fixed the Localizable.strings not updated problem.[See]('https://github.com/onfido/onfido-ios-sdk/issues/144')
- UI: Fixed missing right margin issue on selfie intro screen
- UI: Fixed alert text cut off in some scenarios
- UI: Fixed the text cut-off issue on liveness capture screen

## [17.0.0] - 2020-02-27

### Added

- Added certificate pinning support. See https://github.com/onfido/onfido-ios-sdk#certificate-pinning for the details.

### Changed

- UI: Now using grey Onfido logo with higher contrast for accessibility
- Now using [API v3](https://documentation.onfido.com/v3/) for communication with the backend.
- UI: Now only detecting glare on rectangles of ID1 size on US DL autocapture
- UI: Now auto capturing non-blurry US DL only
- Updated bubble view design and updated barcode not readable copy
- Removed deprecated withApplicant() function from public API. Please check [migration document](https://github.com/onfido/onfido-ios-sdk/blob/master/MIGRATION.md) to understand what needs to be done.
- UI: Updated liveness capture head turn challenge design
- Updated code snippets and descriptions about API v2 with API v3 in README.
- UI: Selfie oval now same as liveness oval size
- Updated README to include bitcode support information
- UI: Updated flow intro screen user interface
- Updated mrz not detected error copy
- Changed 'mobile sdk token' expression with 'mobile token' on README to prevent confusion
- UI: Now running selfie capture validation on device instead of back-end
- UI: Now showing selfie capture post upload errors in bubble view instead of using pop-ups
- UI: Now loading selfie intro screen purely from code; Removed Xib file

### Fixed

- Fixed folded paper document on back capture loading lag issue
- UI: Fixed selfie capture text truncated when large text size used
- UI: Fixed Arabic country name endonyms
- Fixed warning about missing umbrella header (https://github.com/onfido/onfido-ios-sdk/issues/131)

## [16.2.0] - 2020-02-24

### Changed

- UI: Now showing next or finish recording button with 3 second delay on recite digit challenge view when head turn detection available

### Fixed

- UI: Fixed flow early exit on document upload double tap

## [16.1.1] - 2019-12-17 - [enterprise]

### Fixed

- UI: Fixed liveness intro video play error on static SDK

## [16.1.0] - 2019-12-05

### Added

- UI: User can choose to capture folded paper documents for French driving license and italian identity document
- UI: Now checking face is in document captured when document must contain face
- UI: Now showing error message when passport MRZ is cut off in captured image
- Now changing document capture frame ratio for folded paper documents and showing document template for 4 seconds
- Now showing passport template when user selects passport capture

### Changed

- UI: Changed voiceover message when it focuses on the liveness intro video

### Fixed

- Now both swift and objective-c version of SampleApps are consistent and up-to-dated.
- UI: Fixed photo post capture error bubble view not scaling with user defined font scale

## [16.0.0] - 2019-11-11

### Added

- New `generic` document type added
- UI: User now sees blurry photo message when document capture is blurry

### Fixed

- UI: Fixed white background shown on camera capture screens
- Cocoapods documentation is now pointing to [GitHub README](https://github.com/onfido/onfido-ios-sdk)

## [15.0.0] - 2019-10-31

### Changed

- UI: Now showing manual capture option on retake when autocapturing US DL
- UI: Now showing manual capture for US DL when only barcode detected
- Updated README to explain how to obtain sandbox token
- Changed carthage spec json file name. Please check the [README](https://github.com/onfido/onfido-ios-sdk#using-carthage) for the details.
- Now captured images include EXIF meta data.

## [14.0.0] - 2019-10-07

### Added
- Carthage support added, please check the [README](https://github.com/onfido/onfido-ios-sdk#using-carthage) for the details.

### Changed
- UI: Liveness pre-recording loader fades out and instructions now fades in. Also "Start recording" slides in from the bottom.

### Fixed
- UI: Fixed the UI bug which affects navigation bar in camera screens when integrator uses global appearance customisation for the navigation bar
- UI: Fixed the issue that causes showing constraint warnings in the console when user goes to the any camera capture screen
- UI: VoiceOver focuses on back button instead of take new picture on capture confirmation screen when transitioning between photo capture to capture confirmation
- Fixed Segment SDK crash issues, upgraded Segment SDK version to 3.7.0

## [14.0.0-rc] - 2019-09-12

### Added
- SDK Token support for US region

### Fixed
- UI: Liveness challenges security fix

## [14.0.0-beta] - 2019-08-29

### Changed
- UI: US driving license autocapture manual capture fallback message now announced in bubble instead of bottom bar view

### Fixed
- UI: Face capture confirmation now scrolls on when large text used

## [13.2.0] - 2019-08-22

### Fixed
- UI: User has to retake on document capture when no document is found on current capture

## [13.1.0] - 2019-08-14

### Added
- Added ability to refresh SDK token when its expired
- UI: Added dark mode support for iOS 13. See the https://github.com/onfido/onfido-ios-sdk#ui-customisation page for the details.

### Changed
- UI: When auto capturing a US DL, the transition to manual capture will only happen after 10 seconds of the first document is detected (even if not aligned)
- UI: Changed document not found pop-up for error bubble on capture confirmation upload
- US driving license autocapture now default feature.

### Fixed
- UI: Fixed the not being able to set correct font issue on iOS 13
- UI: Fix for the separator disappear problem when any document type tapped on iOS 13
- UI: Fixed the not showing unsupported orientation view for flow intro and selfie intro screens when device in horizontal mode
- UI: Fixed the crash on liveness head turn challenge screen when head turn animation and tapping next button happened at the same time
- UI: Fixed liveness intro video player and video reload showing at the same time
- UI: Error bubble view on capture confirmation view cut off on iPad modal

## [13.0.0] - 2019-07-17

### Added
- UI: Added edge detection feedback on US driving license autocapture
- Added SDK token support

### Changed
- UI: Now returning UI feedback on document alignment on US driving license autocapture when face or barcode not detectable but correct document shape

### Fixed
- UI: Fixed the liveness video corruption issue on iOS 13

## [12.2.0] - 2019-07-02

### Added
- Added United States' driver's license autocapture as an experimental feature. Can be enabled by calling withUSDLAutocapture() in the OnfidoConfig.builder()
- Updated README with adding SDK size impact information
- UI: Added dynamic font size support for video capture confirmation screen
- UI: Added support for the new token format

### Fixed
- UI: Unsupported screen appears and gets stuck in app only supporting portrait mode
- UI: Fixed the UI issue about showing unnecessary oval shape in upload progress bar view
- UI: Poland's endonym on country selection screen
- UI: Fixed the crash on iPad for the apps that support only landscape orientation

## [12.1.0] - 2019-06-18

### Changed
- UI: Improved the video capture challenge generation and added error handling

## [12.0.0] - 2019-05-29

### Added
- UI: New faceStep config added for not showing video in liveness intro screen

### Changed
- UI: Optimised liveness intro videos resolution and duration, reducing overall size

## [11.1.2] - 2019-05-23

### Fixed
- UI: User sees liveness intro screen after app is backgrounded during liveness capture
- UI: Device permission screen labels overlapping with icon when user setting has larger text size
- UI: Fix for having wrong sized record button on liveness capture screen in some dynamic font size configured cases
- UI: Fixed crash when tapping two buttons on capture confirmation screen at the same time
- Removed unnecessary string keys
- SDK does not throw `OnfidoFlowError.microphonePermission` when face capture photo variant is used and app has microphone permission denied
### Added
- UI: Play/Pause functionality for liveness intro video added

## [11.1.1] - 2019-04-29

### Fixed
- Fixed full bitcode not included in universal Onfido framework (named `Onfido-Debug` or just `Onfido`)

## [11.1.0] - 2019-04-25

### Added
- UI: Added work permit document type support(beta)
- UI: Accessibility voiceover improvements for all screens
- UI: Camera, Microphone and both camera and microphone permission screens added before requesting permissions

### Changed
- UI: Changed document capture area ratio for passport
- UI: Changed circle loading indicator to progress bar for document and video upload progress

### Fixed
- UI: Accessibility voiceover improvements for all screens
- UI: Fixed crash issue during recording video in some cases

## [11.0.1] - 2019-04-08

### Fixed
- fixed debug SDK not compiling for simulators
- fixed nullability warning

## [11.0.0] - 2019-04-01

### Added
- UI: Showing bubble for wrong head turn detection on liveness screen
- UI: Added dynamic font size support for flow intro and selfie intro screens
- UI: Added dynamic font size support for liveness capture screen
- UI: Added dynamic font size support for bubble views that appears in photo capture, liveness head turn detection and capture confirmation screens
- UI: Added dynamic font size support for liveness intro screen
- UI: Added dynamic font size support for photo capture confirmation screen
- UI: Added dynamic font size support for buttons
- UI: Added dynamic font size support for document photo capture screen
- UI: Added french localisation
- Allowing custom localisation from non-localised strings file

### Fixed

- UI: Fixed crash when capture and retake buttons tapped continuously
- Fixed SDK not throwing error when user denies microphone permission during liveness capture (face capture video variant)

## [10.6.0] - 2019-03-12

### Added
- UI: Added real time head turn progress for liveness screen

### Changed
- UI: Flow intro shows arrow icon instead of numbered icon when single SDK configured with single capture step

### Fixed
- UI: Arrow on glare detection bubble and barcode undetected bubble not separated from main rectangle containing text
- fixed incorrect cropping of document image when document capture started on landscape

## [10.5.0] - 2019-03-06

### Added
- UI: Added optional welcome intro screen
- UI: Added selfie (face capture photo variant) intro screen
- UI: Added dynamic font size support for document type selection screen
- UI: Added dynamic font size support for country selection screen
- UI: Added latency for face detection on liveness capture (face capture video variant) to allow readability of instructions

### Changed
- UI: Increased capture screens opacity for accessibility
- UI: Country selection screen label text (`onfido_country_selection_toolbar_title` and `onfido_unsupported_document_description`)
- Improved the documentation about `onfido_locale` string

### Fixed
- UI: Fixed text cut-off issue on liveness instructions screens when user language is Spanish
- UI: Fixed Onfido logo and video playback view overlapping issue in liveness intro screen
- Fixed cut-off issue on document images captured on certain iPads
- Fix for the intermittent video cut-off issue when liveness capture recorded on certain iPads
- Removed unused assets

## [10.4.0] - 2019-02-07

### Added
- Integrators can now specify strings file bundle location
- UI: Added visa document type support with UI vignette

### Changed
- UI: Added video tutorial to liveness intro screen
- UI: Updated primary and secondary pressed state color
- UI: updated liveness capture buttons design

## [10.3.0] - 2019-01-28

### Added
- UI: Ability to customise Font-Family

### Fixed
- UI: Subtitle text truncate issue fixed on document selection screen
- UI: Fix for the crash on iPad when switch to landscape mode

### Changed
- UI: Changed button colors on country selection screen.

## [10.2.0] - 2019-01-04

### Added
- UI: Document and face capturing processes are now properly followed by screen readers
- UI: Document type selection buttons are now properly read by screen readers
- UI: UI changes on secondary button

### Fixed
- UI: Fix sdk crash on capture during the backside capture of two sided document on Cordova
- UI: Fix for the Segment SDK name clash
- UI: Fix infinite spinning wheel not removed when liveness upload failed.
- UI: Fixed custom localisation of text in liveness confirmation screen now going over multiple lines when text too long (max three)

### Changed
- UI: Changed colors of the UI elements regarding to the new Onfido branding.
- UI: Onfido logo updated.
- UI: Improved UI for sdk flow with `formSheet` modal presentation style
- UI: Changed UI on liveness intro screen

## [10.1.0] - 2018-11-14

### Added
- UI: Managing request timeouts mid flow.
- UI: Now detecting face is within oval before starting liveness recording
- Ability to customise buttons and icons colors

### Changed
- UI: Changed copy on Liveness Intro screen
- UI: Confirm and cancel buttons redesigned
- Internal: Updated the map for the supported countries for each document

## [10.0.0] - 2018-09-13

### Changed
- UI: Changed copy on the selfie capture screen
- No longer compatible with Swift 4.1 and Swift 3.3, now compatible with Swift 4.2 and Swift 3.4.

### Removed
- UI: Removed label from capture confirmation screen

### Fixed:
- Build status on readme not rendering
- Xcode warnings on missing headers

### Removed:
- Swinject from external dependency list
- No longer using ZSWTappableLabel and ZSWTaggedString dependencies

## [9.0.0] - 2018-09-03

### Added
- ability to run SDK on simulator

### Removed
- No longer using SwiftyJSON

### Fixed
- UI: SDK crash when tapping screen on face photo capture

## [8.0.0] - 2018-08-01

### Added:
- Internal: Added the language displayed by the SDK as a parameter on the live video upload, for speech analysis purposes.

### Changed
- Flow now dismisses upon completion unless shouldDismissFlowOnCompletion set to false
- Internal: Changed our analytics solution from an external provider to an in-house service

### Removed
- SDK no longer supports iOS 8. Now iOS 9+.

### Fixed
- UI: Glare detection bubble localisation breaking when custom localisation with long text is used.

## [7.2.0] - 2018-07-17

**Note**: This version might be a breaking change if you are providing customised language translations. Please see [MIGRATION.md](MIGRATION.md).

### Added
- UI: country selection screen to filter for document type and country combination supported by Onfido
- UI: user can now retry upload when internet connection is lost
- post capture barcode detection for United States driving license captures

### Fixed
- UI: sdk crash when quickly transitioning between document type and document capture screens

## [7.1.0] - 2018-06-07

**Note**: This version might be a breaking change if you are providing customised language translations. Please see [MIGRATION.md](MIGRATION.md).

### Changed
- UI: document type selection is now its own screen with refreshed design
- UI: user flow back navigation is now a natural screen back

### Removed
- Removed Alamofire dependency
- Removed MBProgressHUD dependency

### Fixed
- UI: Powered by Onfido logo size and position inconsistencies between document/face capture and confirmation.
- UI: Powered by Onfido logo position change after rotation in doc/face capture confirmation screen

## [7.0.0] - 2018-04-17

**Note**: This version might be a breaking change if you are providing customised language translations. Please see [MIGRATION.md](MIGRATION.md).

### Changed
- UI: Updated error dialogs copy

### Fixed
- upload results objects now exposing to objective-c integrator
- UI: Fixed possible crash on camera capture
- UI: Fixed crash on rotation during live video recording
- UI: Fixed crash on going back from preselected document capture screen while glare detected
- UI: Fixed back button with English text on non-English language text flow

## [6.0.0] - 2018-04-04

**Note:**
* This version is not backwards-compatible. Migration notes can be found in [MIGRATION.md](MIGRATION.md)

### Changed
- SDK built using Swift 4.1 and Xcode 9.3

## [5.6.0] - 2018-03-16

### Added
- Added custom language localisation option using `withCustomLocalization()` method when configuring the flow
- UI: Added translation for Spanish (es)

### Changed
- Objective-C integrator no longer has to hold a strong reference to `ONFlow` instance during flow execution

### Fixed
- UI: Fixed a crashed that happened when starting the sdk and tapping the back button quickly

## [5.5.0] - 2018-03-05

### Added
- Objective-C interface allows document type to be specified as part of the document step configuration

### Changed
- Swift integrator no longer has to hold a strong reference to `OnfidoFlow` instance during flow execution (Objective-C integrator should still hold the strong reference)

## [5.4.1] - 2018-02-21

### Fixed
- UI: Fixed two crashes related to the capture screen (by tapping cancel in the document selection and by tapping the capture button before the capture screen shows up)

## [5.4.0] - 2018-02-12

### Added
- UI: Video face capture screens adapted for `formSheet` presentation style

### Fixed
- UI: Fixed app crash or showing confirmation screen when exiting app during face video recording

## [5.3.0] - 2018-02-02

### Added
- Added Objective-C interface

### Changed
- Internal: Reduced live video maximum duration from 25s to 20s

### Fixed
- UI: Fixed crash when going back from live video intro screen to document selection

## [5.2.0] - 2018-01-17

### Added
- UI: Added manual focus on document capture. It's now possible to trigger by tapping on document within rectangle

### Changed
- UI: Refreshed face capture experience
- Internal: Using XCAssets for bundling images in the framework instead of separate bundle

### Fixed
- UI: Fixed large back button issue on iPhone X
- UI: Fixed face capture oval height ratio on iPhone X
- Internal: Fixed issue with not cleaning up uploaded images and videos from device
- Internal: Fixed issue with different video codecs being used for video capture
- Internal: Fixed document photo resolution in order to reduce data usage

## [5.1.0] - 2017-11-27

### Deprecated
- Deprecated `withApplicant` method and `applicantResult` object.

### Added
- Added `withApplicantId` method as a preferred way to start a flow with previously created applicant

### Changed
- UI: Refreshed face capture confirmation screen

### Fixed
- UI: The document frame aspect ratio, in both capture and confirmation screen,
on iPhone X is now consistent with ther other models.

## [5.0.2] - 2017-11-15

### Removed

- Internal: Removed ObjectMapper and AlamofireObjectMapper from podspec

## [5.0.1] - 2017-11-09

### Changed

- Internal: Improved glare detection algorithm
- Internal: Fixed issue on lower end devices sending low resolution images of document to the Onfido API

## [5.0.0] - 2017-11-06

**Note:**
* This version is not backwards-compatible. Migration notes can be found in [MIGRATION.md](MIGRATION.md)

### Changed

- Now support only supporting Swift 3.2.2 and Swift 4.0.2. Removed support for Swift 3.2 and 4.

## [4.0.1] - 2017-10-25

### Changed

- Internal: Cropping of document picture is now less agressive and done with higher precision.

## [4.0.0] - 2017-10-09

**Note:**
* This version is not backwards-compatible. Migration notes can be found in [MIGRATION.md](MIGRATION.md)

### Added

- UI: New video face capture screen/step
- Added video variant to the face step, which allows to capture face during live video recording

### Changed

- Simplified API configuration for easier integration, `create` and `capture` options have been merged into steps which do both
- Simplified API errors. Got rid of errors nesting

### Removed

- Success results are no longer returned for captured images
- Removed ability to disable analytics

## [3.0.0] - 2017-09-15

**Note:**
* This version is not backwards-compatible. Migration notes can be found in [MIGRATION.md](MIGRATION.md)
* This version supports Swift 3.2 and Swift 4 but we have not tested it fully against iOS 11 yet, therefore we cannot guarantee that all features will work properly on that operating system

### Added
- UI: Added support for Resident Permit as a new document type
- UI: On document capture screen, a bubble notification will be displayed in real-time if glare is detected on a document

### Changed
- Now supporting only Swift 3.2 and Swift 4. Removed support for Swift 3.1

## [2.2.0] - 2017-08-14

### Added
- UI: Rotation instructions on iPads

### Changed
- UI: Improved document capture experience
- Internal: Improved metrics

## [2.1.3] - 2017-06-19

### Fixed
- Downgraded Alamofire version to 4.4 as 4.5 was generating a new error which will be investigated

## [2.1.2] - 2017-06-06

### Added
- New image quality filter (notifies user upon glare detection)

## [2.1.1] - 2017-05-17

### Changed
- Bug fix:
    + Resolved message label issue on smaller screens being cut off

### Added
- Ability to preselect document type accepted for document capture screen (skips document type selection)

## [2.0.3] - 2017-04-05

- Bug fix:
    + Resolved framework binary incompatibility issue for integrators using Swift 3.1

## [2.0.2] - 2017-03-29

- Stability improvements
- Bug fixes:
    + Fixed crash on simulator due to missing camera. Throws OnfidoFlowError.deviceHasNoCamera.
- Minor UI improvements.

## [2.0.1] - 2017-03-16

### Changed
- Manages camera permission and throws permission error when denied.
- Throws error when SDK configuration is missing applicant object.

## [1.2.0] - 2016-12-15

### Changed
- Onfido SDK now supports modally presented with form sheet style for iPads
- Fixed issue with Applicant creation process with incorrect date of birth
- Fixed issue with ApplicantResult with nil date of birth when should be present.
- Improvements to reduce and avoid memory leaks

## [0.0.10] - 2016-12-15

### Changed
- Bug fix for iPhones > 5s incorrect capture and crash upon image selection on capture screens

## [0.0.8] - 2016-12-14
### Added
- Support for different document types. For Driving Licences and National ID cards the reverse of the document is required. The front of the document is validated by our server to make sure a readable document is present.

### Changed
- Swift version used is now 3.0
- iOS supported version is 8.0 and above

## [0.0.6] - 2016-10-25
### Removed
- Applicant details capture view
- Dependency on MICountryPicker

### Changed
- Updated syntax to Swift 2.3 (preparing to Swift 3.0)
- Updated version of AlamofireObjectMapper to 3.0.2
- The OnfidoUI class initialisation methods (refer to the README file)

### Added
- Option to bring the capture UI without actually creating anything on the Onfido servers
- The applicant details are now passed as a Hash if the client wants the library to create it
- The SDK will return the LivePhoto or Document (including the captured files) when calling the callback closure of the host app - making it possible to use the capture UI without creating the files on the Onfido server, grabbing them and uploading later on
- OnfidoSDKResults class which will encapsulate the return values (Applicant, LivePhoto, Document or Check) to the host app's callback closure
- A "validate" parameter has been added to the OnfidoAPI.uploadDocument() method (refer to the Readme file)


## [0.0.5] - 2016-07-28
### Added
- Callbacks to the Document/Facial captures
- Mapping between alpha2 and alpha3 ISO3166-1 codes

### Changed
- Improved the UI, specially in the "Next" buttons and the applicant details form
- Fixed the country code being sent to the API (it takes ISO3166-1 alpha3)
- Improved the way the binary framework is built and made it easier to ship new versions

## [0.0.3-pre] - 2016-07-20
### Added
- Initial public release (preview)
