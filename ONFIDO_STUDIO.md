## Overview
[Onfido Studio](https://developers.onfido.com/guide/onfido-studio-product) is a drag and drop interface enabling you to build an optimised route to verify each end user, by defining and configuring different paths, as well as incorporating a combination of signals, in a single identity verification flow.

## Integrating with iOS SDK 
The Onfido iOS SDK provides a drop-in set of screens and tools for iOS applications to capture identity documents and selfie photos and videos for the purpose of identity verification. 

The SDK communicates directly and dynamically with active workflows to show the relevant screens to ensure the correct capture and upload of user information. As a result, the SDK flow will vary depending on the workflow configuration. You won't need to specify any steps directly in the SDK integration as these will be overridden when the workflow run ID is passed into the SDK initialisation.

> ℹ️ 
> 
> The following guide will help you to integrate with Onfido Studio.
> If you are looking for the standard integration using Onfido checks, please head to our [README](https://github.com/onfido/onfido-ios-sdk).

## Getting started 

The SDK supports:

* iOS 11+
* SDK supports Xcode 14+\*
* SDK supports following presentation styles:
  - Only full screen style for iPhones
  - Full screen and form sheet styles for iPads

### 1. Add the SDK dependency

#### Using Swift Package Manager

The SDK is available with Swift Package Manager and you can include it in your project by adding the following package repository URL:

```swift
dependencies: [
    .package(url: "https://github.com/onfido/onfido-ios-sdk.git", .branch("master")) 
]
```

#### Using CocoaPods

The SDK is available on CocoaPods and you can include it in your project by adding the following to your Podfile:

```ruby
pod 'Onfido'
```

Run `pod install` to install the SDK.

##### OnfidoExtended

[![Version](https://img.shields.io/cocoapods/v/OnfidoExtended.svg?style=flat)](http://cocoapods.org/pods/OnfidoExtended)

You can install the extended version of the Onfido SDK, which includes fraud detection signals, through Cocoapods by adding the following to your Podfile:

```ruby
pod 'OnfidoExtended'
```

### 2. Build a configuration object

To initiaise the SDK, you must provide a `workflowRunId`, obtained by [creating a workflow run](https://documentation.onfido.com/#create-workflow-run), and an `sdkToken`, obtained by [generating an SDK token](https://documentation.onfido.com/#generate-sdk-token).

#### Swift

```swift
let workflowConfiguration = WorkflowConfiguration(workflowRunId: "workflowRunId", sdkToken: "sdkToken")
```    

#### Objective-C

```objc
ONWorkflowConfiguration *workflowConfiguration = [[ONWorkflowConfiguration alloc] initWithWorkflowRunId:@"workflowRunId" sdkToken:@"sdkToken"];
```

### 3. Start the flow

#### Swift

```swift
let onfidoRun = OnfidoFlow(workflowConfiguration: orchestrationConfig)
let flowViewController = try onfidoRun.run()
yourViewController.present(flowViewController, animated: true, completion: nil)
// listen for the result
```    

#### Objective-C

```objc
ONFlow *flow = [[ONFlow alloc] initWithWorkflowConfiguration:workflowConfiguration];

NSError *flowRunError;
UIViewController *flowViewController = [flow runAndReturnError:&flowRunError];

if (!flowRunError) {
    [yourViewController presentViewController:flowViewController
                                     animated:YES
                                   completion:nil];
}
// listen for the result
```    

## Handling callbacks

To receive the result from a completed workflow, you should pass a callback to the instance of `OnfidoFlow`. The following code is provided as an example: 

```swift
onfidoRun.with(responseHandler: { (response: OnfidoResponse) in
                    switch response {
                    case .success:
                    // User completed the flow

                    case .cancel(let cancellationReason):
                    // Flow cancelled by user
                    print(cancellationReason)

                    case .error(let error):
                    // Error occurred
                    print(error)

                    }
                }, dismissFlowOnCompletion: true) 
// Dismiss the whole flow when the user completes it, and return back to the integrator view.
```


| ATTRIBUTE        | NOTES           |
| ------------- |-------------|
| .success    | The end user completed all interactive tasks in the workflow. If you have configured [webhooks](https://documentation.onfido.com/#webhooks), a notification will be sent to your backend confirming the workflow run has finished. You do not need to create a check using your backend as this is handled directly by the Workflow.  |
| .error(Error)      | An unexpected error occurred.      |
| .cancel| The flow was exited prematurely by the user. The reason can be `.userExit` or `.consentDenied`    |

## Error handling

The `Error` object returned as part of `OnfidoResponse.error(Error)` is of type `OnfidoFlowError`. It's an enum with multiple cases depending on the error type.

```swift
switch response {
  case let OnfidoResponse.error(error):
    switch error {
      case OnfidoFlowError.cameraPermission:
        // This happens if the user denies permission to the SDK during the flow
      case OnfidoFlowError.failedToWriteToDisk:
        // This happens when the SDK tries to save capture to disk, maybe due to a lack of space
      case OnfidoFlowError.microphonePermission:
        // This happens when the user denies permission for microphone usage by the app during the flow
      case OnfidoFlowError.upload(let OnfidoApiError):
        // This happens when the SDK receives an error from an API call see [https://documentation.onfido.com/#errors](https://documentation.onfido.com/#errors) for more information
      case OnfidoFlowError.exception(withError: let error, withMessage: let message):
        // This happens when an unexpected error occurs. Please contact [ios-sdk@onfido.com](mailto:ios-sdk@onfido.com?Subject=ISSUE%3A) when this happens
      case OnfidoFlowError.versionInsufficient:
        // This happens when you are using an older version of the iOS SDK and trying to access a new functionality from workflow. You can fix this by updating the SDK

      default: // necessary because swift
    }
}
```

## UI Customization

The iOS SDK supports the customization of colors, fonts and strings used in the SDK flow. For visualizations of the available options please see our [SDK customization guide](https://developers.onfido.com/guide/sdk-customization#ios).

```Swift
let workflowConfiguration = WorkflowConfiguration(workflowRunId: "workflowRunId", sdkToken: "sdkToken")
let appearance = Appearance()

workflowConfiguration.withAppearance(appearance)
```

You can find more information on how to create an appearance object [here](https://github.com/onfido/onfido-ios-sdk#ui-customization).

## Language Customization

The SDK supports and maintains the following 44 languages:

- Arabic: ar
- Armenian: hy
- Bulgarian: bg
- Chinese (Simplified): zh_Hans
- Chinese (Traditional): zh_Hant
- Croatian: hr
- Czech: cs
- Danish: da
- Dutch: nl
- English (United Kingdom): en_GB
- English (United States): en_US
- Estonian: et
- Finnish: fi
- French (Canadian): fr_CA
- French: fr
- German: de
- Greek: el
- Hebrew: he
- Hindi: hi
- Hungarian: hu
- Indonesian: id
- Italian: it
- Japanese: ja
- Korean: ko
- Latvian: lv
- Lithuanian: lt
- Malay: ms
- Norwegian: nb
- Persian: fa
- Polish: pl
- Portuguese (Brazil): pt_BR
- Portuguese: pt
- Romanian: ro
- Russian: ru
- Serbian: sr_Latn
- Slovak: sk
- Slovenian: sl
- Spanish (Latin America): es_419
- Spanish: es
- Swedish: sv
- Thai: th
- Turkish: tr
- Ukrainian: uk
- Vietnamese: vi

The strings used within the SDK can be customized by having a `Localizable.strings` in your app for the desired language and by configuring the flow using `withCustomLocalization` method on the `WorkflowConfiguration` object.

You can find the keys for the localizable strings under the [`localization`](localization) directory which contains strings files for supported languages.

#### Swift

```swift
let workflowConfiguration = WorkflowConfiguration(workflowRunId: "workflowRunId", sdkToken: "sdkToken")
workflowConfiguration.withCustomLocalization(withTableName: "Localizable.strings", in: Bundle.main)
```

You can find more information on how to use a custom language [here](https://github.com/onfido/onfido-ios-sdk#custom-languages).