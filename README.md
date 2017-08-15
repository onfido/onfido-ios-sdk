# Onfido

[![Version](https://img.shields.io/cocoapods/v/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)
[![Build Status](https://www.bitrise.io/app/d04e3a422799521b/status.svg?token=vBI0wpdUSfh25wctd1MHfA&branch=master)](https://www.bitrise.io/app/d04e3a422799521b)
[![License](https://img.shields.io/cocoapods/l/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)
[![Platform](https://img.shields.io/cocoapods/p/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)

## Table of contents

*   [Overview](#overview)
*   [Getting started](#getting-started)
*   [Handling callbacks](#handling-callbacks)
*   [Run exceptions](#run-exceptions)
*   [Customising SDK](#customising-sdk)
*   [Creating checks](#creating-checks)
*   [Going live](#going-live)
*   [More information](#more-information)


## Overview

This SDK provides a drop-in set of screens and tools for an iOS applications to allow capturing of identity documents and face photos for the purpose of identity verification. The SDK offers a number of benefits to help you create the best on-boarding / identity verification experience for your customers:

-   Carefully designed UI to guide your customers through the entire photo-capturing process
-   Modular design to help you seamlessly integrate the photo-capturing process into your application flow
-   Advanced image quality detection technology to ensure the quality of the captured images meets the requirement of the Onfido identity verification process, guaranteeing the best success rate
-   Direct image upload to the Onfido service, to simplify integration\*

\*Note: the SDK is only responsible for capturing and uploading photos. You still need to access the [Onfido API](https://documentation.onfido.com/) to create and manage checks.

![Capture Document and face](assets/Overview.png)


## Getting started

The SDK supports iOS 8.0 and above.

### 1. Obtaining tokens

In order to start integration, you will need the **API token** and the **mobile SDK token**. You can use our [sandbox](https://documentation.onfido.com/#testing) environment to test your integration, and you will find these two sandbox tokens inside your [Onfido Dashboard](https://onfido.com/dashboard/api/tokens).

**Warning:** You **MUST** use the **mobile SDK token** and not the **API token** when configuring the SDK itself.

### 2. App permissions

The Onfido SDK makes use of the device Camera. You will be required to have the `NSCameraUsageDescription` key in your application's `Info.plist` file:

```
<key>NSCameraUsageDescription</key>
<string>Required for document and facial capture</string>
```

### 3. Adding the SDK dependency

The SDK is availble on Cocoapods and you can include it in your projects by adding the following to your Podfile:

```ruby
pod 'Onfido'
```

Run `pod install` to get the sdk.


### 4. Creating the SDK configuration

After adding the SDK as a dependency you can configure the SDK:

```swift
let applicant = Applicant.new(
    firstName: "Theresa",
    lastName: "May"
)

let onfidoFlow = OnfidoFlow(apiToken: "YOUR_MOBILE_TOKEN")
    .and(capture: [.document, .livePhoto])
    .and(create: [.applicant(applicant), .document(validate:true), .livePhoto])
    .and(handleResponseWith: { results in
      // Callback when flow ends
    })
```

### 5. Starting the flow

```swift
let onfidoRun = try! onfidoFlow.run()

self.present(onfidoRun, animated: true, completion: nil) //`self` should be your view controller
```

*Important Note:* Make sure to keep a **strong** reference to the `OnfidoFlow` object until the flow is finished, otherwise the flow won't work correctly.

Congratulations! You have successfully started the flow. Carry on reading the next sections to learn how to:

-   Handle callbacks
-   Customise the SDK
-   Create checks


## Handling callbacks

To receive the result from the flow, you should pass a callback to the instance of `OnfidoFlow`. Typically, on success, you would [create a check](#creating-checks) on your backend server.

The result object passed to the callback may include the following attributes: `.success([OnfidoResult])`, `.error(Error)` and `.cancel`.

```swift
let responseHandler: (OnfidoResponse) -> Void = { response in
  switch response {
    case let .error(error):
        // Some error happened
    case let .success(results):
        // User completed the flow
        // You can create your check here
    case .cancel:
        // Flow cancelled by the user
  }
}
```

### Success handling

Success is when the user has reached the end of the flow.

`[OnfidoResult]` is a list with multiple results. The results are different enum values, each with its own associated value (also known as payload). This enum, `OnfidoResult`, can have the following values:

1.  `OnfidoResult.applicant`: In order to create a check after the flow, you want to look into its payload to find the applicant id. Only with this id you can create the check.
2.  `OnfidoResult.document` and `OnfidoResult.livePhoto`: Its payload is relevant in case you want to manipulate or preview the captures in someway.

Keep reading to find out how to extract the payload of each `OnfidoResult` enum value.


#### Applicant result payload

How to handle an applicant result:

```swift
let applicant: Optional<OnfidoResult> = results.filter({ result in
  if case OnfidoResult.applicant = result { return true }
  return false
}).first

if let applicantUnwrapped = applicant, case OnfidoResult.applicant(let applicantResult) = applicantUnwrapped {
    /* applicantResult
     Onfido api response to the creation of the applicant
     More details: https://documentation.onfido.com/#create-applicant
     */
    print(applicantResult.id)
    // At this point you have all the necessary information to create a check
}
```

After getting the created applicant, you can create a check, see [Creating checks](#creating-checks).

#### Capture result payload

Under normal circumstances, you would not need to inspect the results of the captures themselves, as the SDK handles file uploads for you.
However, if you want to see information regarding the document and face captures, you can access the result object as follows:

```swift
let document: Optional<OnfidoResult> = results.filter({ result in
  if case OnfidoResult.document = result { return true }
  return false
}).first

if let documentUnwrapped = document, case OnfidoResult.document(validationResult: let documentResponse, data: let documentData) = documentUnwrapped {
  /* documentResponse
  Onfido api response to the upload of the document
  More details: https://documentation.onfido.com/#upload-document
  */
  print(documentResponse.id)

  /* documentData
  Data object with the image binary
   */
  let image = UIImage(data: documentCapture)
}
```

Live photo follows a similar structure to document, but the `case` is `OnfidoResult.livePhoto` instead of `OnfidoResult.document`.


### Error handling

The `Error` object returned, as part of `OnfidoResponse.error(Error)`, is of type `OnfidoFlowError`. It's an enum with multiple cases depending on the error type.

Note: Not all cases part of `OnfidoFlowError` will be passed to `OnfidoResponse.error`, there is one case that error will be returned as an exception, see [Run Exceptions](#run-exceptions).

```swift
switch response {
  case let OnfidoResponse.error(error):
    switch error {
      case OnfidoFlowError.applicant(let applicantError):
        // Errors related to the creation of an applicant
      case OnfidoFlowError.document(let documentError):
        // Errors related to the capture, saving and uploading
        // of a document
      case OnfidoFlowError.livePhoto(let livePhotoError):
        // Errors related to the capture, saving and uploading
        // of a live photo of a face
      case OnfidoFlowError.check(let checkError):
        /* @Deprecated
        This error will only happen if you have the create check option enabled,
        which has been deprecated, see #create-check-option-deprecated. */
      case OnfidoFlowError.missingApplicant:
        // If no applicant is passed to the sdk this error will happen
        // You don't have to handle this if you pass an applicant to the sdk
      case OnfidoFlowError.deviceHasNoCamera:
        // In case the device does not have the necessary cameras
      case OnfidoFlowError.cameraPermission:
        // It happens if the user denies permission to the sdk during the flow
      default: // necessary because swift
    }
}
```

#### `ApplicantError`

An applicant error can also have multiple causes, they can be handled as shown below:

```swift
switch applicantError {
  case let .upload(onfidoApiError):
    /*
    There was an error when the applicant was created on the onfido api.
    See https://documentation.onfido.com/#errors
    */
    self.dismiss(animated: true, completion: nil) //closing the sdk
  case let .unkownUpload(error):
    /*
    This is a catch all case, possible scenarios:
    1. Connection error
    2. Internal server error
    3. Response parsing error
    4. Other Exception

    It's recommended to log this as an exception and let us know if it happens.
    */
    self.dismiss(animated: true, completion: nil) //closing the sdk
}
```

#### `DocumentError`

```swift
switch documentError {
  case let .upload(onfidoApiError):
    /*
    There was an error when the document was uploaded to the onfido api.
    See https://documentation.onfido.com/#errors
    */
    self.dismiss(animated: true, completion: nil) //closing the sdk
  case let .unknownError(error):
    /*
    This is a catch all case, possible scenarios:
    1. Connection error
    2. Internal server error
    3. Response parsing error
    4. Other Exception

    It's recommended to log this as an exception and let us know if it happens.
    */
    self.dismiss(animated: true, completion: nil) //closing the sdk
  case .failedToWriteToDisk:
    /*
    If the disk is full the sdk will fail.
    It's recommended to inform the user, since they can correct and try again.
    */
    self.dismiss(animated: true, completion: nil) //closing the sdk
  case .noDocumentInImage, .hasGlare, .applicantRequired:
    // @Deprecated
}
```

#### `LivePhotoError`

```swift
switch livePhotoError {
  case let .upload(onfidoApiError):
    /*
    There was an error when the photo was uploaded to the onfido api.
    See https://documentation.onfido.com/#errors
    */
    self.dismiss(animated: true, completion: nil) //closing the sdk
  case let .unknownError(error), .unknown:
    /*
    This is a catch all case, possible scenarios:
    1. Connection error
    2. Internal server error
    3. Parsing error
    4. Other Exception

    It's recommended to log this as an exception and let us know if it happens.
     */
    self.dismiss(animated: true, completion: nil) //closing the sdk
  case .failedToWriteToDisk:
    /*
    If the disk is full the sdk will fail.
    It's recommended to inform the user, since they can correct and try again.
    */
    self.dismiss(animated: true, completion: nil) //closing the sdk
  case .applicantRequired, .faceNotDetected, .multipleFacesDetected:
    // @Deprecated
}
```

## Run exceptions

When initiaing the sdk there can be an exception, which you can handle with a `do/catch` as shown below:

```swift
do {
  let onfidoRun = try self.onfidoFlow!.run()
  self.present(onfidoRun, animated: true, completion: nil)
}
catch let error {
  switch error {
    case OnfidoFlowError.cameraPermission:
      // do something about it here
    default:
      // should not happen, so if it does, log it and let us know
  }
}
```


## Customising SDK

The sdk can be customised on two levels:

1.  Capture options, what capture steps the user will go through (document, face)
2.  Create options: What the sdk will upload to the onfido api

```swift
let onfidoFlow = OnfidoFlow(apiToken: "YOUR_MOBILE_TOKEN")
    .and(capture: [CaptureOption])
    .and(create: [CreateOption])
```

### Capture options

By passing an array of `CaptureOption` to `OnfidoFlow.and(capture: [CaptureOption])`, you can define a set of capture steps that the user will go through.

The possible combinations are the following:

1.  Just document: `[CaptureOption.document]`
2.  Just face: `[CaptureOption.livePhoto]`
3.  The standard document and face: `[CaptureOption.document, CaptureOption.livePhoto]`

Note: This array is treated as a Set, so the order and duplicates are ignored.

#### Customize document capture option

By default the `CaptureOption.document` will ask the user to select their document type.

However, it's possible to bypass this document selection step by using the following option: `CaptureOption.documentWith(documentType: [DOCUMENT_TYPE], countryCode: "COUNTRY_CODE_ISO")`.
Since the step is no longer shown to the user, the document type needs to be defined in code.

The following document types are allowed: `.passport`, `.drivingLicence` and `.nationalIdentityCard`.

For the country code the SDK accepts the ISO 3166-1 alpha-3 standard representation of the country as a `string`.


### Create options

By passing an array of `CreateOption` to `OnfidoFlow.and(create: [CreateOption])`, you can tell what the sdk will upload or create on the onfido api. This facilates the integration on a data level with Onfido, plus it provides capture validation funcionality (for both face and document), which would otherwise not work if those `CreateOption` steps were not defined.

A recommended combination, which will upload both document and face once they are capture, is: `[CreateOption.applicant(applicant), CreateOption.document(validate: true), CreateOption.livePhoto]`. With `applicant` defined prior.

The possible options are discussed in the following sub sections.

#### Create applicant option (required)

By adding the enum `CreateOption.applicant(Applicant)`, with an `Applicant` object, to the create list you will create an applicant which will be associated to the captured document and face.
This is a required option.

The minimum details on an applicant for a document and face check is `firstName` and `lastName`, however in case you need to pass more details here is an example:

```swift
let dobString = "1956-10-01"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-mm-dd"
let dobDate = dateFormatter.date(from: dobString)!

let address = Address(
    buildingNumber: "10",
    street: "Downing St",
    town: "London",
    postcode: "SW1A 2AA",
    country: "GBR"
)

let applicant = Applicant.new(
    firstName: "Theresa",
    lastName: "June",
    email: "pm@number10.gov.uk",
    dateOfBirth: dobDate,
    country: "GBR",
    idNumbers: [],
    addresses: [address]
)
```

#### Create document option (recommended)

Using the enum `CreateOption.document(validate: Bool)` makes the sdk upload the captured documents to the onfido api.

If `validate: Bool` is set to `true`, it will also ask the onfido engine to perform a quality check on the document at the time of upload.
If this quality check fails the user is asked to take another capture.
By not including this step, or by setting `validate: false`, you will lose the validation funcionality of the sdk,
which will lead to an increase of failed checks, due too poor quality captures. Which in turn leads to unnecessary costs on your part. Therefore it is not recommended to omit this step or to turn off validation.

#### Create live photo option (recommended)

Using the enum `CreateOption.livePhoto` makes the sdk upload the captured face to the onfido api.
At the time of upload the onfido engine will also perform a quality check on the captured face.
Unlike the document option, you cannot turn this validation off without completly omiting this `CreateOption` step.

If the quality check fails to detect a face (or detects multiple faces) the user is asked to take another capture.

By not including this step, not only you will you have to upload the capture to the onfido api, you will lose the validation funcionality of the sdk.
Which will lead to an increase of failed checks, due too poor quality captures.
Which in turn leads to unnecessary costs on your part. Therefore it is not recommended to omit this step or to turn off validation.


#### Create check option (deprecated)

Using the enum `CreateOption.check(Check)` makes the sdk create a check on the onfido api. However, this is not recommended, since this type of operation should be done on the back-end since it offers more control.


## Creating checks

As the SDK is only responsible for capturing and uploading photos, you would need to start a check on your backend server using the [Onfido API](https://documentation.onfido.com/).

### 1. Obtaining an API token

All API requests must be made with an API token included in the request headers. You can find your API token (not to be mistaken with the mobile SDK token) inside your [Onfido Dashboard](https://onfido.com/dashboard/api/tokens).

Refer to the [Authentication](https://documentation.onfido.com/#authentication) section in the API documentation for details. For testing, you should be using the sandbox, and not the live, token.

### 2. Creating a check

You will need to create an *express* check by making a request to the [create check endpoint](https://documentation.onfido.com/#create-check), using the applicant id available from the SDK [callbacks](#handling-callbacks). If you are just verifying a document, you only have to include a [document report](https://documentation.onfido.com/#document-report) as part of the check. On the other hand, if you are verify a document and a face photo, you will also have to include a [facial similarity report](https://documentation.onfido.com/#facial-similarity).

```shell
$ curl https://api.onfido.com/v2/applicants/YOUR_APPLICANT_ID/checks \
    -H 'Authorization: Token token=YOUR_API_TOKEN' \
    -d 'type=express' \
    -d 'reports[][name]=document' \
    -d 'reports[][name]=facial_similarity'
```

Note: you can also submit the POST request in JSON format.

You will receive a response containing the check id instantly. As document and facial similarity reports do not always return actual [results](https://documentation.onfido.com/#results) straightaway, you need to set up a webhook to get notified when the results are ready.

Finally, as you are testing with the sandbox token, please be aware that the results are pre-determined. You can learn more about sandbox responses [here](https://documentation.onfido.com/#sandbox-responses).

### 3. Setting up webhooks

Refer to the [Webhooks](https://documentation.onfido.com/#webhooks) section in the API documentation for details.


## More Information

### App Store submission

During development it is OK to use `pod 'Onfido'` but that will fail App Store submission. Please use `pod 'Onfido-Release'` in your Podfile for App Store submission.

For more information as to why we do this please check out our [FAQ's](docs/FAQ.md)

### Sample App

We have included a Sample App to show how to integrate with the Onfido SDK. Check out the SampleApp directory.

### Support

Please open an issue through GitHub. Please be as detailed as you can. Remember not to submit your token in the issue. Also check the closed issues to check whether it has been previously raised and answered.

If you have any issues that contain sensitive information please send us an email with the `ISSUE:` at the start of the subject to [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com?Subject=ISSUE%3A)

Copyright 2016 Onfido, Ltd. All rights reserved.
