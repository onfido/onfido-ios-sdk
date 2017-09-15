# Onfido SDK Migration Guides

These guides below are provided to ease the transition of existing applications using the Onfido SDK from one version to another that introduces breaking API changes.

## Onfido SDK 3.0 Migration Guide

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
