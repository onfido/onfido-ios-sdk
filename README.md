# Onfido

[![Version](https://img.shields.io/cocoapods/v/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)
[![License](https://img.shields.io/cocoapods/l/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)
[![Platform](https://img.shields.io/cocoapods/p/Onfido.svg?style=flat)](http://cocoapods.org/pods/Onfido)

[Onfido](https://onfido.com/) is a provider of identity verification and background checks. This SDK provides an easy way to integrate with our 
API, capture photos of documents and faces and create applicants, documents or run checks through the Onfido API.

## Definitions

Throughout this guide, these terms will be used:
* `applicant` - the data structure that holds the information about the user you're trying to run the checks on;
* `check` - the set of reports you're running on an applicant;
* `report` - each of the different parts of a check (e.g. identity, document, facial_similarity);
* `document` – a photo of an applicant's document (e.g. Passport, Driver Licence, National ID card);
* `live photo` – a photo of the applicant's face.

## Overview

The SDK provides a drop-in integration for iOS apps and include the following features:

1. Take photos and validate the quality of documents and live photos
2. Create applicants with the Onfido API
3. Associate documents and live photos with the applicant
3. Run checks on the applicant

By using the SDK you don't need to implement the photo capture screens, saving on development time and you can leverage our input validation to ensure good quality captures before you run the checks.

## Setup

The SDK is availble on Cocoapods and you can include it in your projects by adding it to your Podfile:

```ruby
pod 'Onfido'
```

## Usage

After adding the SDK as a dependency of your project and running `pod install`, you can launch the Onfido SDK flow choosing what screens to show, what to capture and what data to create on our API.

You should initialise the `OnfidoUI` class and present with the `flow()` method which will contain all the relevant steps you asked for when initialising.

```
let onfido = OnfidoUI(apiToken: "YOUR API TOKEN")
    .andCapture(captureOptions)
    .andCreate(createOptions)
    .andCompleteWith({ completionResults in
    })

self.presentViewController(onfido.flow(), animated: true, completion: nil)
```

### Capture Options

The `andCapture(captureOptions: [String])` method takes an Array of Strings as a parameter which may include "document" and "live_photo".
The screens for each of these options look like this:

![Capture Document](1 Capture Document.png)
![Preview Document](2 Preview Document.png)

![Capture Face](3 Capture Face.png)
![Preview Face](4 Preview Face.png)

### Create Options

The `andCreate(createOptions: [String: AnyObject])` method will take a Dictionary defining what should be created using the Onfido API.

Keys define the entities and may include "document", "live_photo", "applicant" and "check".

As for values, "document" and "live_photo" don't allow for any further options and the recommended value to be passed is an empty dictionary: `[:]`.
For "applicant" – which is required if you also choose to create any of the other entities – the value passed should be a dictionary which mimics the definition of an Applicant based on our API documentation found [here](https://documentation.onfido.com/#applicant-object). An example follows:

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

By calling `andCompleteWith(completionClosure: ((OnfidoResults) -> (Void))?)` you'll be able to define a closure to run after all the work on the SDK is finished.

The object passed as a parameter of the closure is an instance of `OnfidoResults` and may include the following attributes: `applicant`, `check`, `document` and `livePhoto`.

In case you called `andCapture(captureOptions: [String])` or `andCreate(createOptions: [String: AnyObject])`, the objects captured (documents or live_photos) or created (applicants or checks) will be available as attributes of `OnfidoResults`.

Captured documents can be accessed like this:

```swift
if let document = onfidoResults!.document &&
   let image = UIImage(data: document.file!) {
                self.imageView.image = image
    }
```

The same applies for `live_photo`.

If you also requested these entities would be created using Onfido API, those objects will also include all the details conforming to the API structure which you can check [here](https://documentation.onfido.com/#live-photo-object) and [here](https://documentation.onfido.com/#document-object).

A similar approach can be used if an applicant has been created or a set of checks has been requested. The object definitions are also available as part of our API documentation [here](https://documentation.onfido.com/#applicant-object) and [here](https://documentation.onfido.com/#check-object).

### API Token

You can ask for you API Token by contacting our support team or through your account manager and you can signup [here](https://onfido.com/signup) if you're not a client yet.

### Onfido API

The SDK also includes Swift bindings for all the endpoints currently supported by our API: creating applicants, running checks, retrieving reports. You can find more details about these endpoints in our [documentation](https://onfido.com/documentation).

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

Copyright 2016 Onfido, Ltd. All rights reserved.