# Onfido iOS SDK

This SDK provides Onfido customers with an easy way to integrate with our product and offered services.

## Overview

The SDK provides a drop-in integration for iOS apps and include the following features:

1. Take and evaluate the quality of document and face photos
2. Start checks with our API

By using the SDK you won't need to implement the photo capture screens yourself and we'll even check an actual document is in frame as well as general quality of the photos like brightness, contrast and sharpness.

## Setup

The SDK will be availble on Cocoapods and the standard way to include it in your projects is adding this line to your Podfile:

```ruby
pod 'OnfidoCaptureSDK', '~> 0.0.5'
```

## Usage

After adding the SDK as a dependency of your project, you can launch the Onfido SDK flow choosing what screens to show and what data to capture.

You should initialise the `OnfidoUI` class and present with the `flow()` method which will contain all the relevant steps you asked for when initialising.

```
let onfido = OnfidoUI(capture: captureOptions,
                      show: showOptions,
                      apiToken: "YOUR_API_TOKEN") { results in
    // whatever you may want to do *after* the Onfido UI is dismissed (like segue into another view controller of your own)
}
        
self.presentViewController(onfido.flow(), animated: true, completion: {
    // anything you may want to do after the Onfido UI is presented
})
```

### Capture Options

You can select what to capture from your user: personal details, document photo and facial capture. The options are `['details', 'document', 'face']`. For now you can use this option to skip either the *document* or *face* capture. Any of these will activate the *details* step for now but in future versions you'll be able to provide us with applicant details and skip that step in our SDK. This may be useful if you're calling the SDK for an existing user instead of someone just signing up.

### Show Options

This is meant to include an additional step before the capture steps – explaining to the user what will happen – and another one after, thanking the user. This is not in use for now and you should have these warnings and disclaimers in your own app. Use an empty array: `[]` 

### API Token

In order to get this token you should sign up with [Onfido](https://onfido.com/) and ask our support team for a token.

### Results

This is a structure including the API responses of the following requests:
  * Create Applicant
  * Upload Document
  * Identity/Document Checks

### Onfido API

The SDK also includes Swift bindings for all the endpoints currently supported by our API: creating applicants, running checks, retrieving reports. More details about these endpoints in our [documentation](https://onfido.com/documentation).

The API wrapper can then be used like below, e.g. to retrieve all Applicants:

```swift
OnfidoAPI.listApplicants(
  { applicants in
      // applicants is a [Applicant]
  },
  failure: { error in
      // error is a NSError
  }
)
```

### Callbacks

When done, the SDK will return to the host app with the results of the check.
This is still in the works and more details about this will be added here once the SDK is publicly available. Essentially the results will include the identity, document and facial reports.
