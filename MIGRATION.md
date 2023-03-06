# Onfido SDK Migration Guides

These guides below are provided to ease the transition of existing applications using the Onfido SDK from one version to another that introduces breaking API changes.

* [Onfido iOS SDK 28.1.0 Migration Guide](#onfido-ios-sdk-2810-migration-guide)
* [Onfido iOS SDK 28.0.0 Migration Guide](#onfido-ios-sdk-2800-migration-guide)
* [Onfido iOS SDK 27.2.0 Migration Guide](#onfido-ios-sdk-2720-migration-guide)
* [Onfido iOS SDK 27.0.0 Migration Guide](#onfido-ios-sdk-2700-migration-guide)
* [Onfido iOS SDK 25.0.0 Migration Guide](#onfido-ios-sdk-2500-migration-guide)
* [Onfido iOS SDK 24.2.0 Migration Guide](#onfido-ios-sdk-2420-migration-guide)
* [Onfido iOS SDK 24.0.0 Migration Guide](#onfido-ios-sdk-2400-migration-guide)
* [Onfido iOS SDK 23.1.0 Migration Guide](#onfido-ios-sdk-2310-migration-guide)
* [Onfido iOS SDK 23.0.0 Migration Guide](#onfido-ios-sdk-2300-migration-guide)
* [Onfido iOS SDK 22.2.0 Migration Guide](#onfido-ios-sdk-2220-migration-guide)
* [Onfido iOS SDK 22.1.0 Migration Guide](#onfido-ios-sdk-2210-migration-guide)
* [Onfido iOS SDK 22.0.0 Migration Guide](#onfido-ios-sdk-2200-migration-guide)
* [Onfido iOS SDK 21.4.0 Migration Guide](#onfido-ios-sdk-2140-migration-guide)
* [Onfido iOS SDK 21.2.0 Migration Guide](#onfido-ios-sdk-2120-migration-guide)
* [Onfido iOS SDK 21.0.0 Migration Guide](#onfido-ios-sdk-2100-migration-guide)
* [Onfido iOS SDK 19.0.0 Migration Guide](#onfido-ios-sdk-1900-migration-guide)
* [Onfido iOS SDK 18.10.0 Migration Guide](#onfido-ios-sdk-18100-migration-guide)
* [Onfido iOS SDK 18.9.0 Migration Guide](#onfido-ios-sdk-1890-migration-guide)
* [Onfido iOS SDK 18.8.0 Migration Guide](#onfido-ios-sdk-1880-migration-guide)
* [Onfido iOS SDK 18.7.0 Migration Guide](#onfido-ios-sdk-1870-migration-guide)
* [Onfido iOS SDK 18.5.0 Migration Guide](#onfido-ios-sdk-1850-migration-guide)
* [Onfido iOS SDK 18.1.0 Migration Guide](#onfido-ios-sdk-1810-migration-guide)
* [Onfido iOS SDK 18.0.0 Migration Guide](#onfido-ios-sdk-1800-migration-guide)
* [Onfido iOS SDK 17.0.0 Migration Guide](#onfido-ios-sdk-1700-migration-guide)
* [Onfido iOS SDK 16.1.0 Migration Guide](#onfido-ios-sdk-1610-migration-guide)
* [Onfido iOS SDK 16.0.0 Migration Guide](#onfido-ios-sdk-1600-migration-guide)
* [Onfido iOS SDK 15.0.0 Migration Guide](#onfido-ios-sdk-1500-migration-guide)
* [Onfido iOS SDK 14.0.0-rc Migration Guide](#onfido-ios-sdk-1400-rc-migration-guide)
* [Onfido iOS SDK 14.0.0-beta Migration Guide](#onfido-ios-sdk-1400-beta-migration-guide)
* [Onfido iOS SDK 13.2.0 Migration Guide](#onfido-ios-sdk-1320-migration-guide)
* [Onfido iOS SDK 13.1.0 Migration Guide](#onfido-ios-sdk-1310-migration-guide)
* [Onfido iOS SDK 13.0.0 Migration Guide](#onfido-ios-sdk-1300-migration-guide)
* [Onfido iOS SDK 12.1.0 Migration Guide](#onfido-ios-sdk-1210-migration-guide)
* [Onfido iOS SDK 12.0.0 Migration Guide](#onfido-ios-sdk-1200-migration-guide)
* [Onfido iOS SDK 11.1.2 Migration Guide](#onfido-ios-sdk-1112-migration-guide)
* [Onfido iOS SDK 11.1.0 Migration Guide](#onfido-ios-sdk-1110-migration-guide)
* [Onfido iOS SDK 11.0.0 Migration Guide](#onfido-ios-sdk-1100-migration-guide)
* [Onfido iOS SDK 10.6.0 Migration Guide](#onfido-ios-sdk-1060-migration-guide)
* [Onfido iOS SDK 10.5.0 Migration Guide](#onfido-ios-sdk-1050-migration-guide)
* [Onfido iOS SDK 10.4.0 Migration Guide](#onfido-ios-sdk-1040-migration-guide)
* [Onfido iOS SDK 10.3.0 Migration Guide](#onfido-ios-sdk-1030-migration-guide)
* [Onfido iOS SDK 10.2.0 Migration Guide](#onfido-ios-sdk-1020-migration-guide)
* [Onfido iOS SDK 10.1.0 Migration Guide](#onfido-ios-sdk-1010-migration-guide)
* [Onfido iOS SDK 10.0.0 Migration Guide](#onfido-ios-sdk-1000-migration-guide)
* [Onfido iOS SDK 9.0.0 Migration Guide](#onfido-sdk-900-migration-guide)
* [Onfido iOS SDK 8.0.0 Migration Guide](#onfido-sdk-800-migration-guide)
* [Onfido iOS SDK 7.2.0 Migration Guide](#onfido-sdk-720-migration-guide)
* [Onfido iOS SDK 7.1.0 Migration Guide](#onfido-sdk-710-migration-guide)
* [Onfido iOS SDK 7.0.0 Migration Guide](#onfido-sdk-700-migration-guide)
* [Onfido iOS SDK 6.0.0 Migration Guide](#onfido-sdk-600-migration-guide)
* [Onfido iOS SDK 5.6.0 Migration Guide](#onfido-sdk-560-migration-guide)
* [Onfido iOS SDK 5.5.0 Migration Guide](#onfido-sdk-550-migration-guide)
* [Onfido iOS SDK 5.1.0 Migration Guide](#onfido-sdk-510-migration-guide)
* [Onfido iOS SDK 5.0.0 Migration Guide](#onfido-sdk-500-migration-guide)
* [Onfido iOS SDK 4.0.0 Migration Guide](#onfido-sdk-400-migration-guide)
* [Onfido iOS SDK 3.0.0 Migration Guide](#onfido-sdk-300-migration-guide)

## Onfido iOS SDK 28.1.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_nfc_scan_sheet_success` (es-419, fr-CA, pt-BR, sr, zh)

- `onfido_avc_intro_disclaimer_camera_and_audio_on` (es-419, fr-CA, pt-BR, sr, zh)

- `onfido_avc_intro_disclaimer_camera_on` (es-419, fr-CA, pt-BR, sr, zh)


#### Changed

The following string keys have been **changed**:

- `onfido_avc_intro_disclaimer_camera_on` ()



## Onfido iOS SDK 28.0.0 Migration Guide

### Breaking API Changes

- Removed deprecated Document variant public APIs
- Removed SegmentSDK for analytics

### String Changes

#### Removed

The following string keys have been **removed**:
- `onfido_app_title_doc_video_confirmation`
- `onfido_doc_video_capture_alert_wrong_side`
- `onfido_doc_video_capture_button_primary_fallback`
- `onfido_doc_video_capture_button_primary_fallback_end`
- `onfido_doc_video_capture_button_primary_start`
- `onfido_doc_video_capture_detail_step2`
- `onfido_doc_video_capture_header`
- `onfido_doc_video_capture_header_paper_doc_step2`
- `onfido_doc_video_capture_header_passport`
- `onfido_doc_video_capture_header_passport_progress`
- `onfido_doc_video_capture_header_step1`
- `onfido_doc_video_capture_header_step2`
- `onfido_doc_video_capture_prompt_button_timeout`
- `onfido_doc_video_capture_prompt_detail_timeout`
- `onfido_doc_video_capture_prompt_header_timeout`
- `onfido_doc_video_capture_stepper`
- `onfido_doc_video_capture_success_accessibility`
- `onfido_doc_video_confirmation_body`
- `onfido_doc_video_confirmation_button_primary`
- `onfido_doc_video_confirmation_button_secondary`
- `onfido_doc_video_confirmation_button_secondary_preview`
- `onfido_doc_video_confirmation_button_secondary_retake`
- `onfido_doc_video_confirmation_title`
- `onfido_outro_title`
- `onfido_welcome_list_header_doc_video`
- `onfido_welcome_list_item_doc_video`
- `onfido_welcome_list_item_doc_video_flash`
- `onfido_welcome_list_item_doc_video_timeout`

### Breaking API changes

- The way to configure SDK for document capture step has changed. To see instructions and usage examples please check out [README]('https://github.com/onfido/onfido-ios-sdk/blob/28.0.0/README.md#document-step') page.

## Onfido iOS SDK 27.2.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_welcome_start_workflow_button_trial`

- `onfido_enter_can_title`

- `onfido_enter_can_subtitle`

- `onfido_enter_can_disclaimer`

- `onfido_enter_can_button_primary`

- `onfido_nfc_scan_error_title`

- `onfido_nfc_scan_error_list_item`

- `onfido_nfc_scan_error_list_item_2`

- `onfido_nfc_scan_error_button_primary`

- `onfido_welcome_nfc_title`

- `onfido_welcome_nfc_subtitle`

- `onfido_welcome_nfc_list_header_nfc`

- `onfido_welcome_nfc_list_item`

- `onfido_welcome_nfc_list_item_2`

- `onfido_welcome_nfc_button_primary`

- `onfido_intro_scan_title`

- `onfido_intro_scan_subtitle`

- `onfido_intro_scan_list_item`

- `onfido_intro_scan_list_item_3`

- `onfido_intro_scan_button_primary`

- `onfido_nfc_scan_sheet`

- `onfido_nfc_scan_scanning_sheet_1`

- `onfido_nfc_scan_can-required_sheet_2`

- `onfido_nfc_scan_lost-contact_sheet_3`

- `onfido_nfc_scan_lost-connection_sheet_4`

- `onfido_nfc_scan_incorrect-can_sheet_5`

- `onfido_enter_can_error_label`

- `onfido_enter_can_substring_attempt_singular`

- `onfido_enter_can_substring_attempt_plural`

- `onfido_nfc_scan_error_button_secondary`

- `onfido_intro_scan_animation_ios`


#### Changed

The following string keys have been **changed**:

- `onfido_poa_intro_list_shows_address_ios`

- `onfido_poa_intro_list_matches_signup_ios`

- `onfido_poa_intro_list_most_recent_ios`

- `onfido_poa_intro_title_ios`

- `onfido_poa_guidance_subtitle_bill_ios`

- `onfido_poa_guidance_subtitle_bank_statement_ios`

- `onfido_poa_guidance_subtitle_tax_letter_ios`

- `onfido_poa_guidance_subtitle_benefits_letter_ios`

## Onfido iOS SDK 27.0.0 Migration Guide

### Breaking API Changes

- Renamed withNFCReadBetaFeatureEnabled SDK configuration functions to withNFCReadFeatureEnabled

## Onfido iOS SDK 25.0.0 Migration Guide

### Breaking API Changes

- Remove user consent from the public API

## Onfido iOS SDK 24.2.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_nfc_intro_carousel_body_remove_cover` (en, fr, de, es, it, nl, pt)

- `nonfido_nfc_intro_carousel_body_lay_flat` (en, fr, de, es, it, nl, pt)

- `nonfido_nfc_intro_carousel_body_phone_middle` (en, fr, de, es, it, nl, pt)

- `nonfido_nfc_intro_carousel_body_last_page` (en, fr, de, es, it, nl, pt)

- `nonfido_nfc_intro_carousel_body_dont_move` (en, fr, de, es, it, nl, pt)


- `onfido_doc_capture_header_capturing` (en, fr, de, es, it, pt, nl)


#### Removed

The following string keys have been **removed**:

- `onfido_doc_capture_header_scanning` (en, fr, de, es, it, pt)



## Onfido iOS SDK 24.0.0 Migration Guide

### Platform Changes

- Dropped iOS 10 support. Now supporting iOS 11 or newer.

### Breaking API Changes

- Removed withToken(_:) and withApplicantId(_:) functions from OnfidoConfigBuilder. Mobile tokens are no longer supported.
- Removed cases missingApplicant, multipleTokenTypes, applicantProvidedWithSDKToken and enterpriseFeatureProvidedWithMobileToken from OnfidoConfigError. Mobile tokens are no longer supported.
- Renamed OnfidoConfigError.missingToken to OnfidoConfigError.missingSDKToken.
- Added new OnfidoConfigError case named invalidSDKToken when invalid SDK token supplied.
- Removed initialisers with parameters for Appearance (ONAppearance) and CaptureSuccessColors (ONCaputreSuccessColors), and made properties public. i.e. let appearance = Appearance(); appearance.primaryColor = UIColor.red;
- Renamed withPassportNFCReadBetaFeatureEnabled sdk configuration function to withNFCReadBetaFeatureEnabled.
- Removed EnterpriseFeature convenience initialiser. Use EnterpriseFeatures.builder().withHideOnfidoLogo(_:).build() instead.

## Onfido iOS SDK 23.1.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_video_capture_prompt_header_restart` (en, fr, de, es, it, pt)

- `onfido_video_capture_prompt_detail_restart` (en, fr, de, es, it, pt)

- `onfido_video_capture_prompt_button_restart` (en, fr, de, es, it, pt)


- `onfido_doc_capture_header_scanning` (en, fr, de, es, it, pt)

- `onfido_welcome_list_header` (en, fr, de, es, it, pt)

- `onfido_welcome_list_item_doc_photo` (en, fr, de, es, it, pt)

- `onfido_welcome_list_item_doc_video` (en, fr, de, es, it, pt)

- `onfido_welcome_list_item_doc_generic` (en, fr, de, es, it, pt)

- `onfido_welcome_list_item_face_photo` (en, fr, de, es, it, pt)

- `onfido_welcome_list_item_face_video` (en, fr, de, es, it, pt)

- `onfido_welcome_list_item_face_generic` (en, fr, de, es, it, pt)


- `onfido_doc_capture_header_live_guidance_intro_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_no_doc` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_no_doc_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_distance_close` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_distance_close_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_distance_far` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_distance_far_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_distance_ok` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_distance_ok_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_too_left` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_too_left_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_too_right` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_too_right_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_too_high` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_too_high_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_slightly_high` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_slightly_high_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_too_low` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_too_low_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_slightly_low` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_slightly_low_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_position_ok` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_doc_position_ok_accessibility` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_live_guidance_intro` (en, fr, de, es, it, pt)


#### Changed

The following string keys have been **changed**:

- `onfido_doc_capture_frame_accessibility_pp_auto` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_pp_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_front_auto` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_back_auto` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_rp_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_rp_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_fr_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_fr_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_it_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_it_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_za_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_za_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_pp_cover_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_folded_doc_back` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_passport` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_visa` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_passport_auto` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_license_back` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_license_back_auto` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_generic_back` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_id_back` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_permit_back` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_license_front` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_license_front_auto` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_generic_front` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_id_front` (en, fr, de, es, it, pt)

- `onfido_doc_capture_header_permit_front` (en, fr, de, es, it, pt)


#### Removed

The following string keys have been **removed**:

- `onfido_welcome_list_header_doc_video` (en, fr, de, es, it, pt)

- `onfido_welcome_list_item_doc` (en, fr, de, es, it, pt)

- `onfido_welcome_list_header_photo` (en, fr, de, es, it, pt)

- `onfido_welcome_list_header_record` (en, fr, de, es, it, pt)


- `onfido_doc_capture_frame_accessibility_pp_auto` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_pp_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_fr_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_front_auto` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_rp_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_rp_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_fr_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_it_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_it_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_za_front_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_ic_za_back_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_pp_cover_manual` (en, fr, de, es, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_back_auto` (en, fr, de, es, it, pt)


- `onfido_confirm_passport` (en)

- `onfido_confirm_residence_permit` (en)

- `onfido_confirm_visa` (en)


- `onfido_nfc_intro:title_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_intro:title_card` (en, fr, de, es, it, pt)



## Onfido iOS SDK 23.0.0 Migration Guide

### Platform Changes

- Dropped support for Xcode 11.5 & 12.x.x

## Onfido iOS SDK 22.2.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_doc_capture_frame_success_accessibility` (en, fr, es, de, it, pt)


- `onfido_doc_capture_alert_no_mrz3_title` (en, fr, de, es, it, pt)


- `onfido_nfc_select_title_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_select_subtitle_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_select_body_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_select_button_primary_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_select_button_secondary_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_title_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_subtitle_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_button_primary_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_sheet_header_ready_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_sheet_header_scanning_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_title_card` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_subtitle_card` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_button_primary_card` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_sheet_header_ready_card` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_sheet_header_scanning_card` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_sheet_header_fail_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_sheet_header_fail_card` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_title_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_list_item_remove_covers_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_list_item_remove_covers_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_button_primary_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_button_secondary_passport` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_title_card` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_list_item_remove_covers_card` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_list_item_keep_contact_card` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_button_primary_card` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_button_secondary_card` (en, fr, de, es, it, pt)


- `onfido_video_capture_turn_success_accessibility` (en, fr, es, de, it, pt)


#### Changed

The following string keys have been **changed**:

- `onfido_doc_capture_frame_accessibility_pp_auto` (en, fr, es, de, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_front_auto` (en, fr, es, de, it, pt)

- `onfido_doc_capture_frame_accessibility_dl_back_auto` (en, fr, es, de, it, pt)


- `onfido_video_capture_frame_success_accessibility` (en, fr, es, de, it, pt)


#### Removed

The following string keys have been **removed**:

- `onfido_nfc_select_title` (en, fr, de, es, it, pt)

- `onfido_nfc_select_subtitle` (en, fr, de, es, it, pt)

- `onfido_nfc_select_body` (en, fr, de, es, it, pt)

- `onfido_nfc_select_button_primary` (en, fr, de, es, it, pt)

- `onfido_nfc_select_button_secondary` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_title` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_subtitle` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_button_primary` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_sheet_header_ready` (en, fr, de, es, it, pt)

- `onfido_nfc_intro_sheet_header_scanning` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_title` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_list_item_remove_covers` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_list_item_keep_contact` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_button_primary` (en, fr, de, es, it, pt)

- `onfido_nfc_fail_button_secondary` (en, fr, de, es, it, pt)



## Onfido iOS SDK 22.1.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_generic_error_timeout_title` (en, fr, es, de)

- `onfido_generic_error_timeout_detail` (en, fr, es, de)

- `onfido_generic_error_timeout_button_primary` (en, fr, es, de)

- `onfido_generic_processing` (en, fr, es, de)


#### Changed

The following string keys have been **changed**:

- `onfido_doc_confirmation_alert_blur_detail` (en, fr, es, de)

- `onfido_video_intro_list_item_move_speak` (en, fr, es, de)

- `onfido_video_capture_prompt_detail_timeout` (en, fr, es, de)

- `onfido_doc_confirmation_body_visa` (en, fr, es, de)

- `onfido_doc_capture_detail_license_back` (en, fr, es, de)

- `onfido_doc_capture_detail_generic_back` (en, fr, es, de)

- `onfido_doc_capture_detail_id_back` (en, fr, es, de)

- `onfido_doc_capture_detail_permit_back` (en, fr, es, de)

- `onfido_doc_capture_detail_license_front` (en, fr, es, de)

- `onfido_doc_capture_detail_generic_front` (en, fr, es, de)

- `onfido_doc_capture_detail_id_front` (en, fr, es, de)

- `onfido_doc_capture_detail_permit_front` (en, fr, es, de)

- `onfido_doc_capture_header_license_back` (en, fr, es, de)

- `onfido_doc_capture_header_license_back_auto` (en, fr, es, de)

- `onfido_doc_capture_header_generic_back` (en, fr, es, de)

- `onfido_doc_capture_header_license_front` (en, fr, es, de)

- `onfido_doc_capture_header_license_front_auto` (en, fr, es, de)

- `onfido_doc_capture_header_generic_front` (en, fr, es, de)

- `onfido_selfie_confirmation_alert_no_face_detail` (en, fr, es, de)

- `onfido_doc_capture_detail_visa` (en, fr, es, de)

- `onfido_video_capture_button_primary_fallback` (en, fr, es, de)

- `onfido_country_select_bottom_sheet_link_doc_select` (en, fr, es, de)

- `onfido_country_select_bottom_sheet_details` (en, fr, es, de)



## Onfido iOS SDK 22.0.0 Migration Guide

### Breaking API Changes

- DocumentResult object now contains front and back capture objects. If passport captured then only front is set and back is nil. To access the document front result use documentResult.front.id instead of documentResult.id. Href, createdAt, fileName, fileType, fileSize properties are no longer supported for DocumentResult and FaceResult. Now only returning a single DocumentResult and FaceResult object (last capture).
### String Changes

#### Added

The following string keys have been **added**:

- `onfido_doc_confirmation_alert_crop_detail` (en, fr, de, es)

- `onfido_doc_confirmation_alert_crop_title` (en, fr, de, es)

- `onfido_doc_upload_progress_label` (en, fr, de, es)


- `onfido_doc_capture_frame_accessibility_pp_auto` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_pp_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_dl_front_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_dl_back_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_dl_front_auto` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_dl_back_auto` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_ic_front_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_ic_back_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_rp_front_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_rp_back_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_dl_fr_front_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_dl_fr_back_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_ic_it_front_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_ic_it_back_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_ic_za_front_manual` (en, fr, es, de)

- `onfido_doc_capture_frame_accessibility_ic_za_back_manual` (en, fr, es, de)


- `onfido_country_select_search_results_none_accessibility` (en, fr, es, de)

- `onfido_country_select_search_results_one_accessibility` (en, fr, es, de)

- `onfido_country_select_search_results_multiple_accessibility` (en, fr, es, de)


#### Changed

The following string keys have been **changed**:

- `onfido_doc_confirmation_button_primary_license` (en, fr, de, es)

- `onfido_doc_confirmation_button_primary_generic` (en, fr, de, es)

- `onfido_doc_confirmation_button_primary_id` (en, fr, de, es)

- `onfido_doc_confirmation_button_primary_passport` (en, fr, de, es)

- `onfido_doc_confirmation_button_primary_permit` (en, fr, de, es)

- `onfido_doc_confirmation_button_primary_visa` (en, fr, de, es)

- `onfido_welcome_list_header_photo` (en, fr, de, es)

- `onfido_welcome_list_header_record` (en, fr, de, es)

- `onfido_doc_confirmation_button_primary` (en, fr, de, es)

- `onfido_welcome_list_item_doc` (en, fr, de, es)

- `onfido_welcome_list_item_selfie` (en, fr, de, es)

- `onfido_welcome_list_item_video` (en, fr, de, es)


- `onfido_video_intro_list_item_move_speak` (en, fr, es, de)

- `onfido_video_intro_list_item_time_limit` (en, fr, es, de)


- `onfido_selfie_capture_frame_accessibility` (fr, de)


- `onfido_doc_capture_header_passport_auto` (en, fr, es, de)


- `onfido_selfie_capture_frame_accessibility` (en, fr, es, de)

- `onfido_video_capture_frame_accessibility` (en, fr, es, de)


- `onfido_video_intro_video_accessibility` (en, fr, es, de)



## Onfido iOS SDK 21.4.0 Migration Guide

### String Changes

#### Changed

The following string keys have been **changed**:

- `onfido_user_consent_prompt_button_primary` (en, fr, es, de)

- `onfido_user_consent_prompt_button_secondary` (en, fr, es, de)



## Onfido iOS SDK 21.2.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_app_title_user_consent_load_fail` (en, fr, es, de)

- `onfido_user_consent_load_fail_title` (en, fr, es, de)

- `onfido_user_consent_load_fail_detail` (en, fr, es, de)

- `onfido_user_consent_load_fail_button_primary` (en, fr, es, de)



## Onfido iOS SDK 21.0.0 Migration Guide

### Breaking API Changes

- Added cancellation reason to response handler cancelled case. Value can be .userExit or .deniedConsent
- Changed OnfidoConfig.Builder to OnfidoConfigBuilder
### String Changes

#### Added

The following string keys have been **added**:

- `onfido_app_title_user_consent` (en, es, fr, de)

- `onfido_user_consent_prompt_no_consent_title` (en, es, fr, de)

- `onfido_user_consent_prompt_no_consent_detail` (en, es, fr, de)

- `onfido_user_consent_prompt_button_primary` (en, es, fr, de)

- `onfido_user_consent_prompt_button_secondary` (en, es, fr, de)

- `onfido_user_consent_button_primary` (en, es, fr, de)

- `onfido_user_consent_button_secondary` (en, es, fr, de)


#### Changed

The following string keys have been **changed**:

- `onfido_locale` (de)



## Onfido iOS SDK 19.0.0 Migration Guide

### Breaking API Changes

- Now SDK sends selected document country information to the backend. If an incorrect country value has been set when configuring the Document step [see documentation]('https://github.com/onfido/onfido-ios-sdk/#configuring-country'), SDK will throw an error during document upload

## Onfido iOS SDK 18.10.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_app_title_country_select_search` (en, fr, de, es)


- `onfido_country_select_list_accessibility` (en, fr, de, es)


#### Changed

The following string keys have been **changed**:

- `onfido_app_title_country_select` (en, fr, de, es)


#### Removed

The following string keys have been **removed**:

- `onfido_country_select_title` (en, fr, de, es)


- `onfido_video_confirmation_title` (en, fr, de, es)



## Onfido iOS SDK 18.9.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_generic_alert_network_error_label` (en, fr, de, es)

- `onfido_generic_uploading` (en, fr, de, es)

- `onfido_generic_alert_network_error_button_primary` (en, fr, de, es)

- `onfido_info_tablet_orientation_subtitle` (en, fr, de, es)

- `onfido_info_tablet_orientation_title` (en, fr, de, es)

- `onfido_info_tablet_orientation_body` (en, fr, de, es)


#### Removed

The following string keys have been **removed**:

- `onfido_accessibility_liveness_confirmation_view` (en, fr, de, es)

- `onfido_decline` (en, fr, de, es)

- `onfido_label_doc_type_driving_license_up` (en, fr, de, es)

- `onfido_label_doc_type_id_card_up` (en, fr, de, es)

- `onfido_label_doc_type_residence_permit_up` (en, fr, de, es)

- `onfido_message_capture_face` (en, fr, de, es)

- `onfido_liveness_preparation_subtitle` (en, fr, de, es)


- `onfido_error_dialog_title` (en, fr, de, es)

- `onfido_message_uploading` (en, fr, de, es)

- `onfido_ok` (en, fr, de, es)

- `onfido_orientation_message_subtitile_ios` (en, fr, de, es)

- `onfido_orientation_message_title_ios` (en, fr, de, es)

- `onfido_orientation_upsidedown_message_ios` (en, fr, de, es)



## Onfido iOS SDK 18.8.0 Migration Guide

### String Changes

#### Changed

⚠️ Most localisation keys now renamed. Use [migrate-keys.rb](keys_migration/migrate-keys.rb) script and key mapping file [key_migration_18_7_0_mapping.json](keys_migration/key_migration_18_7_0_mapping.json) to migrate from 18.7.0 to 18.8.0. To use run following command:
```bash
migrate-keys.rb --files-path <Path/To/lproj/directories> --platform ios --key-mapping-file key_migration_18_7_0_mapping.json
```



## Onfido iOS SDK 18.7.0 Migration Guide

⚠️ The Onfido SDK require CoreNFC to run from 18.7.0. Since Xcode 12 there is bug where `libnfshared.dylib` is missing from simulators which is required for CoreNFC to work. See [stackoverflow](https://stackoverflow.com/questions/63915728/xcode12-corenfc-simulator-library-not-loaded) to solve this problem.

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_nfc_option_title` (en, fr, es, de)

- `onfido_nfc_option_subtitle` (en, fr, es, de)

- `onfido_nfc_option_epassport_symbol` (en, fr, es, de)

- `onfido_nfc_option_button_primary` (en, fr, es, de)

- `onfido_nfc_option_button_secondary` (en, fr, es, de)

- `onfido_nfc_intro_title` (en, fr, es, de)

- `onfido_nfc_intro_subtitle` (en, fr, es, de)

- `onfido_nfc_intro_button_primary` (en, fr, es, de)

- `onfido_nfc_sheet_ready_intruction` (en, fr, es, de)

- `onfido_nfc_sheet_scanning_subtitle` (en, fr, es, de)

- `onfido_nfc_failed_title` (en, fr, es, de)

- `onfido_nfc_failed_list_item_remove_covers` (en, fr, es, de)

- `onfido_nfc_failed_list_item_keep_contact` (en, fr, es, de)

- `onfido_nfc_failed_button_primary` (en, fr, es, de)

- `onfido_nfc_failed_button_secondary` (en, fr, es, de)



## Onfido iOS SDK 18.5.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_south_african_id_capture_title` (en, fr, es, de)



## Onfido iOS SDK 18.1.0 Migration Guide

### String Changes

#### Added

The following string keys have been **added**:

- `onfido_selfie_intro_button`

- `onfido_selfie_confirmation_confirm_button`

- `onfido_selfie_confirmation_retake_button`

- `onfido_liveness_intro_button`

- `onfido_flow_intro_subtitle`

- `onfido_doc_type_selection_passport_option`

- `onfido_doc_type_selection_driving_license_option`

- `onfido_doc_type_selection_identity_card_option`

- `onfido_doc_type_selection_residence_permit_option`

- `onfido_doc_type_selection_title`

- `onfido_doc_type_selection_subtitle`

- `onfido_selfie_capture_instructions`

- `onfido_liveness_capture_instructions`


#### Changed

The following string keys have been **changed**:

- `onfido_confirm_driving_license` (en)

- `onfido_confirm_generic_document` (en)

- `onfido_confirm_national_id` (en)

- `onfido_confirm_passport` (en)

- `onfido_confirm_residence_permit` (en)

- `onfido_confirm_visa` (en)

- `onfido_discard` (en)

- `onfido_welcome_view_title` (en)

- `onfido_capture_face_subtitle` (en)

- `onfido_capture_face_step_1` (en)

- `onfido_capture_face_step_2` (en)

- `onfido_liveness_intro_title` (en)

- `onfido_liveness_intro_subtitle` (en)

- `onfido_submit_video` (en)

- `onfido_welcome_view_toolbar_title` (en)

- `onfido_message_check_readability_subtitle_driving_license` (en)

- `onfido_message_check_readability_subtitle_generic` (en)

- `onfido_message_check_readability_subtitle_national_id` (en)

- `onfido_message_check_readability_subtitle_passport` (en)

- `onfido_message_check_readability_subtitle_residence_permit` (en)

- `onfido_message_check_readability_subtitle_visa` (en)

- `onfido_message_confirm_face_subtitle` (en)


#### Removed

The following string keys have been **removed**:

- `onfido_confirm_face_long`

- `onfido_discard_face_long`

- `onfido_welcome_view_face_capture_title_ios`

- `onfido_confirm_face_2`

- `onfido_continue`

- `onfido_welcome_view_time`

- `onfido_document_selection_title`

- `onfido_document_selection_subtitle`

- `onfido_message_capture_face`



## Onfido iOS SDK 18.0.0 Migration Guide

### Breaking API Changes

- The way to configure SDK for document capture step has changed. To see instructions and usage examples please check out [README]('https://github.com/onfido/onfido-ios-sdk/blob/18.0.0/README.md#document-type-configuration') page.

## Onfido iOS SDK 17.0.0 Migration Guide

### Breaking API changes

-  The deprecated `withApplicant()` function has been **removed**.
 If you're using `withApplicant()` function to create an applicant, please refer to [README](https://github.com/onfido/onfido-ios-sdk/blob/17.0.0/README.md#2-creating-an-applicant) to understand how to create an applicant. Once you created it, use `withApplicantId` function to pass `id` value of applicant.

 - Following with `withApplicant()` function removal, `OnfidoConfigError.multipleApplicants` and `ONFlowResultType.applicant` enum cases have been **removed**.

 **Note**: This change doesn't affect the integrators who use SDK token (`withSDKToken()`) to configure the SDK as applicant creation happens before SDK token generation.

### Strings

The following string keys have been **added**:
- `onfido_flow_intro_summary_photo_capture_steps`
- `onfido_flow_intro_summary_photo_video_capture_steps`
- `onfido_flow_intro_summary_button_document_step`
- `onfido_capture_face_title`
- `onfido_liveness_intro_title`
- `onfido_liveness_challenge_turn_face_forward`
- `onfido_message_side_document_front_driving_license_autocapture`
- `onfido_message_side_document_back_driving_license_autocapture`

The following string keys have been **changed**:
- `onfido_welcome_view_document_capture_title`
- `onfido_welcome_view_face_capture_title`
- `onfido_welcome_view_liveness_capture_title`
- `onfido_mrz_not_detected_subtitle`
- `onfido_barcode_error_title`
- `onfido_barcode_error_subtitle`
- `onfido_liveness_challenge_turn_right_title`
- `onfido_liveness_challenge_turn_left_title`
- `onfido_message_document_passport`
- `onfido_message_passport_capture_subtitle`
- `onfido_message_document_visa`
- `onfido_message_visa_capture_subtitle`
- `onfido_message_side_document_front_driving_license`
- `onfido_message_document_capture_info_front_driving_license`
- `onfido_message_side_document_back_driving_license`
- `onfido_message_document_capture_info_back_driving_license`
- `onfido_message_side_document_front_residence_permit`
- `onfido_message_document_capture_info_front_residence_permit`
- `onfido_message_side_document_back_residence_permit`
- `onfido_message_document_capture_info_back_residence_permit`
- `onfido_message_side_document_front_national_id`
- `onfido_message_document_capture_info_front_national_id`
- `onfido_message_side_document_back_national_id`
- `onfido_message_document_capture_info_back_national_id`
- `onfido_message_side_document_front_generic`
- `onfido_message_document_capture_info_front_generic`
- `onfido_message_side_document_back_generic`
- `onfido_message_document_capture_info_back_generic`

The following string keys have been **removed**:
- `onfido_barcode_error_third_title`

## Onfido iOS SDK 16.1.0 Migration Guide

### Strings

The following string keys have been **added**:
- `onfido_italian_id_capture_title`
- `onfido_french_driving_license_capture_title`
- `onfido_folded_paper_option`
- `onfido_plastic_card_option`
- `onfido_driving_license_type_selection_title`
- `onfido_national_identity_type_selection_title`
- `onfido_folded_paper_front_capture_title`
- `onfido_folded_paper_front_capture_subtitle`
- `onfido_folded_paper_back_capture_title`
- `onfido_folded_paper_back_capture_subtitle`
- `onfido_folded_paper_confirmation_title`
- `onfido_upload_photo`
- `onfido_retake_photo`

## Onfido iOS SDK 16.0.0 Migration Guide

### Strings

The following string keys have been **added**:
- `onfido_blur_detection_title`
- `onfido_blur_detection_subtitle`
- `onfido_label_doc_type_generic_up`
- `onfido_mrz_not_detected_title`
- `onfido_mrz_not_detected_subtitle`
- `onfido_face_not_detected_title`
- `onfido_face_not_detected_subtitle`
- `onfido_face_not_detected_subtitle_folded_paper_document`

### Breaking API changes

- New document type added: `generic`

- The way to configure SDK for document types has been changed for Objective-C Interface

Driving Licence (United Kingdom) document capture:

```
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
NSError *documentVariantError = NULL;
DocumentConfigBuilder *documentVariantBuilder = [ONDocumentTypeVariantConfig builder];
[documentVariantBuilder withDrivingLicence];
ONDocumentTypeVariantConfig *documentStepVariant = [documentVariantBuilder buildAndReturnError: &documentVariantError];
[configBuilder withDocumentStepOfType:documentStepVariant andCountryCode:@"GBR"];
```


Generic (United Kingdom) document capture:

```
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
NSError *documentVariantError = NULL;
DocumentConfigBuilder *documentVariantBuilder = [ONDocumentTypeVariantConfig builder];
[documentVariantBuilder withGenericWithConfig: NULL];
ONDocumentTypeVariantConfig *documentStepVariant = [documentVariantBuilder buildAndReturnError: &documentVariantError];
[configBuilder withDocumentStepOfType:documentStepVariant andCountryCode:@"GBR"];
```

## Onfido iOS SDK 15.0.0 Migration Guide

### Changed

- Carthage json file name was changed. Please check the [README](https://github.com/onfido/onfido-ios-sdk#using-carthage) for the details.

## Onfido iOS SDK 14.0.0-rc Migration Guide

### Requirements

- Xcode 11.0.0

## Onfido iOS SDK 14.0.0-beta Migration Guide

### Requirements

- Xcode 11.0.0 beta 7
- iOS 10+

### Removed

- iOS 9 support
- `Onfido-Release` no longer supported

## Onfido iOS SDK 13.2.0 Migration Guide

### Strings

The following string keys have been **added**:
- `onfido_autocapture_manual_fallback_title`
- `onfido_autocapture_manual_fallback_description`

The following string keys have been **updated**:
- `onfido_message_visa_capture_subtitle` (french only)
- `onfido_autocapture_manual_fallback_title` (french only)
- `onfido_autocapture_manual_fallback_description` (french only)
- `onfido_accessibility_video_play` (french only)

The following string keys have been **removed**:
- `onfido_autocapture_info`
- `onfido_press_button_capture`
- `onfido_submit_my_picture`

## Onfido iOS SDK 13.1.0 Migration Guide

### Removed

- `withUSDLAutocapture` method on OnfidoConfig.
  - this was an experimental feature and is not considered a breaking api change
  - US driving license autocapture is now default feature when user selects Driving License as document and United States as country.

### Strings

The following string values for keys have been **changed**:
- `onfido_label_doc_type_driving_license_up` (english)
- `onfido_message_document_passport` (english)
- `onfido_glare_detected_title` (english)
- `onfido_liveness_challenge_turn_left_title` (english)
- `onfido_liveness_challenge_turn_right_title` (english)
- `onfido_liveness_fetch_challenge_error_title` (english)
- `onfido_welcome_view_face_capture_title` (spanish)
- `onfido_liveness_preparation_subtitle` (spanish)
- `onfido_message_document_passport` (spanish)
- `onfido_message_side_document_front_driving_license` (spanish)
- `onfido_message_document_capture_info_front_driving_license` (spanish)
- `onfido_message_side_document_back_driving_license` (spanish)
- `onfido_message_document_capture_info_back_driving_license` (spanish)
- `onfido_message_side_document_front_residence_permit` (spanish)
- `onfido_message_document_capture_info_front_residence_permit` (spanish)
- `onfido_message_side_document_back_residence_permit` (spanish)
- `onfido_message_document_capture_info_back_residence_permit` (spanish)
- `onfido_message_side_document_front_national_id` (spanish)
- `onfido_message_document_capture_info_front_national_id` (spanish)
- `onfido_message_side_document_back_national_id` (spanish)
- `onfido_message_document_capture_info_back_national_id` (spanish)
- `onfido_message_side_document_front_generic` (spanish)
- `onfido_message_document_capture_info_front_generic` (spanish)
- `onfido_message_document_capture_info_back_generic` (spanish)
- `onfido_message_check_readability_subtitle_passport` (spanish)
- `onfido_message_check_readability_subtitle_residence_permit` (spanish)
- `onfido_message_check_readability_subtitle_driving_license` (spanish)
- `onfido_message_check_readability_subtitle_national_id` (spanish)
- `onfido_message_check_readability_subtitle_visa` (spanish)
- `onfido_message_check_readability_subtitle_generic` (spanish)
- `onfido_confirm_national_id` (spanish)
- `onfido_confirm_face_2` (spanish)
- `onfido_no_face` (spanish)
- `onfido_message_validation_error_face` (spanish)
- `onfido_multiple_faces` (spanish)
- `onfido_message_validation_error_multiple_faces` (spanish)
- `onfido_liveness_preparation_subtitle` (spanish)
- `onfido_liveness_timeout_exceeded_title` (spanish)
- `onfido_retake_video` (spanish)
- `onfido_discard` (spanish)
- `onfido_decline` (spanish)

## Onfido iOS SDK 13.0.0 Migration Guide

### Breaking API changes

- Introduced two new enum case for OnfidoConfigError:
  - OnfidoConfigError.multipleTokenTypes (ONFlowConfigErrorMultipleTokenTypes for Objective-C): This error will be thrown when both an SDK Token and a Mobile Tokens are provided.
  - OnfidoConfigError.applicantProvidedWithSDKToken (ONFlowConfigErrorApplicantProvidedWithSDKToken for Objective-C): This error will be thrown when both an SDK Token and an applicant provided.

## Onfido iOS SDK 12.1.0 Migration Guide

### Strings

The following string keys have been **added**:
- `onfido_liveness_fetch_challenge_error_title`
- `onfido_liveness_fetch_challenge_error_description`
- `onfido_liveness_fetch_challenge_error_button_title`

The following string keys have been **removed**:
- `onfido_liveness_challenge_open_mouth_title`

## Onfido iOS SDK 12.0.0 Migration Guide

### Breaking API changes

- Face capture with photo variant:

```
let configBuilder = OnfidoConfig.builder()
...
configBuilder.withFaceStep(ofVariant: .photo(with: nil))
```

- Face capture with video variant (showing liveness intro video):

```
let configBuilder = OnfidoConfig.builder()
...
configBuilder.withFaceStep(ofVariant: .video(with: nil))
```

or

```
let configBuilder = OnfidoConfig.builder()
...
configBuilder.withFaceStep(ofVariant: .video(with: VideoStepConfiguration(showIntroVideo: true)))
```

- Face capture with video variant (not showing liveness intro video):

```
let configBuilder = OnfidoConfig.builder()
...
configBuilder.withFaceStep(ofVariant: .video(with: VideoStepConfiguration(showIntroVideo: false)))
```

#### Objective-C Interface

- Face capture with photo variant:

```
 NSError * error = NULL;
 ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
 ...
 Builder * variantBuilder = [ONFaceStepVariantConfig builder];
 [variantBuilder withPhotoCaptureWithConfig: NULL];
 [configBuilder withFaceStepOfVariant: [variantBuilder buildAndReturnError: &error]];
```

- Face capture with video variant:

```
NSError * error = NULL;
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
...
Builder * variantBuilder = [ONFaceStepVariantConfig builder];
[variantBuilder withVideoCaptureWithConfig: NULL];
[configBuilder withFaceStepOfVariant: [variantBuilder buildAndReturnError: &error]];
```

or

```
NSError * error = NULL;
ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
...
Builder * variantBuilder = [ONFaceStepVariantConfig builder];
[variantBuilder withVideoCaptureWithConfig: NULL];
[configBuilder withFaceStepOfVariant: [variantBuilder buildAndReturnError: &error]];

```

## Onfido iOS SDK 11.1.2 Migration Guide

### Strings

The following string keys have been **removed**:
- `onfido_back`
- `onfido_next_step`

The following string keys have been **added**:
- `onfido_accessibility_liveness_intro_video_pause`
- `onfido_accessibility_liveness_intro_video_play`

## Onfido iOS SDK 11.1.0 Migration Guide

### Deprecated

- `Onfido-Release` framework is deprecated and will be removed in a future version of the Onfido SDK.

If using Cocoapods change `Podfile` from:
```ruby
pod 'Onfido', :configurations => ['Debug']
pod 'Onfido-Release', :configurations => ['Release']
```
to:
```ruby
pod 'Onfido'
```

For manual installation add a Run Script Phase to your app `Build Phases` after `Embed Frameworks` step with the following code:
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

### Strings

The following string keys have been **removed**:
- `onfido_back`
- `onfido_next_step`

## Onfido iOS SDK 11.0.0 Migration Guide

### Requirements

- Xcode 10.2

### Strings

The following string keys have been **added**:
- `onfido_wrong_side`
- `onfido_device_permission_title_both`
- `onfido_device_permission_subtitle_both`
- `onfido_device_permission_instructions_both`
- `onfido_device_permission_btn_title_both`
- `onfido_device_permission_title_camera`
- `onfido_device_permission_subtitle_camera`
- `onfido_device_permission_instructions_camera`
- `onfido_device_permission_btn_title_camera`
- `onfido_device_permission_title_mic`
- `onfido_device_permission_subtitle_mic`
- `onfido_device_permission_instructions_mic`
- `onfido_device_permission_btn_title_mic`
- `onfido_message_uploading`
- `onfido_label_doc_type_work_permit_up`
- `onfido_message_side_document_front_generic`
- `onfido_message_document_capture_info_front_generic`
- `onfido_message_side_document_back_generic`
- `onfido_message_document_capture_info_back_generic`
- `onfido_message_check_readability_subtitle_work_permit`
- `onfido_confirm_generic_document`

## Onfido iOS SDK 10.6.0 Migration Guide

## Onfido iOS SDK 10.5.0 Migration Guide

### Strings

The following string keys have been **added**:
- `onfido_start`
- `onfido_welcome_view_title`
- `onfido_welcome_view_time`
- `onfido_welcome_view_document_capture_title`
- `onfido_welcome_view_face_capture_title`
- `onfido_welcome_view_liveness_capture_title`
- `onfido_capture_face_subtitle`
- `onfido_capture_face_step_1`
- `onfido_capture_face_step_2`

The following string keys have been **changed**:
- `onfido_country_selection_toolbar_title`
- `onfido_unsupported_document_description`

The following string keys have been **removed**:
- `onfido_liveness_challenge_next`
- `onfido_liveness_challenge_stop`
- `onfido_liveness_challenge_recording`

## Onfido iOS SDK 10.4.0 Migration Guide

### Strings

The following string keys have been **added**:
- `onfido_liveness_intro_subtitle`
- `onfido_reload`
- `onfido_unable_load_unstable_network`
- `onfido_liveness_intro_step_1_title`
- `onfido_liveness_intro_step_2_title`
- `onfido_welcome_view_liveness_capture_title`
- `onfido_liveness_intro_loading_video`

The following string keys have been **removed**:
- `onfido_liveness_intro_title`
- `onfido_liveness_intro_fourth_subtitle`

## Onfido iOS SDK 10.3.0 Migration Guide

## Onfido iOS SDK 10.2.0 Migration Guide

### Strings

The following string keys have been **added**:
- `onfido_accessibility_camera_capture_shutter`
- `onfido_accessibility_liveness_start_record`
- `onfido_accessibility_liveness_end_record`
- `onfido_accessibility_liveness_next_challenge`
- `onfido_label_doc_type_visa_up`
- `onfido_message_document_visa`
- `onfido_message_visa_capture_subtitle`
- `onfido_message_check_readability_subtitle_visa`
- `onfido_confirm_visa`

## Onfido iOS SDK 10.1.0 Migration Guide

## Onfido iOS SDK 10.0.0 Migration Guide

### Requirements

- Xcode 10.0
- Swift 3.4 or Swift 4.2

### Strings **removed**:
- `onfido_privacy_policy_title`
- `onfido_privacy_policy_position_doc`
- `onfido_privacy_policy_avoid_light`
- `onfido_privacy_policy_terms_extended`
- `onfido_start`

## Onfido SDK 9.0.0 Migration Guide

### Results objects

In version 9.0.0 we have brought some changes to the api response object (appended with `Result`).

- `ApplicantResult`'s `id`, `href`, `firstName` and `lastName` properties are no longer optional.
- `FaceResults`'s `id`, `href` and `createdAt` (renamed `created_at`) properties are no longer optional.
- Results properties now camel-cased instead of snake-cased.
- Results objects, except those preappended with `ON`, no longer inherit from `NSObject`.

### Simulator support

Version 9.0.0 now supports running the SDK on the simulator for which the integrator has no longer to handle `OnfidoFlowError.deviceHasNoCamera`, which is the reason that it has been deleted.

### Strings

With this release we have brought a breaking change **only for customised languages integrators**.

The following string keys has been **removed**:
- `onfido_message_check_readability_title`
- `onfido_message_confirm_face_title`

## Onfido SDK 8.0.0 Migration Guide

### Deployment target

Version 8.0.0 raises the minimum iOS version from 8.0 to 9.0. If you are still using version iOS 8.0 then you must now check if the running iOS version is at least 9.0 before invoking Onfido SDK. You can do it using the following:

```
if #available(iOS 9.0, *) {
    // call onfido here
} else {
    // can't verify user
}
```
Alternatively you can use a `guard`:

```
guard #available(iOS 9.0, *) else {
    // can't verify user
}
```

### Flow dismissal

With this release we have brought a breaking change for all integrations. The default behaviour now is upon completion of the flow (user cancels, error occurs or user goes through the whole flow), the flow will dismiss itself. You can still maintain previous behaviour and dismiss the flow at your convenience by setting `dismissFlowOnCompletion` argument to false on the method call `with(responseHandler: _, shouldDismissFlowOnCompletion: _)`. For example:

#### Swift

```
OnfidoFlow(withConfiguration: config)
.with(responseHandler: { /* handle response */ }, dismissFlowOnCompletion: false)
.run()
```

#### Objective-C

```
ONFlow *onFlow = [[ONFlow alloc] initWithFlowConfiguration:config];
void (^responseHandler)(ONFlowResponse *response) = ^(ONFlowResponse *response) {
    // handle response
};
[onFlow withResponseHandler:responseHandler dismissFlowOnCompletion:false];
```

### Strings

The following string keys have been **removed**:
- `onfido_document_selection_cancel`

The following string keys have been **added**:
- `onfido_locale`

## Onfido SDK 7.2.0 Migration Guide

With this release we have brought a breaking change **only for customised languages integrators**.

The following string keys has been **added**:
- `"onfido_barcode_error_title"`
- `"onfido_barcode_error_subtitle"`
- `"onfido_barcode_error_third_title"`
- `"onfido_error_dialog_title"`
- `"onfido_error_connection_message"`
- `"onfido_suggested_country"`
- `"onfido_all_countries"`
- `"onfido_country_selection_toolbar_title"`
- `"onfido_unsupported_document_title"`
- `"onfido_unsupported_document_description"`
- `"onfido_select_another_document"`
- `"onfido_close"`

## Onfido SDK 7.1.0 Migration Guide

With this release we have brought a breaking change **only for customised languages integrators**.

We have **added** the following string keys:
- `"onfido_document_selection_title"`
- `"onfido_document_selection_subtitle"`

We have **removed** the following string keys:
- `"onfido_document_selection_message"`


## Onfido SDK 7.0.0 Migration Guide

With this release we have brought a breaking change **only for customised languages integrators**.

**Note**: The string custom translation version scheme has changed, going forward if the strings translations change it will result in a MINOR version change, therefore you are responsible for testing your translated layout in case you are using custom translations.

We have **added** the following string keys:
- `"onfido_no_document"`
- `"onfido_no_face"`
- `"onfido_multiple_faces"`
- `"onfido_message_validation_error_document"`
- `"onfido_message_validation_error_face"`

We have **removed** the following string keys:
- `"onfido_no_document_error_message"`
- `"onfido_message_validation_error_no_face"`

Please update your custom languages accordingly. Otherwise the language will fallback to English by default.

## Onfido SDK 6.0.0 Migration Guide

This version is mainly an upgrade to the compiled SDK form. In order to use this version check out the requirements below.

### Requirements

- Xcode 9.3
- Swift 3.3 or Swift 4.1

### Breaking API changes

There are no breaking api changes in terms of coding.

## Onfido SDK 5.6.0 Migration Guide

With this release we have brought minor memory management improvements to the Objective-C integrator. You are no longer required to hold a strong reference to `ONFlow` instance during the flow execution.

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
    .withDocumentStep(ofType: .drivingLicence(config: DrivingLicenceConfiguration(country: "GBR"))) // document type step with pre-selection
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
