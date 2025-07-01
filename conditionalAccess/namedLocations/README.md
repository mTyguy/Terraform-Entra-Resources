Named Locations are used to augment Conditional Access policies and provide additional signals for Identity Protection risk based detections.

Named Locations are most commonly used to block access from countries that a particular company does not do business in or restrict user access to apps based on their location. They can also be used as a way to reduce false positive risk detections by proactively declaring that users covered by a specific conditional access policy are expected to login from a specified country. For example, a subset of users residing in country X should have their own conditional access policies that also have a named location of country X.

Named Locations should be used as an additional signal or factor and not as a replacement for MFA. Users should never be excluded from MFA just because they are logging in from a known corporate IP or range or IPs.
