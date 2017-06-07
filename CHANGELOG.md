# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).
This change log file is based on best practices from [Keep a CHANGELOG](http://keepachangelog.com/)

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
