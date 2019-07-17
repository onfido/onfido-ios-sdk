# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

**Note**: If the strings translations change it will result in a MINOR version change, therefore you are responsible for testing your translated layout in case you are using custom translations. [More on language localisation](README.md#language-customisation)

## [13.0.0] - 2019-07-17

### Added
- UI: Added edge detection feedback on US driving license autocapture
- Public: Added SDK token support

### Changed
- UI: Now returning UI feedback on document alignment on US driving license autocapture when face or barcode not detectable but correct document shape

### Fixed
- UI: Fixed the liveness video corruption issue on iOS 13

## [12.2.0] - 2019-07-02

### Added
- Public: Added United States' driver's license autocapture as an experimental feature. Can be enabled by calling withUSDLAutocapture() in the OnfidoConfig.builder()
- Public: Updated README with adding SDK size impact information
- UI: Added dynamic font size support for video capture confirmation screen
- UI: Added support for the new token format

### Fixed
- UI: Unsupported screen appears and gets stuck in app only supporting portrait mode
- UI: Fixed the UI issue about showing unnecessary oval shape in upload progress bar view
- UI: Poland's endonym on country selection screen
- UI: Fixed the crash on iPad for the apps that support only landscape orientation

## [12.1.0] - 2019-06-18

### Fixed
- UI: Unsupported screen appears and gets stuck in app only supporting portrait mode
- UI: Fixed the UI issue about showing unnecessary oval shape in upload progress bar view
- UI: Poland's endonym on country selection screen
- UI: Fixed the crash on iPad for the apps that support only landscape orientation

### Added
- UI: Added dynamic font size support for video capture confirmation screen
- UI: Added support for the new token format
- Public: Updated README with adding SDK size impact information

## [12.1.0] - 2019-06-18

### Changed
- UI: Improved the video capture challenge generation and added error handling

### Added
- Public: Added United States' driver's license autocapture as an experimental feature. Can be enabled by calling withUSDLAutocapture() in the OnfidoConfig.builder()

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
- Public: Removed unnecessary string keys
- Public: SDK does not throw `OnfidoFlowError.microphonePermission` when face capture photo variant is used and app has microphone permission denied
### Added
- UI: Play/Pause functionality for liveness intro video added

## [11.1.1] - 2019-04-29

### Fixed
- Public: Fixed full bitcode not included in universal Onfido framework (named `Onfido-Debug` or just `Onfido`)

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
- Public: fixed debug SDK not compiling for simulators
- Public: fixed nullability warning

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
- Public: Allowing custom localisation from non-localised strings file

### Fixed

- UI: Fixed crash when capture and retake buttons tapped continuously
- Public: Fixed SDK not throwing error when user denies microphone permission during liveness capture (face capture video variant)

## [10.6.0] - 2019-03-12

### Added
- UI: Added real time head turn progress for liveness screen

### Changed
- UI: Flow intro shows arrow icon instead of numbered icon when single SDK configured with single capture step

### Fixed
- UI: Arrow on glare detection bubble and barcode undetected bubble not separated from main rectangle containing text
- Public: fixed incorrect cropping of document image when document capture started on landscape

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
- Public: Improved the documentation about `onfido_locale` string

### Fixed
- UI: Fixed text cut-off issue on liveness instructions screens when user language is Spanish
- UI: Fixed Onfido logo and video playback view overlapping issue in liveness intro screen
- Public: Fixed cut-off issue on document images captured on certain iPads
- Public: Fix for the intermittent video cut-off issue when liveness capture recorded on certain iPads
- Public: Removed unused assets

## [10.4.0] - 2019-02-07

### Added
- Public: Integrators can now specify strings file bundle location
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
- Public: Ability to customise buttons and icons colors

### Changed
- UI: Changed copy on Liveness Intro screen
- UI: Confirm and cancel buttons redesigned
- Internal: Updated the map for the supported countries for each document

## [10.0.0] - 2018-09-13

### Changed
- UI: Changed copy on the selfie capture screen
- Public: No longer compatible with Swift 4.1 and Swift 3.3, now compatible with Swift 4.2 and Swift 3.4.

### Removed
- UI: Removed label from capture confirmation screen

### Fixed:
- Public: Build status on readme not rendering
- Public: Xcode warnings on missing headers

### Removed:
- Public: Swinject from external dependency list
- Public: No longer using ZSWTappableLabel and ZSWTaggedString dependencies

## [9.0.0] - 2018-09-03

### Added
- Public: ability to run SDK on simulator

### Removed
- Public: No longer using SwiftyJSON

### Fixed
- UI: SDK crash when tapping screen on face photo capture

## [8.0.0] - 2018-08-01

### Added:
- Internal: Added the language displayed by the SDK as a parameter on the live video upload, for speech analysis purposes.

### Changed
- Public: Flow now dismisses upon completion unless shouldDismissFlowOnCompletion set to false
- Internal: Changed our analytics solution from an external provider to an in-house service

### Removed
- Public: SDK no longer supports iOS 8. Now iOS 9+.

### Fixed
- UI: Glare detection bubble localisation breaking when custom localisation with long text is used.

## [7.2.0] - 2018-07-17

**Note**: This version might be a breaking change if you are providing customised language translations. Please see [MIGRATION.md](MIGRATION.md).

### Added
- UI: country selection screen to filter for document type and country combination supported by Onfido
- UI: user can now retry upload when internet connection is lost
- Public: post capture barcode detection for United States driving license captures

### Fixed
- UI: sdk crash when quickly transitioning between document type and document capture screens

## [7.1.0] - 2018-06-07

**Note**: This version might be a breaking change if you are providing customised language translations. Please see [MIGRATION.md](MIGRATION.md).

### Changed
- UI: document type selection is now its own screen with refreshed design
- UI: user flow back navigation is now a natural screen back

### Removed
- Public: Removed Alamofire dependency
- Public: Removed MBProgressHUD dependency

### Fixed
- UI: Powered by Onfido logo size and position inconsistencies between document/face capture and confirmation.
- UI: Powered by Onfido logo position change after rotation in doc/face capture confirmation screen

## [7.0.0] - 2018-04-17

**Note**: This version might be a breaking change if you are providing customised language translations. Please see [MIGRATION.md](MIGRATION.md).

### Changed
- UI: Updated error dialogs copy

### Fixed
- Public: upload results objects now exposing to objective-c integrator
- UI: Fixed possible crash on camera capture
- UI: Fixed crash on rotation during live video recording
- UI: Fixed crash on going back from preselected document capture screen while glare detected
- UI: Fixed back button with English text on non-English language text flow

## [6.0.0] - 2018-04-04

**Note:**
* This version is not backwards-compatible. Migration notes can be found in [MIGRATION.md](MIGRATION.md)

### Changed
- Public: SDK built using Swift 4.1 and Xcode 9.3

## [5.6.0] - 2018-03-16

### Added
- Public: Added custom language localisation option using `withCustomLocalization()` method when configuring the flow
- UI: Added translation for Spanish (es)

### Changed
- Public: Objective-C integrator no longer has to hold a strong reference to `ONFlow` instance during flow execution

### Fixed
- UI: Fixed a crashed that happened when starting the sdk and tapping the back button quickly

## [5.5.0] - 2018-03-05

### Added
- Public: Objective-C interface allows document type to be specified as part of the document step configuration

### Changed
- Public: Swift integrator no longer has to hold a strong reference to `OnfidoFlow` instance during flow execution (Objective-C integrator should still hold the strong reference)

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
- Public: Added Objective-C interface

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
- Public: Deprecated `withApplicant` method and `applicantResult` object.

### Added
- Public: Added `withApplicantId` method as a preferred way to start a flow with previously created applicant

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

- Public: Now support only supporting Swift 3.2.2 and Swift 4.0.2. Removed support for Swift 3.2 and 4.

## [4.0.1] - 2017-10-25

### Changed

- Internal: Cropping of document picture is now less agressive and done with higher precision.

## [4.0.0] - 2017-10-09

**Note:**
* This version is not backwards-compatible. Migration notes can be found in [MIGRATION.md](MIGRATION.md)

### Added

- UI: New video face capture screen/step
- Public: Added video variant to the face step, which allows to capture face during live video recording

### Changed

- Public: Simplified API configuration for easier integration, `create` and `capture` options have been merged into steps which do both
- Public: Simplified API errors. Got rid of errors nesting

### Removed

- Public: Success results are no longer returned for captured images
- Public: Removed ability to disable analytics

## [3.0.0] - 2017-09-15

**Note:**
* This version is not backwards-compatible. Migration notes can be found in [MIGRATION.md](MIGRATION.md)
* This version supports Swift 3.2 and Swift 4 but we have not tested it fully against iOS 11 yet, therefore we cannot guarantee that all features will work properly on that operating system

### Added
- UI: Added support for Resident Permit as a new document type
- UI: On document capture screen, a bubble notification will be displayed in real-time if glare is detected on a document

### Changed
- Public: Now supporting only Swift 3.2 and Swift 4. Removed support for Swift 3.1

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
