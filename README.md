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
    *   [Localisation](#localisation)
    *   [Language customisation](#language-customisation)
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

* SDK supports iOS 9.0 and above
* SDK supports Swift 3.3 and Swift 4.1

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

#### Swift

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

#### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];

[configBuilder withToken:@"YOUR_TOKEN_HERE"];
[configBuilder withApplicantId:@"APPLICANT_ID_HERE"];
[configBuilder withDocumentStep];
[configBuilder withFaceStepOfVariant:ONFaceStepVariantPhoto];

NSError *configError = NULL;
ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];

if (configError == NULL) {
    ONFlow *onFlow = [[ONFlow alloc] initWithFlowConfiguration:config];
    [onFlow withResponseHandler:^(ONFlowResponse *response) {
        // Callback when flow ends
    }];
}
```

### 6. Starting the flow

#### Swift

```swift
let onfidoRun = try! onfidoFlow.run()

self.present(onfidoRun, animated: true, completion: nil) //`self` should be your view controller
```

#### Objective-C

```Objective-C
NSError *runError = NULL;
UIViewController *onfidoController = [onFlow runAndReturnError:&runError];

if (runError == NULL) {
    [self presentViewController:onfidoController animated:YES completion:NULL];
}
```

Congratulations! You have successfully started the flow. Carry on reading the next sections to learn how to:

-   Handle callbacks
-   Customise the SDK
-   Create checks

## Handling callbacks

To receive the result from the flow, you should pass a callback to the instance of `OnfidoFlow` (`ONFlow` for Objective-C). Typically, on success, you would [create a check](#creating-checks) on your backend server.

The result object passed to the callback may include the following attributes for Swift: `.success([OnfidoResult])`, `.error(Error)` and `.cancel`. For Objective-C based interface an instance of `ONFlowResponse` is passed back to the callback with three properties: `results`, `error` and `userCanceled`. When `userCanceled` is false then `results` or `error` properties will be set.

#### Swift

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

#### Objective-C

```Objective-C
(^responseHandlerBlock)(ONFlowResponse *response) {

    if (response.userCanceled) {
        // Flow cancelled by the user
    } else if (response.results) {
        // User completed the flow
        // You can create your check here
    } else if (response.error) {
        // Some error happened
    }
}
```

### Success handling

Success is when the user has reached the end of the flow.

#### Swift

`[OnfidoResult]` is a list with multiple results. The results are different enum values, each with its own associated value (also known as payload). This enum, `OnfidoResult`, can have the following values:

1.  (Deprecated) `OnfidoResult.applicant`: In order to create a check after the flow, you want to look into its payload to find the applicant id. Only with this id you can create the check.
2.  `OnfidoResult.document` and `OnfidoResult.face`: Its payload is relevant in case you want to manipulate or preview the captures in someway.

Keep reading to find out how to extract the payload of each `OnfidoResult` enum value.

#### Objective-C

`[ONFlowResult]` is a list with multiple results. The result is an instance of `ONFlowResult` containing two properties: `type`, which is an enum with values `ONFlowResultTypeDocument`, `ONFlowResultTypeFace` and `ONFlowResultTypeApplicant`, and `result`, which instance type can be of `ONApplicantResult`, `ONDocumentResult` or `ONFaceResult`. The result type can be derived by the `type` property.

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

##### Swift

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

##### Objective-C

```Objective-C

NSPredicate *documentResultPredicate = [NSPredicate predicateWithBlock:^BOOL(id flowResult, NSDictionary *bindings) {

    if (((ONFlowResult *)flowResult).type == ONFlowResultTypeDocument) {
        return YES;
    } else {
        return NO;
    }
}];
NSArray *flowWithDocumentResults = [results filteredArrayUsingPredicate:documentResultPredicate];

if (flowWithDocumentResults.count > 0) {

    /* documentResponse
    Onfido API response to the upload of the document
    More details: https://documentation.onfido.com/#upload-document
    */
    ONDocumentResult *documentResult = ((ONFlowResult *)flowWithDocumentResults[0]).result;
    NSLog(@"%@", documentResult.id);

    // use documentResponse.href to fetch the captured image if required
}
```

Face follows a similar structure to document, change the type `ONFlowResultTypeDocument` for `ONFlowResultTypeFace`.

### Error handling

#### Response Handler Errors

##### Swift

The `Error` object returned, as part of `OnfidoResponse.error(Error)`, is of type `OnfidoFlowError`. It's an enum with multiple cases depending on the error type.

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

Note: Not all cases part of `OnfidoFlowError` will be passed to `OnfidoResponse.error`, there is one case that error will be returned as an exception, see [Run Exceptions](#run-exceptions) and [Configuration errors](#configuration-errors).

##### Objective-C

The `error` property of the `ONFlowResponse` returned to the callback block is of type `NSError`. You can easily identify the error by comparing the `code` property of the `NSError` instance with `ONFlowError`, i.e. `response.code == ONFlowErrorCameraPermission`. You could also find out more about the error by printing or logging the `userInfo` property of the `NSError` instance.  The `NSError` contained within the `ONFlowResponse`'s `error` property can be handled such as:

```Objective-C
switch (error.code) {
    case ONFlowErrorCameraPermission:
        // It happens if the user denies permission to the sdk during the flow
        break;
    case ONFlowErrorFailedToWriteToDisk:
        // It happens when the SDK tries to save capture to disk, maybe due to a lack of space
        break;
    case ONFlowErrorMicrophonePermission:
        // It happens when the user denies permission for microphone usage by the app during the flow
        break;
    case ONFlowErrorUpload:
        // It happens when the SDK receives an error from a API call see [https://documentation.onfido.com/#errors](https://documentation.onfido.com/#errors) for more information
        // you can find out more by printing or logging userInfo from error
        break;
    case ONFlowErrorException:
        // It happens when an unexpected error occurs, please contact [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com?Subject=ISSUE%3A) when this happens
        break;
}
```

Note: Not all cases part of `ONFlowError` will be passed to response handler block, there is one case that error will be returned as an exception, see [Run Exceptions](#run-exceptions) and [Configuration errors](#configuration-errors).

#### Run exceptions

When initiating the SDK there can be an exception.

##### Swift

You can handle run exceptions in Swift with a `do/catch` as shown below:

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

##### Objective-C

You can handle run exceptions in Objective-C as shown below:

```Objective-C
NSError *runError = NULL;
UIViewController *onfidoController = [onFlow runAndReturnError:&runError];

if (runError) {
    switch (runError.code) {
        case ONFlowErrorCameraPermission:
            // do something about it here
            break;
        case ONFlowErrorMicrophonePermission:
            // do something about it here
            break;
        case ONFlowErrorDeviceHasNoCamera:
            // do something about it here
            break;
        default:
            // do something about it here
            break;
    }
} else {
    [self presentViewController:onfidoController animated:YES completion:NULL];
}
```

#### Configuration errors

The following are required when configuring the Onfido iOS SDK:

- Mobile SDK token
- Applicant
- At least one capture step

Otherwise you may encounter the following errors when calling the `build()` function on the OnfidoConfig.Builder (`ONFlowConfigBuilder` in Objective-C) instance:

- `OnfidoConfigError.missingToken` (`ONFlowConfigErrorMissingSteps` in Objective-C), when no or empty string token is provided
- `OnfidoConfigError.missingApplicant` (`ONFlowConfigErrorMissingApplicant` in Objective-C), when no applicant instance is provided
- `OnfidoConfigError.missingSteps` (`ONFlowConfigErrorMissingSteps` in Objective-C), when no step is provided
- `OnfidoConfigError.multipleApplicants` (`ONFlowConfigErrorMultipleApplicants` in Objective-C), when both an applicant and an appliacantId are provided


## Customising SDK

### Flow customisation

The SDK can be customised by specifying the steps to capture and upload when configuring.

You can either specify to capture the document and/or face of the user.

The face step has two variants:

- `FaceStepVariant.photo` (`ONFaceStepVariantPhoto` for Objective-C) for face photo capture
- `FaceStepVariant.video` (`ONFaceStepVariantVideo` for Objective-C) for face video capture


#### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withToken("YOUR_TOKEN_HERE")
    .withApplicantId(applicantId)
    .withDocumentStep()
    .withFaceStep(ofVariant: .photo) // specify the face capture variant here
    .build()
```

#### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];

[configBuilder withToken:@"YOUR_TOKEN_HERE"];
[configBuilder withApplicantId:@"APPLICANT_ID_HERE"];
[configBuilder withDocumentStep];
[configBuilder withFaceStepOfVariant:ONFaceStepVariantPhoto];

NSError *configError = NULL;
ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];

if (configError) {
    // Handle config build error
} else {
    // use config
}
```

The document step can be further configured to capture single document types from a specific country. The document types supported are:

- Passport: `DocumentType.passport` (`ONDocumentTypePassport` for Objective-C)
- Driving Licence: `DocumentType.drivingLicence` (`ONDocumentTypeDrivingLicence` for Objective-C)
- National Identity Card: `DocumentType.nationalIdentityCard` (`ONDocumentTypeDrivingLicence` for Objective-C)
- Residence Permit: `DocumentType.residencePermit` (`ONDocumentTypeResidencePermit` for Objective-C)

Let's say that you would like to capture only driving licenses from the United Kingdom. The following code shows how to do this:

#### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withToken("YOUR_TOKEN_HERE")
    .withApplicantId(applicantId)
    .withDocumentStep(ofType: .drivingLicence, andCountryCode: "GBR")
    .withFaceStep(ofVariant: .photo) // specify the face capture variant here
    .build()
```

#### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];

[configBuilder withToken:@"YOUR_TOKEN_HERE"];
[configBuilder withApplicantId:@"APPLICANT_ID_HERE"];
[configBuilder withDocumentStepOfType:ONDocumentTypeDrivingLicence andCountryCode:@"GBR"];
[configBuilder withFaceStepOfVariant:ONFaceStepVariantPhoto];

NSError *configError = NULL;
ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];
```

### Localisation

Onfido iOS SDK already comes with out-of-the-box translations for the following locales:

 - English (en) 🇬🇧
 - Spanish (es) 🇪🇸

In case you would like us to add translations for some other locales we don't provide yet, please contact us through [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com?Subject=ISSUE%3A).

### Language customisation

**Note**: 
- If the strings translations change it will result in a MINOR version change, therefore you are responsible for testing your translated layout in case you are using this feature. If you want a language translated you can also get in touch with us at [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com).
- When adding custom translations, please make sure you add the whole set of keys we have on `Localizable.strings` file. In particular, `onfido_locale`, which identifies the current locale being added, must be included. E.g. when strings file added for Russian language, the key `onfido_locale` must have the value `ru` such that it sould look like the following:`"onfido_locale" = "ru";`

The strings used within the SDK can be customised by having a `Localizable.strings` in your app for the desired language and by configuring the flow using `withCustomLocalization()` method on the configuration builder. i.e.

#### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withToken("YOUR_TOKEN_HERE")
    .withApplicantId(applicantId)
    .withDocumentStep(ofType: .drivingLicence, andCountryCode: "GBR")
    .withFaceStep(ofVariant: .photo)
    .withCustomLocalization() // will look for localizable strings in your Localizable.strings file
    .build()
```

#### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];

[configBuilder withToken:@"YOUR_TOKEN_HERE"];
[configBuilder withApplicantId:@"APPLICANT_ID_HERE"];
[configBuilder withDocumentStepOfType:ONDocumentTypeDrivingLicence andCountryCode:@"GBR"];
[configBuilder withFaceStepOfVariant:ONFaceStepVariantPhoto];
[configBuilder withCustomLocalization]; // will look for localizable strings in your Localizable.strings file

NSError *configError = NULL;
ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];
```

You can find the keys for the localizable strings under the example [`Localizable.strings`](Localizable.strings) file in this repo. You can supply partial translations, meaning if you don’t include a translation to particular key our translation will be used instead. You can also name the strings file with the translated keys as you desire but the name of the file will have to be provided to the SDK as a parameter to the `withCustomLocalization()` method i.e. `withCustomLocalization(andTableName: "MY_CUSTOM_STRINGS_FILE")` (`[configBuilder withCustomLocalizationWithTableName:@"MY_CUSTOM_STRINGS_FILE"];` for Objective-C)

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

We have included sample apps to show how to integrate with the Onfido SDK using both Swift and Objective-C. Check out respectively the `SampleApp` and `SampleAppObjC` directories.

### Support

Please open an issue through [GitHub](https://github.com/onfido/onfido-ios-sdk/issues). Please be as detailed as you can. Remember **not** to submit your token in the issue. Also check the closed issues to check whether it has been previously raised and answered.

If you have any issues that contain sensitive information please send us an email with the `ISSUE:` at the start of the subject to [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com?Subject=ISSUE%3A)

Previous version of the SDK will be supported for a month after a new major version release. Note that when the support period has expired for an SDK version, no bug fixes will be provided, but the SDK will keep functioning (until further notice).

Copyright 2018 Onfido, Ltd. All rights reserved.
