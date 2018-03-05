# Onfido

[![Version](https://img.shields.io/cocoapods/v/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)
[![Build Status](https://www.bitrise.io/app/d04e3a422799521b/status.svg?token=vBI0wpdUSfh25wctd1MHfA&branch=master)](https://www.bitrise.io/app/d04e3a422799521b)
[![License](https://img.shields.io/cocoapods/l/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)
[![Platform](https://img.shields.io/cocoapods/p/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)

## Table of contents

*   [Overview](#overview)
*   [Getting started](#getting-started)
*   [Handling callbacks](#handling-callbacks)
    *   [Success handling](#success-handling)
    *   [Error handling](#run-exceptions)
*   [Customising SDK](#customising-sdk)
    *   [Flow customisation](#flow-customisation)
*   [Creating checks](#creating-checks)
*   [Going live](#going-live)
*   [Migrating](#migrating)
*   [More information](#more-information)


## Overview

This SDK provides a drop-in set of screens and tools for iOS applications to allow capturing of identity documents and face photos/live videos for the purpose of identity verification with [Onfido](https://onfido.com/). The SDK offers a number of benefits to help you create the best on-boarding/identity verification experience for your customers:

-   Carefully designed UI to guide your customers through the entire photo/video-capturing process
-   Modular design to help you seamlessly integrate the photo/video-capturing process into your application flow
-   Advanced image quality detection technology to ensure the quality of the captured images meets the requirement of the Onfido identity verification process, guaranteeing the best success rate
-   Direct image upload to the Onfido service, to simplify integration\*

\*Note: the SDK is only responsible for capturing and uploading photos/videos. You still need to access the [Onfido API](https://documentation.onfido.com/) to create and manage checks.

![Capture Document and face](assets/Overview.png)

## Getting started

* SDK supports iOS 8.0 and above
* SDK supports Swift 3.2.2 and Swift 4.0.2

### 1. Obtaining tokens

In order to start integration, you will need the **API token** and the **mobile SDK token**. You can use our [sandbox](https://documentation.onfido.com/#testing) environment to test your integration, and you will find these two sandbox tokens inside your [Onfido Dashboard](https://onfido.com/dashboard/api/tokens).

**Warning:** You **MUST** use the **mobile SDK token** and not the **API token** when configuring the SDK itself.

### 2. App permissions

The Onfido SDK makes use of the device Camera. You will be required to have the `NSCameraUsageDescription` and `NSMicrophoneUsageDescription` keys in your application's `Info.plist` file:

```xml
<key>NSCameraUsageDescription</key>
<string>Required for document and facial capture</string>
<key>NSMicrophoneUsageDescription</key>
<string>Required for video capture</string>
```
**Note**: Both keys will be required for app submission.

### 3. Adding the SDK dependency

The SDK is available on Cocoapods and you can include it in your projects by adding the following to your Podfile:

```ruby
pod 'Onfido'
```

Run `pod install` to get the sdk.


### 4. Creating an Applicant

You must create an Onfido [applicant](https://documentation.onfido.com/#applicants) before you start the flow.

For a document or face check the minimum applicant details required are `firstName` and `lastName`.

You must create applicants from your server:

```shell
$ curl https://api.onfido.com/v2/applicants \
    -H 'Authorization: Token token=YOUR_API_TOKEN' \
    -d 'first_name=Theresa' \
    -d 'last_name=May'
```

The JSON response has an `id` field containing a UUID that identifies the applicant. You will pass the applicant ID to the SDK and all documents or live photos/videos uploaded by that instance of the SDK will be associated with that applicant.

### 5. Creating the SDK configuration

Once you have an added the SDK as a dependency and you have an applicant ID, you can configure the SDK:

```swift
let config = try! OnfidoConfig.builder()
    .withToken("YOUR_TOKEN_HERE")
    .withApplicantId("APPLICANT_ID_HERE")
    .withDocumentStep()
    .withFaceStep(ofVariant: .photo)
    .build()

let onfidoFlow = OnfidoFlow(withConfiguration: config)
    .with(responseHandler: { results in
        // Callback when flow ends
    })
```

### 6. Starting the flow

```swift
let onfidoRun = try! onfidoFlow.run()

self.present(onfidoRun, animated: true, completion: nil) //`self` should be your view controller
```

*Important Note:* When using the objective C interface, make sure to keep a **strong** reference to the `ONFlow` object until the flow is finished, otherwise the flow won't work correctly.

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

1.  (Deprecated) `OnfidoResult.applicant`: In order to create a check after the flow, you want to look into its payload to find the applicant id. Only with this id you can create the check.
2.  `OnfidoResult.document` and `OnfidoResult.face`: Its payload is relevant in case you want to manipulate or preview the captures in someway.

Keep reading to find out how to extract the payload of each `OnfidoResult` enum value.


#### (Deprecated) Applicant result payload

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

You need the applicant ID to create a check, see [Creating checks](#creating-checks).

#### Capture result payload

Under normal circumstances, you would not need to inspect the results of the captures themselves, as the SDK handles file uploads for you.
However, if you want to see information regarding the document and face captures, you can access the result object as follows:

```swift
let document: Optional<OnfidoResult> = results.filter({ result in
  if case OnfidoResult.document = result { return true }
  return false
}).first

if let documentUnwrapped = document, case OnfidoResult.document(let documentResponse) = documentUnwrapped {

  /* documentResponse
  Onfido API response to the upload of the document
  More details: https://documentation.onfido.com/#upload-document
  */
  print(documentResponse.id)

  // use documentResponse.href to fetch the captured image if required
}
```

Face follows a similar structure to document, but the `case` is `OnfidoResult.face` instead of `OnfidoResult.document`.

### Error handling

#### Response Handler Errors

The `Error` object returned, as part of `OnfidoResponse.error(Error)`, is of type `OnfidoFlowError`. It's an enum with multiple cases depending on the error type.

Note: Not all cases part of `OnfidoFlowError` will be passed to `OnfidoResponse.error`, there is one case that error will be returned as an exception, see [Run Exceptions](#run-exceptions) and [Configuration errors](#configuration-errors).

```swift
switch response {
  case let OnfidoResponse.error(error):
    switch error {
      case OnfidoFlowError.cameraPermission:
        // It happens if the user denies permission to the sdk during the flow
      case OnfidoFlowError.failedToWriteToDisk:
        // It happens when the SDK tries to save capture to disk, maybe due to a lack of space
      case OnfidoFlowError.microphonePermission:
        // It happens when the user denies permission for microphone usage by the app during the flow
      case OnfidoFlowError.upload(let OnfidoApiError):
        // It happens when the SDK receives an error from a API call see [https://documentation.onfido.com/#errors](https://documentation.onfido.com/#errors) for more information
      case OnfidoFlowError.exception(withError: let error, withMessage: let message):
        // It happens when an unexpected error occurs, please contact [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com?Subject=ISSUE%3A) when this happens
      default: // necessary because swift
    }
}
```

#### Run exceptions

When initiating the SDK there can be an exception, which you can handle with a `do/catch` as shown below:

```swift
do {
  let onfidoRun = try self.onfidoFlow!.run()
  self.present(onfidoRun, animated: true, completion: nil)
}
catch let error {
  switch error {
    case OnfidoFlowError.cameraPermission:
      // do something about it here
    case OnfidoFlowError.microphonePermission:
      // do something about it here
    case OnfidoFlowError.deviceHasNoCamera:
      // do something about it here
    default:
      // should not happen, so if it does, log it and let us know
  }
}
```

#### Configuration errors

The following are required when configuring the Onfido iOS SDK:
  - Mobile SDK token
  - Applicant
  - At least one capture step

Otherwise you may encounter the following errors when calling the `build()` function on the OnfidoConfig.Builder instance:
  - `OnfidoConfigError.missingToken`, when no or empty string token is provided
  - `OnfidoConfigError.missingApplicant`, when no applicant instance is provided
  - `OnfidoConfigError.missingSteps`, when no step is provided
  - `OnfidoConfigError.multipleApplicants`, when both an applicant and an appliacantId are provided


## Customising SDK

### Flow customisation

The SDK can be customised by specifying the steps to capture and upload when configuring.

You can either specify to capture the document and/or face of the user.

The face step has two variants:
  - `FaceStepVariant.photo` for face photo capture
  - `FaceStepVariant.video` for face video capture

```swift
let config = try! OnfidoConfig.builder()
    .withToken("YOUR_TOKEN_HERE")
    .withApplicantId(applicantId)
    .withDocumentStep()
    .withFaceStep(ofVariant: .photo) // specify the face capture variant here
    .build()
```

The document step can be further configured to capture single document types from a specific country. The document types supported are:
  - Passport: `DocumentType.passport`
  - Driving Licence: `DocumentType.drivingLicence`
  - National Identity Card: `DocumentType.nationalIdentityCard`
  - Residence Permit: `DocumentType.residencePermit`

Let's say that you would like to capture only driving licenses from the United Kingdom. The following code shows how to do this:

```swift
let config = try! OnfidoConfig.builder()
    .withToken("YOUR_TOKEN_HERE")
    .withApplicantId(applicantId)
    .withDocumentStep(ofType: .drivingLicence, andCountryCode: "GBR")
    .withFaceStep(ofVariant: .photo) // specify the face capture variant here
    .build()
```

## Creating checks

As the SDK is only responsible for capturing and uploading photos/videos, you would need to start a check on your backend server using the [Onfido API](https://documentation.onfido.com/).

### 1. Obtaining an API token

All API requests must be made with an API token included in the request headers. You can find your API token (not to be mistaken with the mobile SDK token) inside your [Onfido Dashboard](https://onfido.com/dashboard/api/tokens).

Refer to the [Authentication](https://documentation.onfido.com/#authentication) section in the API documentation for details. For testing, you should be using the sandbox, and not the live, token.

### 2. Creating a check

You will need to create an *express* check by making a request to the [create check endpoint](https://documentation.onfido.com/#create-check), using the applicant id. If you are just verifying a document, you only have to include a [document report](https://documentation.onfido.com/#document-report) as part of the check. On the other hand, if you are verifying a document and a face photo/live video, you will also have to include a [facial similarity report](https://documentation.onfido.com/#facial-similarity) with the corresponding variants: `standard` for the photo option and `video` for the video option.

```shell
$ curl https://api.onfido.com/v2/applicants/YOUR_APPLICANT_ID/checks \
    -H 'Authorization: Token token=YOUR_API_TOKEN' \
    -d 'type=express' \
    -d 'reports[][name]=document' \
    -d 'reports[][name]=facial_similarity' \
    -d 'reports[][variant]=standard'
```

Note: you can also submit the POST request in JSON format.

You will receive a response containing the check id instantly. As document and facial similarity reports do not always return actual [results](https://documentation.onfido.com/#results) straightaway, you need to set up a webhook to get notified when the results are ready.

Finally, as you are testing with the sandbox token, please be aware that the results are pre-determined. You can learn more about sandbox responses [here](https://documentation.onfido.com/#sandbox-responses).

### 3. Setting up webhooks

Refer to the [Webhooks](https://documentation.onfido.com/#webhooks) section in the API documentation for details.

## Going live

Once you are happy with your integration and are ready to go live, please contact [client-support@onfido.com](mailto:client-support@onfido.com) to obtain live versions of the API token and the mobile SDK token. You will have to replace the sandbox tokens in your code with the live tokens.

A few things to check before you go live:

- Make sure you have set up [webhooks](https://documentation.onfido.com/#webhooks) to receive live events
- Make sure you have entered correct billing details inside your [Onfido Dashboard](https://onfido.com/dashboard/)

## Migrating

You can find the migration guide at [MIGRATION.md](MIGRATION.md) file

## More Information

### App Store submission

During development it is OK to use `pod 'Onfido'` but that will fail App Store submission. Please use `pod 'Onfido-Release'` in your Podfile for App Store submission.

For more information as to why we do this please check out our [FAQ's](docs/FAQ.md)

### Sample App

We have included a Sample App to show how to integrate with the Onfido SDK. Check out the SampleApp directory.

### Support

Please open an issue through GitHub. Please be as detailed as you can. Remember not to submit your token in the issue. Also check the closed issues to check whether it has been previously raised and answered.

If you have any issues that contain sensitive information please send us an email with the `ISSUE:` at the start of the subject to [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com?Subject=ISSUE%3A)

Copyright 2018 Onfido, Ltd. All rights reserved.
