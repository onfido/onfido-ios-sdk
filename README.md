# Onfido iOS SDK

This SDK provides Onfido customers with an easy way to integrate with out identity verification and background checking solutions. It includes a set of screens for easily taking photos of faces and documents as well as a wrapper for out API.

## Overview

The SDK provides a drop-in integration for iOS apps and include the following features:

1. Take photos of document and faces and evaluate the quality
2. Create an applicant with the Onfido API
3. Add document and face photos to the applicant
3. Run checks on the applicant

By using the SDK you won't need to implement the photo capture screens yourself and we'll even check an actual document is in frame as well as general quality of the photos like brightness, contrast and sharpness.

## Setup

The SDK is availble on Cocoapods and you can include it in your projects by adding it to your Podfile:

```ruby
pod 'Onfido', '~> 0.0.6'
```

## Usage

After adding the SDK as a dependency of your project and running `pod install`, you can launch the Onfido SDK flow choosing what screens to show, what to capture and what data to create on our API.

You should initialise the `OnfidoUI` class and present with the `flow()` method which will contain all the relevant steps you asked for when initialising.

```
let onfido = OnfidoUI(apiToken: "YOUR API TOKEN")
    .andCapture(captureOptions)
    .andCreate(createOptions)
    .andCompleteWith({ completionResults in
        // a closure that'll run after the Onfido SDK is done capturing and creating any data you've requested
    })

self.presentViewController(onfido.flow(), animated: true, completion: nil)
```

### Capture Options

The `andCapture(captureOptions: [String])` method takes an Array of Strings as parameter and those can include "document" and "live_photo".
The screens for each of these options look like these:

Document:
![Capture Document](1 Capture Document.png)
![Preview Document](2 Preview Document.png)

Face:
![Capture Face](3 Capture Face.png)
![Preview Face](4 Preview Face.png)

### Create Options

The `andCreate(createOptions: [String: AnyObject])` method will take a Dictionary defining what should be created using the Onfido API. Keys define the entities and may include "document", "live_photo", "applicant" and "check".

The "document" and "live_photo" entities don't allow for any further options and the recommended value to be passed is an empty dictionary: `[:]`.

When requesting to create an "applicant" – which is required if you also choose to create any of the other entities – the value passed should be a dictionary which mimics the definition of an Applicant based on our API documentation found [here](https://documentation.onfido.com/#applicant-object). An example follows:

```
[
    "first_name": "Theresa",
    "last_name": "May",
    "email": "pm@number10.gov.uk",
    "dob": "1956-10-01",
    "country": "GBR",
    "addresses": [
        [
            "line1": "Number 10",
            "line2": "10 Downing St",
            "country": "GBR",
            "postcode": "SW1A 2AA",
            "town": "London"
        ]
    ]
]
```

As for the `check` the accepted options are:

```
[
    "type": "express",
    "reports": [
        ["name":"identity"],
        ["name":"document"],
        ["name":"facial_similarity"]
    ]
]
```

These options resemble the structure described in our API documentation [here](https://documentation.onfido.com/#create-check) and you can refer to that page for any details.

### Completion Results

By calling the `andCompleteWith(completionClosure: ((OnfidoSDKResults) -> (Void))?)` you'll be able to define a closure to run after all the work on the SDK is finished. The object passed as a parameter of the closure is an instance of `OnfidoSDKResults` which may include the following attributes: `applicant`, `check`, `document` and `livePhoto`. In case you asked the SDK to capture and/or create any of those they'll be available through these methods. If you requested a document/live photo to be captured but not created, you can access `file` (NSData) on either the Document or LivePhoto objects. If you also requested these entities would be created using Onfido API, those objects will also include all the details conforming to the API structure; check those [here](https://documentation.onfido.com/#live-photo-object) for the live photo and [here](https://documentation.onfido.com/#document-object) for the document. The same kind of response is available if an applicant has been created and/or a set of checks has been requested. The object definitions are also available as part of our API documentation [here](https://documentation.onfido.com/#applicant-object) for the applicant and [here](https://documentation.onfido.com/#check-object) for the check.

### API Token

In order to get this token you should sign up with [Onfido](https://onfido.com/) and ask our support team or your account manager for a token to be generated for you account which you'll then be able to get at your dashboard.

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
