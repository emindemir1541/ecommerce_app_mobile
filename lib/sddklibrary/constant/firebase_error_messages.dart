class FirebaseErrorMessages {
  static const errorFirebaseAdminRestrictedOperation = "This operation is restricted to administrators only.";
  static const errorFirebaseArgumentError = "";
  static const errorFirebaseAppNotAuthorized = "This app, identified by the domain where it's hosted, is not authorized to use Firebase Authentication with the provided API key. Review your key configuration in the Google API console.";
  static const errorFirebaseAppNotInstalled = "The requested mobile application corresponding to the identifier (Android package name or iOS bundle ID) provided is not installed on this device.";
  static const errorFirebaseCaptchaCheckFailed = "The reCAPTCHA response token provided is either invalid, expired, already used or the domain associated with it does not match the list of whitelisted domains.";
  static const errorFirebaseCodeExpired = "The SMS code has expired. Please re-send the verification code to try again.";
  static const errorFirebaseCordovaNotReady = "Cordova framework is not ready.";
  static const errorFirebaseCorsUnsupported = "This browser is not supported.";
  static const errorFirebaseCredentialAlreadyInUse = "This credential is already associated with a different user account.";
  static const errorFirebaseCustomTokenMismatch = "The custom token corresponds to a different audience.";
  static const errorFirebaseRequiresRecentLogin = "This operation is sensitive and requires recent authentication. Log in again before retrying this request.";
  static const errorFirebaseDynamicLinkNotActivated = "Please activate Dynamic Links in the Firebase Console and agree to the terms and conditions.";
  static const errorFirebaseEmailChangeNeedsVerification = "Multi-factor users must always have a verified email.";
  static const errorFirebaseEmailAlreadyInUse = "The email address is already in use by another account.";
  static const errorFirebaseExpiredActionCode = "The action code has expired. ";
  static const errorFirebaseCancelledPopupRequest = "This operation has been cancelled due to another conflicting popup being opened.";
  static const errorFirebaseInternalError = "An internal error has occurred.";
  static const errorFirebaseInvalidAppCredential = "The phone verification request contains an invalid application verifier. The reCAPTCHA token response is either invalid or expired.";
  static const errorFirebaseInvalidAppId = "The mobile app identifier is not registed for the current project.";
  static const errorFirebaseInvalidUserToken = "This user's credential isn't valid for this project. This can happen if the user's token has been tampered with, or if the user isn't for the project associated with this API key.";
  static const errorFirebaseInvalidAuthEvent = "An internal error has occurred.";
  static const errorFirebaseInvalidVerificationCode = "The SMS verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.";
  static const errorFirebaseInvalidContinueUri = "The continue URL provided in the request is invalid.";
  static const errorFirebaseInvalidCordovaConfiguration = "The following Cordova plugins must be installed to enable OAuth sign-in: cordova-plugin-buildinfo, cordova-universal-links-plugin, cordova-plugin-browsertab, cordova-plugin-inappbrowser and cordova-plugin-customurlscheme.";
  static const errorFirebaseInvalidCustomToken = "The custom token format is incorrect. Please check the documentation.";
  static const errorFirebaseInvalidDynamicLinkDomain = "The provided dynamic link domain is not configured or authorized for the current project.";
  static const errorFirebaseInvalidEmail = "The email address is badly formatted.";
  static const errorFirebaseInvalidApiKey = "Your API key is invalid, please check you have copied it correctly.";
  static const errorFirebaseInvalidCertHash = "The SHA-1 certificate hash provided is invalid.";
  static const errorFirebaseInvalidCredential = "The supplied auth credential is malformed or has expired.";
  static const errorFirebaseInvalidMessagePayload = "The email template corresponding to this action contains invalid characters in its message. Please fix by going to the Auth email templates section in the Firebase Console.";
  static const errorFirebaseInvalidMultiFactorSession = "The request does not contain a valid proof of first factor successful sign-in.";
  static const errorFirebaseInvalidOauthProvider = "EmailAuthProvider is not supported for this operation. This operation only supports OAuth providers.";
  static const errorFirebaseInvalidOauthClientId = "The OAuth client ID provided is either invalid or does not match the specified API key.";
  static const errorFirebaseUnauthorizedDomain = "This domain is not authorized for OAuth operations for your Firebase project. Edit the list of authorized domains from the Firebase console.";
  static const errorFirebaseInvalidActionCode = "The action code is invalid. This can happen if the code is malformed, expired, or has already been used.";
  static const errorFirebaseWrongPassword = "The password is invalid or the user does not have a password.";
  static const errorFirebaseInvalidPersistenceType = "The specified persistence type is invalid. It can only be local, session or none.";
  static const errorFirebaseInvalidPhoneNumber = "The format of the phone number provided is incorrect. Please enter the phone number in a format that can be parsed into E.164 format. E.164 phone numbers are written in the format [+][country code][subscriber number including area code].";
  static const errorFirebaseInvalidProviderId = "The specified provider ID is invalid.";
  static const errorFirebaseInvalidRecipientEmail = "The email corresponding to this action failed to send as the provided recipient email address is invalid.";
  static const errorFirebaseInvalidSender = "The email template corresponding to this action contains an invalid sender email or name. Please fix by going to the Auth email templates section in the Firebase Console.";
  static const errorFirebaseInvalidVerificationId = "The verification ID used to create the phone auth credential is invalid.";
  static const errorFirebaseInvalidTenantId = "The Auth instance's tenant ID is invalid.";
  static const errorFirebaseMultiFactorInfoNotFound = "The user does not have a second factor matching the identifier provided.";
  static const errorFirebaseMultiFactorAuthRequired = "Proof of ownership of a second factor is required to complete sign-in.";
  static const errorFirebaseMissingAndroidPkgName = "An Android Package Name must be provided if the Android App is required to be installed.";
  static const errorFirebaseAuthDomainConfigRequired = "Be sure to include authDomain when calling firebase.initializeApp(), by following the instructions in the Firebase console.";
  static const errorFirebaseMissingAppCredential = "The phone verification request is missing an application verifier assertion. A reCAPTCHA response token needs to be provided.";
  static const errorFirebaseMissingVerificationCode = "The phone auth credential was created with an empty SMS verification code.";
  static const errorFirebaseMissingContinueUri = "A continue URL must be provided in the request.";
  static const errorFirebaseMissingIframeStart = "An internal error has occurred.";
  static const errorFirebaseMissingIosBundleId = "An iOS Bundle ID must be provided if an App Store ID is provided.";
  static const errorFirebaseMissingMultiFactorInfo = "No second factor identifier is provided.";
  static const errorFirebaseMissingMultiFactorSession = "The request is missing proof of first factor successful sign-in.";
  static const errorFirebaseMissingOrInvalidNonce = "The request does not contain a valid nonce. This can occur if the SHA-256 hash of the provided raw nonce does not match the hashed nonce in the ID token payload.";
  static const errorFirebaseMissingPhoneNumber = "To send verification codes, provide a phone number for the recipient.";
  static const errorFirebaseMissingVerificationId = "The phone auth credential was created with an empty verification ID.";
  static const errorFirebaseAppDeleted = "This instance of FirebaseApp has been deleted.";
  static const errorFirebaseAccountExistsWithDifferentCredential = "An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.";
  static const errorFirebaseNetworkRequestFailed = "A network error (such as timeout, interrupted connection or unreachable host) has occurred.";
  static const errorFirebaseNoAuthEvent = "An internal error has occurred.";
  static const errorFirebaseNoSuchProvider = "User was not linked to an account with the given provider.";
  static const errorFirebaseNullUser = "A null user object was provided as the argument for an operation which requires a non-null user object.";
  static const errorFirebaseOperationNotAllowed = "The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.";
  static const errorFirebaseOperationNotSupportedInThisEnvironment = "This operation is not supported in the environment this application is running on. \"location.protocol\" must be http, https or chrome-extension and web storage must be enabled.";
  static const errorFirebasePopupBlocked = "Unable to establish a connection with the popup. It may have been blocked by the browser.";
  static const errorFirebasePopupClosedByUser = "The popup has been closed by the user before finalizing the operation.";
  static const errorFirebaseProviderAlreadyLinked = "User can only be linked to one identity for the given provider.";
  static const errorFirebaseQuotaExceeded = "The project's quota for this operation has been exceeded.";
  static const errorFirebaseRedirectCancelledByUser = "The redirect operation has been cancelled by the user before finalizing.";
  static const errorFirebaseRedirectOperationPending = "A redirect sign-in operation is already pending.";
  static const errorFirebaseRejectedCredential = "The request contains malformed or mismatching credentials.";
  static const errorFirebaseSecondFactorAlreadyInUse = "The second factor is already enrolled on this account.";
  static const errorFirebaseMaximumSecondFactorCountExceeded = "The maximum allowed number of second factors on a user has been exceeded.";
  static const errorFirebaseTenantIdMismatch = "The provided tenant ID does not match the Auth instance's tenant ID";
  static const errorFirebaseTimeout = "The operation has timed out.";
  static const errorFirebaseUserTokenExpired = "The user's credential is no longer valid. The user must sign in again.";
  static const errorFirebaseTooManyRequests = "We have blocked all requests from this device due to unusual activity. Try again later.";
  static const errorFirebaseUnauthorizedContinueUri = "The domain of the continue URL is not whitelisted.  Please whitelist the domain in the Firebase console.";
  static const errorFirebaseUnsupportedFirstFactor = "Enrolling a second factor or signing in with a multi-factor account requires sign-in with a supported first factor.";
  static const errorFirebaseUnsupportedPersistenceType = "The current environment does not support the specified persistence type.";
  static const errorFirebaseUnsupportedTenantOperation = "This operation is not supported in a multi-tenant context.";
  static const errorFirebaseUnverifiedEmail = "The operation requires a verified email.";
  static const errorFirebaseUserCancelled = "The user did not grant your application the permissions it requested.";
  static const errorFirebaseUserNotFound = "There is no user record corresponding to this identifier. The user may have been deleted.";
  static const errorFirebaseUserDisabled = "The user account has been disabled by an administrator.";
  static const errorFirebaseUserMismatch = "The supplied credentials do not correspond to the previously signed in user.";
  static const errorFirebaseUserSignedOut = "";
  static const errorFirebaseWeakPassword = "The password must be 6 characters long or more.";
  static const errorFirebaseWebStorageUnsupported = "This browser is not supported or 3rd party cookies and data may be disabled.";
}