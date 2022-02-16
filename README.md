# Onfido

[![Version](https://img.shields.io/cocoapods/v/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Carthage incompatible](https://img.shields.io/badge/Carthage-incompatible-red.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://app.bitrise.io/app/d04e3a422799521b/status.svg?token=vBI0wpdUSfh25wctd1MHfA&branch=master)](https://www.bitrise.io/app/d04e3a422799521b)
[![License](https://img.shields.io/cocoapods/l/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)
[![Platform](https://img.shields.io/cocoapods/p/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)

## Table of contents

*   [Overview](#overview)
*   [Getting started](#getting-started)
*   [Handling callbacks](#handling-callbacks)
    *   [Success handling](#success-handling)
    *   [Error handling](#run-exceptions)
*   [Customizing SDK](#customizing-sdk)
    *   [Flow customization](#flow-customization)
    *   [UI customization](#ui-customization)
    *   [Language customization](#language-customization)
*   [Creating checks](#creating-checks)
*   [User Analytics](#user-analytics)
*   [Going live](#going-live)
*   [Migrating](#migrating)
*   [Security](#security)
*   [Accessibility](#accessibility)
*   [Licensing](#licensing)
*   [More information](#more-information)

## Overview

The Onfido iOS SDK provides a drop-in set of screens and tools for iOS applications to capture identity documents and selfie photos and videos for the purpose of identity verification.

It offers a number of benefits to help you create the best identity verification experience for your customers:

-   Carefully designed UI to guide your customers through the photo and video capture process
-   Modular design to help you seamlessly integrate the photo and video capture process into your application flow
-   Advanced image quality detection technology to ensure the quality of the captured images meets the requirement of the Onfido identity verification process, guaranteeing the best success rate
-   Direct image upload to the Onfido service, to simplify integration

⚠️ Note: The SDK is only responsible for capturing and uploading photos and videos. You still need to access the [Onfido API](https://documentation.onfido.com/) to manage applicants and perform checks.

![Capture Document and face](assets/Overview.png)

## Getting started

* SDK supports iOS 11+
* SDK supports Xcode 13+\*
* SDK has full bitcode support
* SDK supports following presentation styles:
  - Only full screen style for iPhones
  - Full screen and form sheet styles for iPads

\* The latest SDK version to support Xcode 11.5-12 is 22. There is a workaround for older versions of Xcode if required. Please contact [support](mailto:client-support@onfido.com) for more information.

:warning: The Onfido SDK requires CoreNFC to run. Since Xcode 12 there is a bug where `libnfshared.dylib` is missing from simulators. See [Stack Overflow](https://stackoverflow.com/questions/63915728/xcode12-corenfc-simulator-library-not-loaded) to solve this problem.

:warning: Even if you don't enable the NFC feature, Apple might ask you to provide a video to demonstrate NFC usage because NFC related code is part of the SDK binary regardless of runtime configuration.
While we're working on a permanent solution for this problem, please download the video that has been shared [in this post](https://github.com/onfido/onfido-ios-sdk/issues/215#issuecomment-767553245) and send to Apple to proceed on your App Review process.

:warning: The following content assumes you're using our API v3 versions for backend calls. If you are currently using API `v2` please refer to [this migration guide](https://developers.onfido.com/guide/api-v2-to-v3-migration-guide) for more information.

### 1. Obtain an API token

In order to start integrating, you'll need an [API token](https://documentation.onfido.com/#api-tokens).

You can use our [sandbox](https://documentation.onfido.com/#sandbox-testing) environment to test your integration. To use the sandbox, you'll need to generate a sandbox API token in your [Onfido Dashboard](https://onfido.com/dashboard/api/tokens).

⚠️ **Note: You must never use API tokens in the frontend of your
application or malicious users could discover them in your source code. You
should only use them on your server.**

#### 1.1 Regions

Onfido offers region-specific environments. Refer to the [Regions](https://documentation.onfido.com/#regions) section in our API documentation for token format and API base URL information.

### 2. Create an applicant

To create an applicant from your backend server, make a request to the ['create applicant' endpoint](https://documentation.onfido.com/#create-applicant), using a valid API token.

**Note**: Different report types have different minimum requirements for applicant data. For a Document or Facial Similarity report the minimum applicant details required are `first_name` and `last_name`.

```shell
$ curl https://api.onfido.com/v3/applicants \
    -H 'Authorization: Token token=<YOUR_API_TOKEN>' \
    -d 'first_name=John' \
    -d 'last_name=Smith'
```

The JSON response will return an `id` field containing a UUID that identifies the applicant. Once you pass the applicant ID to the SDK, documents and live photos and videos uploaded by that instance of the SDK will be associated with that applicant.

### 3. Configure the SDK with token

You'll need to generate and include an SDK token every time you initialize the SDK.

To generate an SDK token, make a request to the ['generate SDK token' endpoint](https://documentation.onfido.com/#generate-web-sdk-token).

```shell
$ curl https://api.onfido.com/v3/sdk_token \
  -H 'Authorization: Token token=<YOUR_API_TOKEN>' \
  -F 'applicant_id=<APPLICANT_ID>' \
  -F 'application_id=<YOUR_APPLICATION_BUNDLE_IDENTIFIER>'
```

| Parameter           |  Notes   |
| ------------ | --- |
| `applicant_id` | **required** <br /> Specifies the applicant for the SDK instance. |
| `application_id` | **required** <br /> The application ID (for iOS "application bundle ID") that was set up during development. For iOS, this is usually in the form `com.your-company.app-name`. Make sure to use a valid `application_id` or you'll receive a 401 error. |

:warning: SDK tokens expire after 90 minutes.

##### `expireHandler`

You can use the optional `expireHandler` parameter in the SDK token configurator function to generate and pass a new SDK token when it expires. This ensures the SDK continues its flow even after an SDK token has expired.

For example:

```swift
func getSDKToken(_ completion: @escaping (String) -> Void) {
    <Your network request logic to retrieve SDK token goes here>
    completion(myNewSDKtoken)
}

let config = try! OnfidoConfig.builder()
    .withSDKToken("<YOUR_SDK_TOKEN>", expireHandler: getSDKToken)
```

```Objective-C

-(void) getSDKToken: (void(^)(NSString *)) handler {
  <Your network request logic to retrieve SDK token goes here>
   handler(sdkToken);
}

ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
[configBuilder withSdkToken:@"YOUR_SDK_TOKEN" expireHandler:^(void (^ handler)(NSString *  expireHandler)) {
        [self getSDKToken:handler];
}];
```

### 4. App permissions

The SDK uses the device camera. You're required to have the following keys in your application's `Info.plist` file:
*  `NSCameraUsageDescription`
*  `NSMicrophoneUsageDescription`
*  `NFCReaderUsageDescription`

```xml
<key>NSCameraUsageDescription</key>
<string>Required for document and facial capture</string>
<key>NSMicrophoneUsageDescription</key>
<string>Required for video capture</string>
<key>NFCReaderUsageDescription</key>
<string>Required for document capture</string>
```
**Note**: All keys will be required for app submission.

### 5. Add the SDK dependency

#### Using Cocoapods

The SDK is available on Cocoapods and you can include it in your projects by adding the following to your Podfile:

```ruby
pod 'Onfido'
```

Run `pod install` to get the SDK.

#### Using Swift Package Manager

The SDK is available with Swift Package Manager and you can include it in your project by adding the following package repository URL:

https://github.com/onfido/onfido-ios-sdk.git

#### Manual installation

The SDK is available in the [GitHub Releases tab](https://github.com/onfido/onfido-ios-sdk/releases) where you can download the compressed framework. You can find the latest release [here](https://github.com/onfido/onfido-ios-sdk/releases/latest).

1. [Download](https://github.com/onfido/onfido-ios-sdk/releases/latest) the compressed debug zip file containing the `Onfido.framework`.
2. Uncompress the zip file and then move the `Onfido.framework` artefact into your project.
3. Add `Onfido.framework` located within your project to the `Embedded binaries` section in the `General` tab of your iOS app target.
4. Open your app's project file in Xcode. Then select your app's target under target list.
5. Next select the `Build Phases` tab and under the `Embed Frameworks` step add a new `Run Script Phase`. Name it `Onfido Framework Archive`.
6. In the text area add the following code:
```bash
if [[ "$ACTION" != "install" ]]; then
exit 0;
fi

FRAMEWORK_DIR="${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
ONFIDO_FRAMEWORK="${FRAMEWORK_DIR}/Onfido.framework"

cd "${ONFIDO_FRAMEWORK}"

lipo -remove i386 Onfido -o Onfido
lipo -remove x86_64 Onfido -o Onfido
```

#### Non-Swift apps

If your app is not Swift based then you must create a new Swift file inside of your project. This file is required to force Xcode to package Swift runtime libraries required for the Onfido iOS SDK to run.

1. Create a Swift file with the following contents:
```
import Foundation
import AVFoundation
import CoreImage
import UIKit
import Vision

func fixLibSwiftOnoneSupport() {
    // from https://stackoverflow.com/a/54511127/2982993
    print("Fixes dyld: Library not loaded: @rpath/libswiftSwiftOnoneSupport.dylib")
}
```
2. Set `Always Embed Swift Standard Libraries` to `Yes` in your project configuration.

### 6. Create the SDK configuration

Once you have an added the SDK as a dependency, and you have an applicant ID, you can configure the SDK:

#### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withSDKToken("<YOUR_SDK_TOKEN>")
    .withWelcomeStep()
    .withDocumentStep()
    .withFaceStep(ofVariant: .photo(withConfiguration: nil))
    .build()

let onfidoFlow = OnfidoFlow(withConfiguration: config)
    .with(responseHandler: { results in
        // Callback when flow ends
    })
```

#### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];


[configBuilder withSdkToken:@"YOUR_SDK_TOKEN"];
[configBuilder withWelcomeStep];
[configBuilder withDocumentStep];

NSError *variantConfigError = NULL;
Builder *variantBuilder = [ONFaceStepVariantConfig builder];
[variantBuilder withPhotoCaptureWithConfig: NULL];
[configBuilder withFaceStepOfVariant: [variantBuilder buildAndReturnError: &variantConfigError]];

if (variantConfigError == NULL) {
  NSError *configError = NULL;
  ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];

  if (configError == NULL) {
      ONFlow *onFlow = [[ONFlow alloc] initWithFlowConfiguration:config];
      [onFlow withResponseHandler:^(ONFlowResponse *response) {
          // Callback when flow ends
      }];
  }
}
```

### 7. Start the flow

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


## Handling callbacks

#### Swift

To receive the result from the flow, you should pass a callback to the instance of `OnfidoFlow`.

The result object passed to the callback may include the following attributes:

```swift
let responseHandler: (OnfidoResponse) -> Void = { response in
  switch response {
    case .error(let error):

    case .success(let results):

    case .cancel(let reason):

  }
}
```

| Attribute     |    Notes    |
| -----|-------|
| `.success([OnfidoResult])` | User completed the flow. You can now [create a check](#creating-checks) on your backend server. |
| `.error(Error)` | Some error happened. |
| `.cancel` | Flow was cancelled by the user. The reason can be `.userExit` (when the user taps back button on the first screen) or `.deniedConsent` (when the user denies consent on [the consent screen](#consent-step)).|

#### Objective-C

To receive the result from the flow, you should pass a callback to the instance of `ONFlow`.

An instance of `ONFlowResponse` is passed back to the callback with 3 properties:

```Objective-C
(^responseHandlerBlock)(ONFlowResponse *response) {

    if (response.userCanceled) {
    } else if (response.results) {
    } else if (response.error) {
    }
}
```

| Properties     |    Notes    |
| -----|-------|
| `results` | User completed the flow. You can now [create a check](#creating-checks) on your backend server. |
| `error` | Some error happened. |
| `userCanceled` | Flow was cancelled by the user. You can check why the user cancelled using `response.userCanceled.reason`. When `userCanceled` is false then `results` or `error` properties will be set.|

### Success handling

Success is when the user has reached the end of the flow.

#### Swift

`[OnfidoResult]` is a list with multiple results. The results are different enum values, each with its own associated value (also known as payload). This enum, `OnfidoResult`, can have the following values:

1.  `OnfidoResult.document` and `OnfidoResult.face`: Its payload is relevant in case you want to manipulate or preview the captures in some way.

##### Capture result payload

You shouldn't need to inspect the results of the document and face captures as the SDK handles file uploads.
However, if you want to see further information, you can access the result object.

Example for a document capture:

```swift
let document: Optional<OnfidoResult> = results.filter({ result in
  if case OnfidoResult.document = result { return true }
  return false
}).first

if let documentUnwrapped = document, case OnfidoResult.document(let documentResult) = documentUnwrapped {
  print(documentResult.front.id)
}
```

To access the result object for a face capture input the `case` as `OnfidoResult.face`.

#### Objective-C

`[ONFlowResult]` is a list with multiple results. The result is an instance of `ONFlowResult` containing 2 properties:

* `type`, which is an enum with values `ONFlowResultTypeDocument`, `ONFlowResultTypeFace`
* `result`, which instance type can be of `ONDocumentResult` or `ONFaceResult`. The result type can be derived by the `type` property

##### Capture result payload

You shouldn't need to inspect the results of the document and face captures as the SDK handles file uploads.However, if you want to see further information, you can access the result object.

Example for a document capture:

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

    ONDocumentResult *documentResult = ((ONFlowResult *)flowWithDocumentResults[0]).result;
    NSLog(@"%@", documentResult.front.id);
}
```
To access the result object for a face capture change the type to `ONFlowResultTypeFace`.

### Error handling

#### Swift

##### Response Handler Errors

The `Error` object returned as part of `OnfidoResponse.error(Error)` is of type `OnfidoFlowError`. It's an enum with multiple cases depending on the error type.

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

Note: Not all errors will be passed to `OnfidoResponse.error`. [Run Exceptions](#run-exceptions) and [Configuration errors](#configuration-errors) will be returned as an exception.

##### Run exceptions

When initiating the SDK there can be an exception.

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
    default:
      // should not happen, so if it does, log it and let us know
  }
}
```

##### Configuration errors

You must provide the following when configuring the Onfido iOS SDK:

- SDK token (or Mobile token)
- applicant
- at least one capture step

Otherwise you may encounter the following errors when calling the `build()` function on the `OnfidoConfig.Builder` instance:

| Error | Notes |
| ----- | ------ |
| `OnfidoConfigError.missingToken` | When no token is provided or the token is an empty string. |
| `OnfidoConfigError.missingApplicant` | When no applicant instance is provided. |
| `OnfidoConfigError.missingSteps` | When no step is provided. |
| `OnfidoConfigError.multipleTokenTypes`| When both an SDK token and a Mobile token are provided. |
| `OnfidoConfigError.applicantProvidedWithSDKToken` | When both an SDK token and an applicant are provided. |
| `OnfidoConfigError.invalidDocumentFormatAndCountryCombination` | When it is an unsupported document format for the specified country provided. See [Document Type Configuration](#document-type-configuration) to check supported combinations. |
|`OnfidoConfigError.invalidCountryCode` | When an invalid country code is provided. |


#### Objective-C

##### Response Handler Errors

The `error` property of the `ONFlowResponse` is of type `NSError`.

You can identify the error by comparing the `code` property of the `NSError` instance with `ONFlowError`, i.e. `response.code == ONFlowErrorCameraPermission`. You can also print or log the `userInfo` property of the `NSError` instance.  

The `NSError` contained within the `ONFlowResponse`'s `error` property can be handled as follows:

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

Note: Not all errors which are part of `ONFlowError` will be passed to the response handler block. [Run Exceptions](#run-exceptions) and [Configuration errors](#configuration-errors) will be returned as an exception.

##### Run exceptions

You can handle run exceptions as shown below:

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
        default:
            // do something about it here
            break;
    }
} else {
    [self presentViewController:onfidoController animated:YES completion:NULL];
}
```

##### Configuration errors

You must provide the following when configuring the Onfido iOS SDK:

- SDK token (or Mobile token)
- applicant
- at least one capture step

Otherwise you may encounter the following errors when calling the `build()` function on the `ONFlowConfigBuilder`:

| Error | Notes |
| ----- | ------ |
| `ONFlowConfigErrorMissingToken` | When no token is provided or the token is an empty string. |
| `ONFlowConfigErrorMissingApplicant` | When no applicant instance is provided. |
| `ONFlowConfigErrorMissingSteps` | When no step is provided. |
| `ONFlowConfigErrorMultipleTokenTypes`| When both an SDK token and a Mobile token are provided. |
| `ONFlowConfigErrorApplicantProvidedWithSDKToken` | When both an SDK token and an applicant are provided. |
| `ONFlowConfigErrorInvalidDocumentFormatAndCountryCombination` | When it is an unsupported document format for the specified country provided. See [Document Type Configuration](#document-type-configuration) to check supported combinations. |
|`ONFlowConfigErrorInvalidCountryCode` | When an invalid country code is provided. |

## Customizing SDK

The iOS SDK has multiple customizable options. You can also read our [SDK customization guide](https://developers.onfido.com/guide/sdk-customization).

### Flow customization

#### Welcome step

This step is the introduction screen of the SDK. It displays a summary of the capture steps the user will pass through. This is an optional screen.

You can show the welcome screen by calling `configBuilder.withWelcomeStep()` in Swift or `[configBuilder withWelcomeStep]` in Objective-C.

##### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withWelcomeStep()
    ...
    .build()
```

##### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
[configBuilder withSdkToken:@"YOUR_SDK_TOKEN_HERE"];
...
[configBuilder withWelcomeStep];

NSError *configError = NULL;
ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];

if (configError) {
    // Handle config build error
} else {
    // use config
}
```

#### Consent step

This step contains a screen to collect US end users' privacy consent for Onfido. It contains the consent language required when you offer your service to US users as well as links to Onfido's policies and terms of use.

This is an optional screen. You can specify it in the following ways:

##### Swift

```swift
let config = try! OnfidoConfig.builder()
    ...
    .withUserConsentStep()
    ...
    .build()
```

##### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
[configBuilder withSdkToken:@"YOUR_SDK_TOKEN_HERE"];
...
[builder withConsentStep];
...
```

The user must click "Accept" to get past this step and continue with the flow. The content is available in English only, and is not translatable.

:warning: Note: This step does not automatically inform Onfido that the user has given their consent. At the end of the SDK flow, you still need to set the API parameter `privacy_notices_read_consent_given` outside of the SDK flow when [creating a check](#creating-checks).

If you choose to disable this step, you must incorporate the required consent language and links to Onfido's policies and terms of use into your own application's flow before your end user starts interacting with the Onfido SDK.

For more information about this step, and how to collect user consent, please visit [Onfido Privacy Notices and Consent](http://developers.onfido.com/guide/onfido-privacy-notices-and-consent).

#### Document step

In the Document step, a user can pick the type of document to capture and its issuing country before capturing it with their phone camera. Document selection and country selection are both optional screens. These screens will only show to the end user if specific options are not configured to the SDK.

You can configure the Document step to capture single document types with specific properties.

- **Document type**

The list of document types visible for the user to select can be filtered using this option. Each document type has its own configuration class. While configuring document type, you can optionally pass a configuration object along with the document type.

The following document types are supported:

| Document Type        | Configuration Class           | Configurable Properties    |
|----------------------|-------------------------------|----------------------------|
| passport             | PassportConfiguration         |                            |
| drivingLicence       | DrivingLicenceConfiguration   | - country<br> - documentFormat |
| nationalIdentityCard | NationalIdentityConfiguration | - country<br> - documentFormat |
| residencePermit      | ResidencePermitConfiguration  | - country                  |
| visa                 | VisaConfiguration             | - country                  |
| workPermit           | WorkPermitConfiguration       | - country                  |
| generic              | GenericDocumentConfiguration  | - country                  |

**Note**: `Generic` document type doesn't offer an optimized capture experience for a desired document type.

**Note:** If only one document type is specified, users will not see the document selection screen or country selection screen and will be taken directly to the capture screen.

-  **Document country**

Country configuration allows you to specify the country of origin of the document. If a document country is specified for a document type the country selection screen is not displayed.

You'll need to pass the corresponding [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) 3 letter country code to the SDK.

**Note**: You can specify country for all document types except `passport`. This is because passports have the same format worldwide so the SDK does not require this additional information.       

:warning: **Note:**: The SDK will throw a `OnfidoConfigError.invalidCountryCode` (`ONFlowConfigErrorInvalidCountryCode`) error if an invalid country code is provided.

For example, to only capture UK driving licenses:

##### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withSDKToken("<YOUR_SDK_TOKEN_HERE>")
    .withDocumentStep(ofType: .drivingLicence(config: DrivingLicenceConfiguration(country: "GBR")))
    .build()
```

##### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];

[configBuilder withSdkToken:@"YOUR_SDK_TOKEN_HERE"];
NSError *documentVariantError = NULL;
DocumentConfigBuilder * documentVariantBuilder = [ONDocumentTypeVariantConfig builder];
[documentVariantBuilder withDrivingLicenceWithConfig:[[DrivingLicenceConfiguration alloc] initWithCountry: @"GBR"]];
ONDocumentTypeVariantConfig *documentStepVariant = [variantBuilder buildAndReturnError: documentVariantError];

if (documentVariantError) {
  // Handle variant config error
} else {
  NSError *configError = NULL;
  ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];
}

```

- **Document format**

The format of some documents can be specified as a plastic card `Card` or folded document `Folded`. `Card` is the default document format value for all document types.

If `Folded` is configured the SDK will show a specific template overlay during document capture.    

The following document formats are supported for each document type:  

| Document Type/ Document Format | card          |folded                           |
|--------------------------|---------------|------------------------|
| drivingLicence           | ALL COUNTRIES | Only France (Country code "FRA") |
| nationalIdentityCard     | ALL COUNTRIES | Only Italy (Country code "ITA")  |

| Document Type/ Document Format |           |
|--------------------------|---------------|
| passport                 | NOT CONFIGURABLE |
| residencePermit          | NOT CONFIGURABLE |
| visa                     | NOT CONFIGURABLE |
| workPermit               | NOT CONFIGURABLE |
| generic                  | NOT CONFIGURABLE |


**Note:** If you configure the SDK with an unsupported document format the SDK will throw an `OnfidoConfigError.invalidDocumentFormatAndCountryCombination` (`ONFlowConfigErrorInvalidDocumentFormatAndCountryCombination` in Objective-C) error during runtime.

For example, for a folded Italian national identity card:

##### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withSDKToken("YOUR_SDK_TOKEN_HERE")
    .withDocumentStep(ofType: .nationalIdentityCard(config: NationalIdentityConfiguration(documentFormat: .folded, country: "ITA"))
    .build()
```

##### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];

[configBuilder withSdkToken:@"YOUR_SDK_TOKEN_HERE"];
NSError *documentVariantError = NULL;
DocumentConfigBuilder * documentVariantBuilder = [ONDocumentTypeVariantConfig builder];
[documentVariantBuilder withNationalIdentityCardWithConfig:[[NationalIdentityConfiguration alloc] initWithDocumentFormat:DocumentFormatFolded country: @"ITA"]];

ONDocumentTypeVariantConfig *documentStepVariant = [variantBuilder buildAndReturnError: documentVariantError];

if (documentVariantError) {
  // Handle variant config error
} else {
  NSError *configError = NULL;
  ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];
}

```

#### Face step

In the Face step, a user can use the front camera to capture either a live photo of their face, or a live video.

The Face step has 2 variants for the Swift interface:

- `FaceStepVariant.photo(with: PhotoStepConfiguration?)`
- `FaceStepVariant.video(with: VideoStepConfiguration?)`

For the Objective-C interface, you should use `ONFaceStepVariantConfig` as below.

To configure for a live photo:

```
NSError * error;
Builder * variantBuilder = [ONFaceStepVariantConfig builder];
[variantBuilder withPhotoCaptureWithConfig: [[PhotoStepConfiguration alloc] initWithShowSelfieIntroScreen: YES]]];
[configBuilder withFaceStepOfVariant: [variantBuilder buildAndReturnError: &error]];
```

To configure for a live video:

```
NSError * error;
Builder * variantBuilder = [ONFaceStepVariantConfig builder];
[variantBuilder withVideoCaptureWithConfig:
 [[VideoStepConfiguration alloc] initWithShowIntroVideo: YES]];
[configBuilder withFaceStepOfVariant: [variantBuilder buildAndReturnError: &error]];
```

##### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withSDKToken("<YOUR_SDK_TOKEN_HERE>")
    .withWelcomeStep()
    .withDocumentStep()
    .withFaceStep(ofVariant: .photo(withConfiguration: PhotoStepConfiguration(showSelfieIntroScreen: true)))  // specify the face capture variant here
    .build()
```

##### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];

[configBuilder withSdkToken:@"YOUR_SDK_TOKEN_HERE"];
[configBuilder withWelcomeStep];
[configBuilder withDocumentStep];
NSError *variantError = NULL;
Builder * variantBuilder = [ONFaceStepVariantConfig builder];
[variantBuilder withVideoCaptureWithConfig: [[VideoStepConfiguration alloc] initWithShowIntroVideo: YES]];
[configBuilder withFaceStepOfVariant: [variantBuilder buildAndReturnError: &variantError]];

if (variantError) {
  // Handle variant config error
} else {
  NSError *configError = NULL;
  ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];

  if (configError) {
      // Handle config build error
  } else {
      // use config
  }
}
```

### Enabling ePassport NFC extraction (beta)

#### Pre-requisites

- This feature requires `Near Field Communication Tag Reading` capability in your app target. If you haven't added it before, please follow the steps in [Apple's documentation](https://help.apple.com/xcode/mac/current/#/dev88ff319e7).

- You have to include the entries below in your app target's `Info.plist` file to be able to read NFC tags properly.
```
<key>com.apple.developer.nfc.readersession.felica.systemcodes</key>
<array>
  <string>12FC</string>
</array>
<key>com.apple.developer.nfc.readersession.iso7816.select-identifiers</key>
<array>
  <string>A0000002471001</string>
  <string>A0000002472001</string>
  <string>00000000000000</string>
  <string>D2760000850101</string>
</array>
```
#### SDK integration

Some passports contain a chip which can be accessed using Near Field Communication. The SDK provides a set of screens to extract the information contained within the chip to verify the original document is present.

:warning: **Note** This feature is currently in beta and the API is subject to change. Changes to the API will not result in a breaking change.

##### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withSDKToken("<YOUR_SDK_TOKEN_HERE>")
    .withDocumentStep()
    .withNFCReadBetaFeatureEnabled()
    .build()
```

##### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];

[configBuilder withSdkToken:@"YOUR_SDK_TOKEN_HERE"];
[configBuilder withWelcomeStep];
[configBuilder withDocumentStep];
[configBuilder withNFCReadBetaFeatureEnabled];

NSError *configError = NULL;
ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];

```

#### Creating checks with NFC

Please refer to our [NFC for document report guide in our developer hub](https://developers.onfido.com/guide/document-report-nfc) to learn [how to create a check containing a document report with nfc](https://developers.onfido.com/guide/document-report-nfc#create-a-check-containing-a-document-report-with-nfc).

### Enabling Canadian Driver Licence Auto-capture (beta)

##### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withSDKToken("YOUR_SDK_TOKEN_HERE")
    .withDocumentStep()
    .withCanadianDrivingLicenceAutoCaptureBetaFeatureEnabled()
    .build()
```

##### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];

[configBuilder withSdkToken:@"YOUR_SDK_TOKEN_HERE"];
[configBuilder withWelcomeStep];
[configBuilder withDocumentStep];
[configBuilder withCanadianDrivingLicenceAutoCaptureBetaFeatureEnabled];

NSError *configError = NULL;
ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];

```

### UI customization

The iOS SDK supports the customization of colors, fonts and strings used in the SDK flow. For visualizations of the available options please see our [SDK customization guide](https://developers.onfido.com/guide/sdk-customization#ios).

#### Swift
```Swift
let appearance = Appearance()
appearance.primaryColor = <DESIRED_UI_COLOR_HERE>
appearance.primaryTitleColor = <DESIRED_UI_COLOR_HERE>
appearance.primaryBackgroundPressedColor = <DESIRED_UI_COLOR_HERE>
appearance.secondaryBackgroundPressedColor = <DESIRED_UI_COLOR_HERE>
appearance.borderCornerRadius = <DESIRED_CGFLOAT_BORDER_RADIUS_HERE>
appearance.fontRegular = <DESIRED_FONT_NAME_HERE>
appearance.fontBold = <DESIRED_FONT_NAME_HERE>
appearance.supportDarkMode = <true | false>
appearance.captureSuccessColors = <CaptureSuccessColors object>

let configBuilder = OnfidoConfig.builder()
configBuilder.withAppearance(appearance)
```

#### Objective-C
```Objective-C
ONAppearance *appearance = [[ONAppearance alloc] init];
appearance.primaryColor = <DESIRED_UI_COLOR_HERE>;
appearance.primaryTitleColor = <DESIRED_UI_COLOR_HERE>;
appearance.primaryBackgroundPressedColor = <DESIRED_UI_COLOR_HERE>;
appearance.secondaryBackgroundPressedColor = <DESIRED_UI_COLOR_HERE>;
appearance.buttonCornerRadius = <DESIRED_CGFLOAT_BORDER_RADIUS_HERE>;
appearance.fontRegular = <DESIRED_FONT_NAME_HERE>;
appearance.fontBold = <DESIRED_FONT_NAME_HERE>;
appearance.supportDarkMode = <true | false>;
appearance.captureSuccessColors = <CaptureSuccessColors object>;

ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
[configBuilder withAppearance:appearance];
```

- `primaryColor`: Defines the icon background color, button color and back navigation button color  
- `primaryTitleColor`: Defines the primary button text color  
- `primaryBackgroundPressedColor`: Defines the primary button pressed state color
- `secondaryBackgroundPressedColor`: Defines the secondary button pressed state color
- `borderCornerRadius`: Defined border corner radius for all the buttons (default 5.0)
- `fontRegular`: Defines the custom font name for the regular style labels  
- `fontBold`: Defines the custom font name for the bold style labels   
- `supportDarkMode`: Defines if iOS Dark Mode will be enabled on SDK screens. The value is true by default.
  **Note:** This property is applicable only for Xcode 11 and above built apps and devices running on iOS 13 and above
- `captureSuccessColors`: Defines the color values for the capture screen success auto capture state
  - `borderColor`: Defines the border color of the area of interest in capture screen
  - `tickViewImageTintColor`: Defines the tick icon's tint color shown in capture screen after auto capture happens
  - `tickViewBackgroundColor`: Defines the tick icon's background color shown in capture screen after auto capture happens

**Dark Mode only UI customisation**

To just change `supportDarkMode`, you can use initialiser below:   

##### Swift

```Swift
let appearance = Appearance(supportDarkMode: <true|false>)
let configBuilder = OnfidoConfig.builder()
configBuilder.withAppearance(appearance)
```

##### Objective-C

```Objective-C
ONAppearance *appearance = [[ONAppearance alloc] initWithSupportDarkMode:<true|false>];

```

### Language customization

The SDK supports and maintains the following 7 languages:

 - English (en) 🇬🇧
 - Spanish (es) 🇪🇸
 - French (fr) 🇫🇷
 - German (de) 🇩🇪
 - Italian (it) 🇮🇹
 - Portuguese (pt) 🇵🇹
 - Dutch (nl) 🇳🇱

The strings used within the SDK can be customised by having a `Localizable.strings` in your app for the desired language and by configuring the flow using `withCustomLocalization()` method on the configuration builder.

You can find the keys for the localizable strings under the [`localization`](localization) directory which contains strings files for supported languages.

#### Swift

```swift
let config = try! OnfidoConfig.builder()
    .withSDKToken("<YOUR_SDK_TOKEN_HERE>")
    .withWelcomeStep()
    .withDocumentStep(ofType: .drivingLicence(config: DrivingLicenceConfiguration(country: "GBR")))
    .withFaceStep(ofVariant: .photo(withConfiguration: nil))
    .withCustomLocalization() // will look for localizable strings in your Localizable.strings file
    .build()
```

#### Objective-C

```Objective-C
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];

[configBuilder withSdkToken:@"YOUR_SDK_TOKEN_HERE"];
[configBuilder withWelcomeStep];
[configBuilder withDocumentStepOfType:ONDocumentTypeDrivingLicence andCountryCode:@"GBR"];
NSError *variantError = NULL;
Builder * variantBuilder = [ONFaceStepVariantConfig builder];
[variantBuilder withPhotoCaptureWithConfig: NULL];
[configBuilder withFaceStepOfVariant: [variantBuilder buildAndReturnError: &variantError]];

if (variantError) {
  // Handle variant config error
} else {
  [configBuilder withCustomLocalization]; // will look for localizable strings in your Localizable.strings file
  NSError *configError = NULL;
  ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];
}

```

#### Custom languages

The SDK can also be displayed in a custom language for locales that Onfido does not currently support. You can supply full or partial translations. For any key without a translation, the supported language default will be used.

When adding custom translations, you must add the whole set of keys included in the [`Localizable.strings`](localization) file. In particular, `onfido_locale`, which identifies the current locale being added. The value for this string should be the ISO 639-1 2-letter language code corresponding to the translation being added.

  For example:
  - When strings file added for Russian language, the `onfido_locale` key should have `ru` as its value.
  - When strings file added for American English language (en-US), the `onfido_locale` key should have `en` as its value.

Without `onfido_locale` correctly included, we won't be able to determine which language the user is likely to use when doing the video liveness challenge. It may result in our inability to correctly process the video, and the check may fail.

You can name the strings file with the translated keys as you desire but the name of the file will have to be provided to the SDK as a parameter to the `withCustomLocalization()` method:

 `withCustomLocalization(andTableName: "MY_CUSTOM_STRINGS_FILE")` (swift) or `[configBuilder withCustomLocalizationWithTableName:@"MY_CUSTOM_STRINGS_FILE"];` (Objective-C).

Additionally you can specify the bundle from which to read the strings file:

 `withCustomLocalization(andTableName: "MY_CUSTOM_STRINGS_FILE", in: myBundle)` (swift)
 `[configBuilder withCustomLocalizationWithTableName:@"MY_CUSTOM_STRINGS_FILE" in: myBundle];` (Objective-C).

**Note**: If string translations change it will result in a MINOR version change. If you have custom translations you're responsible for testing your translated layout.

If you want a language translated you can get in touch with us at [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com)

## Creating checks

The SDK is responsible for the capture of identity documents and selfie photos and videos. It doesn't perform any checks against the Onfido API. You need to access the [Onfido API](https://documentation.onfido.com/) in order to manage applicants and perform checks.

For a walkthrough of how to create a check with a Document and Facial Similarity report using the iOS SDK read our [Mobile SDK Quick Start guide](https://developers.onfido.com/guide/mobile-sdk-quick-start).

Read our API documentation for further details on how to [create a check](https://documentation.onfido.com/#create-check) with the Onfido API.

**Note**: If you're testing with a sandbox token, please be aware that the results are pre-determined. You can learn more about [sandbox responses](https://documentation.onfido.com/#pre-determined-responses).

**Note**: If you're using API v2, please refer to the [API v2 to v3 migration guide](https://developers.onfido.com/guide/v2-to-v3-migration-guide#checks-in-api-v3) for more information.

### Setting up webhooks

Reports may not return results straightaway. You can set up [webhooks](https://documentation.onfido.com/#webhooks) to be notified upon completion of a check or report, or both.

## User Analytics

The SDK allows you to track a user's journey through the verification process via a definable hook. This gives insight into how your users make use of the SDK screens.

### Overriding the hook

In order to expose a user's progress through the SDK a hook method must be defined while creating the `OnfidoFlow.swift` instance using a `.with(eventHandler: EventHandler)` call. For example:

```swift
OnfidoFlow(withConfiguration: config)
    .with(eventHandler: {
        (event: Event) -> () in
        // Your code here
    })
```

The code inside of the defined method will now be called when a particular event is triggered, usually when the user reaches a new screen. For a full list of events see [tracked events](#tracked-events).

The parameter being passed in is an `OnfidoFlow.Event` struct which contains the following:

|     |      |
| ---- | ----- |
|`eventName` | **string** < /br> Indicates the type of event. This will always be returned as `"Screen"` as each tracked event is a user visiting a screen. |
| `properties` | **dictionary** < /br> Contains the specific details of an event. For example, the name of the screen visited. |


### Using the data

You can use the data to keep track of how many users reach each screen in your flow. You can do this by storing the number of users that reach each screen and comparing that to the number of users who reached the `Welcome` screen.

### Tracked events

Below is the list of potential events currently being tracked by the hook:
```
WELCOME - User reached the "Welcome" screen
USER_CONSENT - User reached "user consent" screen
DOCUMENT_CAPTURE - User reached the "document capture" screen (for one-sided document)
DOCUMENT_CAPTURE_FRONT - User reached the "document capture" screen for the front side (for two-sided document)
DOCUMENT_CAPTURE_BACK - User reached the "document capture" screen for the back side (for two-sided document)
DOCUMENT_CAPTURE_CONFIRMATION - User reached the "document confirmation" screen (for one-sided document)
DOCUMENT_CAPTURE_CONFIRMATION_FRONT - User reached the "document confirmation" screen for the front side (for two-sided document)
DOCUMENT_CAPTURE_CONFIRMATION_BACK - User reached the "document confirmation" screen for the back side (for two-sided document)
DOCUMENT_UPLOAD - User's document is uploading
FACIAL_INTRO - User reached the "selfie intro" screen
FACIAL_CAPTURE - User reached the "selfie capture" screen
FACIAL_CAPTURE_CONFIRMATION - User reached the "selfie confirmation" screen
FACIAL_UPLOAD - User's selfie is uploading
VIDEO_FACIAL_INTRO - User reached the "liveness intro" screen
VIDEO_FACIAL_CAPTURE - User reached the "liveness video capture" screen
VIDEO_FACIAL_CAPTURE_STEP_1 - User reached the 1st challenge during "liveness video capture", challenge_type can be found in eventProperties
VIDEO_FACIAL_CAPTURE_STEP_2 - User reached the 1st challenge during "liveness video capture", challenge_type can be found in eventProperties
VIDEO_FACIAL_CAPTURE_CONFIRMATION - User reached the "liveness video confirmation" screen
VIDEO_FACIAL_UPLOAD - User's liveness video is uploading
```

## Going live

Once you are happy with your integration and are ready to go live, please contact [Client Support](mailto:client-support@onfido.com) to obtain a live API token (and Mobile token). You will have to replace the sandbox tokens in your code with the live tokens.

Check the following before you go live:

- you have set up [webhooks](https://documentation.onfido.com/#webhooks) to receive live events
- you have entered correct billing details inside your [Onfido Dashboard](https://onfido.com/dashboard/)

### Size Impact

| User iOS Version | SDK Size Impact (MB)              |
|------------------|-----------------------------------|
| 12.2 and above   | 5.801|
| Below 12.2       | up to 5.801* or up to 17.675**|


**\*** If the application is in Swift but doesn't include any Swift libraries that Onfido iOS SDK requires  
**\*\*** If the application doesn't include any Swift code, i.e. written completely in Objective-C, and Onfido iOS SDK is the only
 Swift library that application integrates with

**Note**: These calculations were performed based on a single application architecture

## Migrating

You can find the migration guide at [MIGRATION.md](MIGRATION.md)

## Security

### Certificate pinning

**Note**: Certificate pinning works only on devices running on iOS 10.3 or above.

You can pin any communications between our SDK and server through the `.withCertificatePinning()` method in our `OnfidoConfig.Builder` configuration builder. This method accepts `CertificatePinningConfiguration` as a parameter, with sha-256 hashes of the certificate's public keys.
For more information about the hashes, please email [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com).

#### Swift

```swift
    let config = try! OnfidoConfig.builder()
    ...
    do {
      config.withCertificatePinning(try CertificatePinningConfiguration(hashes: ["<EXAMPLE_HASH>"]))
    } catch {
      // handle CertificatePinningConfiguration initialisation failures. i.e Providing empty array causes initialiser to be failed.
    }
    ...
    configBuilder.build()
```

#### Objective-C

```Objective-C
    ONFlowConfigBuilder * builder = [ONFlowConfig builder];
    ...
    NSError * error = NULL;
    ONCertificatePinningConfiguration * pinningConf = [[ONCertificatePinningConfiguration alloc] initWithHashes: @[@"<EXAMPLE_HASH>"] error: &error]];
    if(error != NULL) {
      // handle ONCertificatePinningConfiguration initialisation failures. i.e Providing empty array causes initialiser to be failed.

    }
    [builder withCertificatePinningConfiguration: pinningConf];

    ...
```

#### Handling certificate pinning error

To identify a certificate pinning error, check the `message` property of the `OnfidoFlowError.exception` object. It will return `invalid_certificate` for certificate pinning related errors.  

```
let responseHandler: (OnfidoResponse) -> Void = { response in
  switch response {
    case let .error(error):
        // Some error happened
        if case OnfidoFlowError.exception(withError: _, withMessage: let optionalMessage) = error, let message = optionalMessage {
            if message == "invalid_certificate" {
                // HANDLE INVALID CERTIFICATE CASE HERE
            }
        }        
    case let .success(results):
        // User completed the flow
        // You can create your check here
    case .cancel:
        // Flow cancelled by the user
  }
}
```

## Accessibility

The Onfido iOS SDK has been optimised to provide the following accessibility support by default:

- Screen reader support: accessible labels for textual and non-textual elements available to aid VoiceOver navigation, including dynamic alerts
- Dynamic font size support: all elements scale automatically according to the device's font size setting
- Sufficient color contrast: default colors have been tested to meet the recommended level of contrast
- Sufficient touch target size: all interactive elements have been designed to meet the recommended touch target size

Refer to our [accessibility statement](https://developers.onfido.com/guide/sdk-accessibility-statement) for more details.

## Licensing

Due to API design constraints, and to avoid possible conflicts during the integration, we bundle some of our 3rd party dependencies. For those, we include the licensing information inside our bundle and also in this repo under license folder, with the file named [onfido_licenses.json](license/onfido_licenses.json).
This file contains a summary of our bundled dependencies and all the licensing information required, including links to the relevant license texts contained in the same folder.
Integrators of our library are then responsible for keeping this information along with their integrations.

Example on how to access the licenses:
```
let onfidoBundle = Bundle(for: OnfidoFlow.self)
guard let licensesPath = onfidoBundle.path(forResource: "onfido_licenses", ofType: "json", inDirectory: nil),
    let licensesData = try? Data(contentsOf: URL(fileURLWithPath: licensesPath)),
    let licensesContent = String(data: licensesData, encoding: .utf8) else {
        return
}

print(licensesContent)

guard let mitLicensePath = onfidoBundle.path(forResource: "onfido_licenses_mit", ofType: "txt", inDirectory: nil),
    let mitLicenseData = try? Data(contentsOf: URL(fileURLWithPath: mitLicensePath)),
    let mitLicenseFileContents = String(data: mitLicenseData, encoding: .utf8) else {
        return
}

print(mitLicenseFileContents)
```

## More Information

### Sample App

We have included sample apps to show how to integrate with the Onfido iOS SDK using both Swift and Objective-C. See the `SampleApp` and `SampleAppObjC` directories for more information.

### Support

Please open an issue through [GitHub](https://github.com/onfido/onfido-ios-sdk/issues). Please be as detailed as you can. Remember **not** to submit your token in the issue. Also check the closed issues to see whether it has been previously raised and answered.

If you have any issues that contain sensitive information please send us an email with the `ISSUE:` at the start of the subject to [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com?Subject=ISSUE%3A)

Previous versions of the SDK will be supported for a month after a new major version release. Note that when the support period has expired for an SDK version, no bug fixes will be provided, but the SDK will keep functioning (until further notice).

Copyright 2018 Onfido, Ltd. All rights reserved.
