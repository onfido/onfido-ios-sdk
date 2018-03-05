# Onfido SDK Migration Guides

These guides below are provided to ease the transition of existing applications using the Onfido SDK from one version to another that introduces breaking API changes.

* [Onfido iOS SDK 5.5.0 Migration Guide](#onfido-sdk-550-migration-guide)
* [Onfido iOS SDK 5.1.0 Migration Guide](#onfido-sdk-510-migration-guide)
* [Onfido iOS SDK 5.0.0 Migration Guide](#onfido-sdk-500-migration-guide)
* [Onfido iOS SDK 4.0.0 Migration Guide](#onfido-sdk-400-migration-guide)
* [Onfido iOS SDK 3.0.0 Migration Guide](#onfido-sdk-300-migration-guide)

## Onfido SDK 5.5.0 Migration Guide

While this is a minor release there are memory management improvements which means it's no longer necessary to keep a strong reference to `OnfidoFlow` for the swift interface (objective C interface still needs it). This means you can create the object, use it and not have to keep it as a property.


## Onfido SDK 5.1.0 Migration Guide

While this is a minor release and there are no breaking changes we have deprecated parts of the API.

### Applicants

We have deprecated `OnfidoConfig.builder().withApplicant(applicant)` in favour of `OnfidoConfig.builder().withApplicantId(applicantId)`. We now recommend that you create an Onfido applicant yourself on your backend and pass the applicant ID to the SDK. Similarly the applicantResult object in the `responseHandler` is also deprecated. Both `withApplicant` and `applicantResult` will continue to work as before, but will be removed in the next major release of the SDK.

## Onfido SDK 5.0.0 Migration Guide

This version is mainly an upgrade to the compiled SDK form. In order to use this version check out the requirements below.

### Requirements

- Xcode 9.1
- Swift 3.2.2 or Swift 4.0.2

### Breaking API changes

There are no breaking api changes in terms of coding.

## Onfido SDK 4.0.0 Migration Guide

This version has some major changes that include a full refactor of the API (breaking) with which you can integrate more easily and use our latest face video capture feature.

### Requirements

- Xcode 9.0+
- iOS 8+
- Swift 3.2 or Swift 4

### Benefits of upgrading

- Easier to integrate with API
- New face video capture feature

### Breaking API Changes

The SDK now does not allow to be used as a capture only tool. Upload and validation of capture is now mandatory. The option to disable analytics has also been removed.

#### Configuring and Running SDK

We have been given feedback that API could be easier to integrate with. We have learnt from our customers how they use the SDK and applied that knowledge, together with the lessons learned, in order to provide better experience and cut down on the SDK integration time.

The code below compares a simple configuration of document and face capture with upload to the Onfido API.

**Note:** Capture only configurations are no longer supported

```swift
// Onfido iOS SDK 3

let applicant = Applicant.new(
    firstName: "Theresa",
    lastName: "May"
)

let onfidoFlow = OnfidoFlow(apiToken: "YOUR_MOBILE_TOKEN", allowAnalytics: false)
    .and(capture: [.document, .livePhoto])
    .and(create: [.applicant(applicant), .document(validate:true), .livePhoto])
    .and(handleResponseWith: { results in
      // Callback when flow ends
    })

// Onfido iOS SDK 4.0.0

let applicant = Applicant.new(
    firstName: "Theresa",
    lastName: "May"
)

/**
Note: option to disable analytics no longer supported
*/
let config = try! OnfidoConfig.builder()
    .withToken("YOUR_TOKEN_HERE")
    .withApplicant(applicant)
    .withDocumentStep()
    .withFaceStep(ofVariant: .photo)
    .build()

let onfidoFlow = OnfidoFlow(withConfiguration: config)
    .with(responseHandler: { results in
        // Callback when flow ends
    })
```

The document step capture with a pre-selected document type with country has also changed in the new API.

```swift
// Onfido iOS SDK 3

let applicant = Applicant.new(
    firstName: "Theresa",
    lastName: "May"
)

let onfidoFlow = OnfidoFlow(apiToken: "YOUR_MOBILE_TOKEN")
    .and(capture: [.documentWith(documentType: .drivingLicence, countryCode: "GBR"), .livePhoto]) // .documentWith(documentType: _, countryCode: _) as capture option for document type pre-selection
    .and(create: [.applicant(applicant), .document(validate:true), .livePhoto])
    .and(handleResponseWith: { results in
      // Callback when flow ends
    })

// Onfido iOS SDK 4.0.0

let applicant = Applicant.new(
    firstName: "Theresa",
    lastName: "May"
)

let config = try! OnfidoConfig.builder()
    .withToken("YOUR_TOKEN_HERE")
    .withApplicant(applicant)
    .withDocumentStep(ofType: .drivingLicence, andCountryCode: "GBR") // document type step with pre-selection
    .withFaceStep(ofVariant: .photo)
    .build()

let onfidoFlow = OnfidoFlow(withConfiguration: config)
    .with(responseHandler: { results in
        // Callback when flow ends
    })
```


#### Success handling

We have changed the way document results are handled and removed the capture image by the user.

```swift
// Onfido iOS SDK 3

let document: Optional<OnfidoResult> = results.filter({ result in
  if case OnfidoResult.document = result { return true }
  return false
}).first

if let documentUnwrapped = document, case OnfidoResult.document(validationResult: let documentResponse, data: let documentData) = documentUnwrapped {
  print(documentResponse.id)
  let image = UIImage(data: documentData)
}

// Onfido iOS SDK 4.0.0

let document: Optional<OnfidoResult> = results.filter({ result in
  if case OnfidoResult.document = result { return true }
  return false
}).first

if let documentUnwrapped = document, case OnfidoResult.document(let documentResponse) = documentUnwrapped {
  print(documentResponse.description)
  // you can now find the image capture by accessing the following field:
  let imageUrl = documentResponse.href
}
```

We have changed `livePhoto` similarly to `document` (no capture returned), but additionally `OnfidoResult.livePhoto` has been renamed to `OnfidoResult.face`. The renamed enum value now takes a payload of `FaceResult` instead of `LivePhotoResult`, which also includes the result from video upload in the case where the face step specifies `.video` variant whilst configuring the SDK (pre-run).

```swift
// Onfido iOS SDK 3

let livePhoto: Optional<LivePhotoResult> = results.filter({ result in
  if case OnfidoResult.livePhoto = result { return true }
  return false
}).first

if let livePhotoUnwrapped = livePhoto, case OnfidoResult.livePhoto(validationResult: let documentResponse, data: let livePhotoData) = documentUnwrapped {
  print(livePhoto.id)
  let image = UIImage(data: livePhotoData)
}
// Onfido iOS SDK 4.0.0

let faceResult: Optional<FaceResult> = results.filter({ result in
  if case OnfidoResult.face = result { return true }
  return false
}).first

if let faceUnwrapped = face, case OnfidoResult.face(let documentResponse, data: let faceResult) = faceUnwrapped {
  print(livePhoto.description)
  let imageUrl = livePhoto.href
}
```

#### Permissions

You will be required to have the `NSCameraUsageDescription` and `NSMicrophoneUsageDescription` keys in your application's `Info.plist` file:

```xml
<key>NSCameraUsageDescription</key>
<string>Required for document and facial capture</string>
<key>NSMicrophoneUsageDescription</key>
<string>Required for video capture</string>
```
**Note**: Both keys will be required for app submission.

#### Error handling

We have simplified errors that are returned by our API and denested them. We have gone away from domain based errors to higher level errors i.e.: `OnfidoFlowError.document(DocumentError.upload(OnfidoApiError))` and `OnfidoFlowError.applicant(ApplicantError.upload(OnfidoApiError))` have now been merged and simplified into `OnfidoFlowError.upload(OnfidoApiError)`.

## Onfido SDK 3.0.0 Migration Guide

This version is mainly an upgrade to the compiled SDK form. In order to use this version check out the requirements below.

### Requirements

- Xcode 9
- Swift 3.2 or Swift 4

### Breaking API changes

There are no breaking api changes in terms of coding.

### New Features

#### Added new document type support

The user can now select `Resident Permit Card` in the document type selection action sheet.

Furthermore `DocumentType.residencePermit` can now be added as the first parameter of `CaptureOption.documentWith(documentType: _, countryCode: _)`. This will no longer prompt the user to select the document type that they wish to submit but rather will be expected to upload a Resident Permit Card.

#### Improved UI

The SDK is now continuously evaluating if document on live camera stream has glare and notifies the user with text on bubble when detected.
