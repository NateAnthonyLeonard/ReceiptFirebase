/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/type/matcher/string.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#if COCOAPODS==1
  #include  "third_party/upb/upb/msg.h"
#else
  #include  "upb/msg.h"
#endif
#if COCOAPODS==1
  #include  "src/core/ext/upb-generated/envoy/type/matcher/string.upb.h"
#else
  #include  "envoy/type/matcher/string.upb.h"
#endif
#if COCOAPODS==1
  #include  "src/core/ext/upb-generated/envoy/type/matcher/regex.upb.h"
#else
  #include  "envoy/type/matcher/regex.upb.h"
#endif
#if COCOAPODS==1
  #include  "src/core/ext/upb-generated/envoy/annotations/deprecation.upb.h"
#else
  #include  "envoy/annotations/deprecation.upb.h"
#endif
#if COCOAPODS==1
  #include  "src/core/ext/upb-generated/udpa/annotations/status.upb.h"
#else
  #include  "udpa/annotations/status.upb.h"
#endif
#if COCOAPODS==1
  #include  "src/core/ext/upb-generated/validate/validate.upb.h"
#else
  #include  "validate/validate.upb.h"
#endif

#if COCOAPODS==1
  #include  "third_party/upb/upb/port_def.inc"
#else
  #include  "upb/port_def.inc"
#endif

static const upb_msglayout *const envoy_type_matcher_StringMatcher_submsgs[1] = {
  &envoy_type_matcher_RegexMatcher_msginit,
};

static const upb_msglayout_field envoy_type_matcher_StringMatcher__fields[6] = {
  {1, UPB_SIZE(4, 8), UPB_SIZE(-13, -25), 0, 9, 1},
  {2, UPB_SIZE(4, 8), UPB_SIZE(-13, -25), 0, 9, 1},
  {3, UPB_SIZE(4, 8), UPB_SIZE(-13, -25), 0, 9, 1},
  {4, UPB_SIZE(4, 8), UPB_SIZE(-13, -25), 0, 9, 1},
  {5, UPB_SIZE(4, 8), UPB_SIZE(-13, -25), 0, 11, 1},
  {6, UPB_SIZE(0, 0), 0, 0, 8, 1},
};

const upb_msglayout envoy_type_matcher_StringMatcher_msginit = {
  &envoy_type_matcher_StringMatcher_submsgs[0],
  &envoy_type_matcher_StringMatcher__fields[0],
  UPB_SIZE(16, 32), 6, false,
};

static const upb_msglayout *const envoy_type_matcher_ListStringMatcher_submsgs[1] = {
  &envoy_type_matcher_StringMatcher_msginit,
};

static const upb_msglayout_field envoy_type_matcher_ListStringMatcher__fields[1] = {
  {1, UPB_SIZE(0, 0), 0, 0, 11, 3},
};

const upb_msglayout envoy_type_matcher_ListStringMatcher_msginit = {
  &envoy_type_matcher_ListStringMatcher_submsgs[0],
  &envoy_type_matcher_ListStringMatcher__fields[0],
  UPB_SIZE(4, 8), 1, false,
};

#if COCOAPODS==1
  #include  "third_party/upb/upb/port_undef.inc"
#else
  #include  "upb/port_undef.inc"
#endif

