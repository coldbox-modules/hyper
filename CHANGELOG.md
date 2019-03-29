# v2.1.0
## 29 Mar 2019 — 08:04:09 UTC

### chore

+ __build:__ Replace periodic failing GPG key
 ([f3baea9](https://github.com/coldbox-modules/hyper/commit/f3baea9bd7adc7b79b97cbdc904e1beecb48f441))

### feat

+ __HttpClient:__ Allow for pluggable HTTP Clients ([ad833b9](https://github.com/coldbox-modules/hyper/commit/ad833b96f0624d9d2bb997616dd87aa2cf5d9803))


# v2.0.2
## 31 Oct 2018 — 18:20:32 UTC

### fix

+ __HyperRequest:__  Avoid double encoding using cfhttpparam ([f25bc86](https://github.com/coldbox-modules/hyper/commit/f25bc86fef6f265e33d23912e13722e897bd1d5d))


# v2.0.1
## 23 Oct 2018 — 21:40:42 UTC

### docs

+ __README:__ Remove Lucee 4.5 support from docs ([3abe4f8](https://github.com/coldbox-modules/hyper/commit/3abe4f847146b38b7c5ee81d1a05e63735791200))


# v2.0.0
## 23 Oct 2018 — 21:27:14 UTC

### BREAKING

+ __HyperRequest:__ Do not include username & password unless they have values ([dcd2270](https://github.com/coldbox-modules/hyper/commit/dcd2270e6ddabfd83f22eeb76176f5194122aca4))

### chore

+ __test:__ Add Adobe 2018 to Travis CI ([14506b6](https://github.com/coldbox-modules/hyper/commit/14506b6e76a81f4bf5f2f6d287d0068d3af04218))

### fix

+ __CHANGELOG:__ Correct changelog for 2.0.0 ([a25648e](https://github.com/coldbox-modules/hyper/commit/a25648e1cdfb08b785ef0bcac3dd7d14d62b482b))


# v2.0.0
## 23 Oct 2018 — 19:44:23 UTC

### chore

+ __test:__ Add Adobe 2018 to Travis CI ([14506b6](https://github.com/coldbox-modules/hyper/commit/14506b6e76a81f4bf5f2f6d287d0068d3af04218))

### fix

+ __HyperRequest:__ Do not include username & password unless they have values ([dcd2270](https://github.com/coldbox-modules/hyper/commit/dcd2270e6ddabfd83f22eeb76176f5194122aca4))


# v1.15.0
## 19 Jul 2018 — 03:24:45 UTC

### feat

+ __HyperRequest:__ Add throw on error flag ([bf05152](https://github.com/coldbox-modules/hyper/commit/bf051520eb90f9b917cf1d705cc594f5342b1d5e))


# v1.14.5
## 14 May 2018 — 18:35:29 UTC

### fix

+ __HyperResponse:__ Use 504 status code for incomplete responses. ([589a6c6](https://github.com/coldbox-modules/hyper/commit/589a6c6f60e00c628fbf0952e4d16f5bc6281866))


# v1.14.4
## 20 Apr 2018 — 22:38:10 UTC

### fix

+ __HyperRequest:__ Include equal signs in query param values ([abc36be](https://github.com/coldbox-modules/hyper/commit/abc36be58f725ba24bfe4d99f1e3b17c071ba868))


# 24 Jan 2018

### other

+ __\*:__ Merge tag 'v1.14.2' ([f01681b](https://github.com/coldbox-modules/hyper/commit/f01681bcb8ea081b20345278cffd847701b1403b))


# 24 Jan 2018

### other

+ __\*:__ Merge tag 'v1.14.1' ([33165c2](https://github.com/coldbox-modules/hyper/commit/33165c255010c4edbf345263817142323acdefb0))


# 24 Jan 2018

### other

+ __\*:__ Merge tag 'v1.14.0' ([4b5f2a9](https://github.com/coldbox-modules/hyper/commit/4b5f2a93f10afca5e944409233b09e37443b14e7))


# 23 Jan 2018

### chore

+ __box.json:__ Migrate to coldbox-modules organization ([c16a9a4](https://github.com/coldbox-modules/hyper/commit/c16a9a43b9b29bb89f6f5d1f28424509810dbb91))
+ __box.json:__ Update description ([1c7f268](https://github.com/coldbox-modules/hyper/commit/1c7f268586afce87dcaadf1d8e5ae1b202079957))
+ __release:__ Enable semantic release ([39e9ebd](https://github.com/coldbox-modules/hyper/commit/39e9ebd7406e8c7d5b59161be0e3d110861f6fa2))

### doc

+ __docblocks:__ Update the docblock for data in HyperBuilder ([a33ef95](https://github.com/coldbox-modules/hyper/commit/a33ef958be48eb3c3379eb8f2e8658363464c9de))

### docs

+ __README:__ Fix Travis CI link ([d4785e4](https://github.com/coldbox-modules/hyper/commit/d4785e43d6beffe975ca7f5d533b9a427913a0c4))
+ __HyperRequest:__ Add missing docblocks ([8f6a3b5](https://github.com/coldbox-modules/hyper/commit/8f6a3b5ee386be872e2f69ac3857a498ab329dd2))
+ __README:__ Add initial documentation ([9104e89](https://github.com/coldbox-modules/hyper/commit/9104e89b1092d1865ede837bf1e43766bf6fc21e))
+ __docblocks:__ Update docblocks for HyperBuilder, HyperRequest, and HyperResponse ([6eb0087](https://github.com/coldbox-modules/hyper/commit/6eb0087f6d160beda89cc309daeaba3103a5afb2))

### feat

+ __HyperRequest:__ Add a when helper to execute conditions without breaking chaining. ([b8ec096](https://github.com/coldbox-modules/hyper/commit/b8ec096e9e61a7253cd8dd3bb9d1d8eac1c95111))
+ __HyperRequest:__ Clear out any configured values of the HyperRequest. ([ca13e6f](https://github.com/coldbox-modules/hyper/commit/ca13e6fd4173cfb307150163d17b59a26cc73309))
+ __HyperRequest:__ Add configurable timeout ([929abeb](https://github.com/coldbox-modules/hyper/commit/929abebe7c39f3e038ea1322c739809e0fa781cd))

### fix

+ __box.json:__ Fix line endings ([102ee22](https://github.com/coldbox-modules/hyper/commit/102ee2268d685a5ea9f2c90b7d9df94990b6873f))
+ __box.json:__ Use * as default version to avoid installation issues (again) ([d2b32ff](https://github.com/coldbox-modules/hyper/commit/d2b32ff0f98bdf573ff091f49420f96303da3e4f))
+ __box.json:__ Use latest as default version to avoid installation issues ([4c56adc](https://github.com/coldbox-modules/hyper/commit/4c56adcadfacc9b8ff0d2905c24eec8773bd07ba))
+ __box.json:__ Use * as default version to avoid installation issues ([c0b5294](https://github.com/coldbox-modules/hyper/commit/c0b52945429b82939241f1f75db838ebb24a7a85))
+ __HyperRequest:__ Missing semicolon ([484fa87](https://github.com/coldbox-modules/hyper/commit/484fa87ab52e8ff817264d6b871c824d15a4bc22))
+ __HyperRequest:__ Fix for Lucee 4 compatibility on LinkedHashMaps and keyArray ([a8b64de](https://github.com/coldbox-modules/hyper/commit/a8b64deea9e423b1f77c346315789a94926ee74d))
+ __HyperRequest:__ Preserve case in header names ([59c3349](https://github.com/coldbox-modules/hyper/commit/59c33493f5b740b6448b61198583a9928ee9910c))
+ __HyperRequest:__ Preserve case for query parameters ([617f5db](https://github.com/coldbox-modules/hyper/commit/617f5dbeb1c9a00cf6ba9dc771c130fe684afe13))
+ __HyperRequest:__ Serialize both params from the url and set on the HyperRequest ([7e960a0](https://github.com/coldbox-modules/hyper/commit/7e960a0a4caeeb14c200955d001f5ae4344da3ec))
+ __HyperResponse:__ Default to UTF-8 charset if none is present in the response. ([9587100](https://github.com/coldbox-modules/hyper/commit/958710027a9cde725583f5e9025ca84f05bb719d))
+ __HyperRequest:__ Fix withHeaders and withQueryParams for Lucee compatibility ([26d5628](https://github.com/coldbox-modules/hyper/commit/26d56285fc7bff0a83195d8e3b7a9044e4fdd643))
+ __HyperBuilder:__ Only map HyperBuilder as a singleton in WireBox ([e5556f7](https://github.com/coldbox-modules/hyper/commit/e5556f7c76c5de7859c909fe99678b41973570a8))

### other

+ __\*:__ Trigger build ([46ae862](https://github.com/coldbox-modules/hyper/commit/46ae86286921dce105b95f5e8f626ee5c2d6c73b))
+ __\*:__ 1.3.0 ([293bdc4](https://github.com/coldbox-modules/hyper/commit/293bdc4ce19547d63a384815459db979d90e3b76))
+ __\*:__ 1.3.0 ([a9f939b](https://github.com/coldbox-modules/hyper/commit/a9f939b9ec13ac074b11a733f25ecad04940c7c7))
+ __\*:__ 1.3.0 ([a66c31a](https://github.com/coldbox-modules/hyper/commit/a66c31a88242ff9e75a2c93a6b359347c5e2e75e))
+ __\*:__ 1.0.0 ([215fb05](https://github.com/coldbox-modules/hyper/commit/215fb0594debfb3d7d16710416deaff34d929952))
+ __\*:__ Docblocks for HyperBuilder ([18c4cb2](https://github.com/coldbox-modules/hyper/commit/18c4cb2bebaf087ba5f0cedfaceeff30973c7105))
+ __\*:__ Add PUT, PATCH, and DELETE method shortcuts ([f79694b](https://github.com/coldbox-modules/hyper/commit/f79694b0e4a60d58ffa85b3b6eb4837764478a7f))
+ __\*:__ Add basic auth ([dc90012](https://github.com/coldbox-modules/hyper/commit/dc90012270599267ff993700d32df7d683cc4eca))
+ __\*:__ Rename makeRequest to send ([05041b5](https://github.com/coldbox-modules/hyper/commit/05041b53c640a83b118f1fc2895cb48c4b32e8da))
+ __\*:__ Serialize query params ([9072a48](https://github.com/coldbox-modules/hyper/commit/9072a48bd633c08c4ab75d66c4a4c448b92840b8))
+ __\*:__ Add withHeaders method to set multiple headers at once ([f4adf3e](https://github.com/coldbox-modules/hyper/commit/f4adf3ec034bf36ec23eb0493bbe17af7d51b52e))
+ __\*:__ Pass on any init arguments to builder to the default request ([03a05a3](https://github.com/coldbox-modules/hyper/commit/03a05a3a3c03cf1ddd5781a5974e779a8fa6086b))
+ __\*:__ Allow defaults to be set on the HyperBuilder that appear on each request ([ab034ca](https://github.com/coldbox-modules/hyper/commit/ab034ca58da30a632ccbf070e167fd9d3f9f74ad))
+ __\*:__ Refactor to use internal api instead of external one ([9f21e88](https://github.com/coldbox-modules/hyper/commit/9f21e887f954980490718b08ded528ba807f8354))
+ __\*:__ Add status code detection to the response class ([abbdd70](https://github.com/coldbox-modules/hyper/commit/abbdd70206fe611c6c7ac13799695a20b9a9315a))
+ __\*:__ Begin README ([61cd67c](https://github.com/coldbox-modules/hyper/commit/61cd67c51ca89aa1a674da6ecd626fb3fe8722b8))
+ __\*:__ Default engine to the most restrictive engine we support. ([54eed06](https://github.com/coldbox-modules/hyper/commit/54eed068b45153bf1fbe3d61f89ef1e82c9d06b1))
+ __\*:__ Switch ColdBox to be a devDependency ([2871bc6](https://github.com/coldbox-modules/hyper/commit/2871bc6b588201a523b85531c5f172462c8479fb))
+ __\*:__ Add in missing coldbox dependency ([cefb604](https://github.com/coldbox-modules/hyper/commit/cefb604a42f2e3d9701db18095b00d2524f36759))
+ __\*:__ Some refactoring and fixes for ACF. ([08dc986](https://github.com/coldbox-modules/hyper/commit/08dc986511b568a110d3d811f15ba820982e631d))
+ __\*:__ Allow for POST requests ([77a28ee](https://github.com/coldbox-modules/hyper/commit/77a28ee793e8e31938eb87509132fd8e298b1f0a))
+ __\*:__ Handle redirects and store the request on the response ([c1f6b33](https://github.com/coldbox-modules/hyper/commit/c1f6b3310d5799b8a71c83f12194eb41902c28c6))
+ __\*:__ It passes through all other methods to the HyperRequest class. ([ccfd213](https://github.com/coldbox-modules/hyper/commit/ccfd213fc9c1258fc87de571f83d4a7ca8fb4069))
+ __\*:__ Throw an exception when trying to deserialize data to json that is not json ([7030d38](https://github.com/coldbox-modules/hyper/commit/7030d385d3e28406ed29c1430e1a68d986837a80))
+ __\*:__ Make a basic GET request with Hyper! ([005edfd](https://github.com/coldbox-modules/hyper/commit/005edfd52518b5dfc081b78e46f83b79ec3bd85a))


# 23 Jan 2018

### chore

+ __box.json:__ Migrate to coldbox-modules organization ([c16a9a4](https://github.com/coldbox-modules/hyper/commit/c16a9a43b9b29bb89f6f5d1f28424509810dbb91))
+ __box.json:__ Update description ([1c7f268](https://github.com/coldbox-modules/hyper/commit/1c7f268586afce87dcaadf1d8e5ae1b202079957))
+ __release:__ Enable semantic release ([39e9ebd](https://github.com/coldbox-modules/hyper/commit/39e9ebd7406e8c7d5b59161be0e3d110861f6fa2))

### doc

+ __docblocks:__ Update the docblock for data in HyperBuilder ([a33ef95](https://github.com/coldbox-modules/hyper/commit/a33ef958be48eb3c3379eb8f2e8658363464c9de))

### docs

+ __HyperRequest:__ Add missing docblocks ([8f6a3b5](https://github.com/coldbox-modules/hyper/commit/8f6a3b5ee386be872e2f69ac3857a498ab329dd2))
+ __README:__ Add initial documentation ([9104e89](https://github.com/coldbox-modules/hyper/commit/9104e89b1092d1865ede837bf1e43766bf6fc21e))
+ __docblocks:__ Update docblocks for HyperBuilder, HyperRequest, and HyperResponse ([6eb0087](https://github.com/coldbox-modules/hyper/commit/6eb0087f6d160beda89cc309daeaba3103a5afb2))

### feat

+ __HyperRequest:__ Add a when helper to execute conditions without breaking chaining. ([b8ec096](https://github.com/coldbox-modules/hyper/commit/b8ec096e9e61a7253cd8dd3bb9d1d8eac1c95111))
+ __HyperRequest:__ Clear out any configured values of the HyperRequest. ([ca13e6f](https://github.com/coldbox-modules/hyper/commit/ca13e6fd4173cfb307150163d17b59a26cc73309))
+ __HyperRequest:__ Add configurable timeout ([929abeb](https://github.com/coldbox-modules/hyper/commit/929abebe7c39f3e038ea1322c739809e0fa781cd))

### fix

+ __box.json:__ Use * as default version to avoid installation issues (again) ([d2b32ff](https://github.com/coldbox-modules/hyper/commit/d2b32ff0f98bdf573ff091f49420f96303da3e4f))
+ __box.json:__ Use latest as default version to avoid installation issues ([4c56adc](https://github.com/coldbox-modules/hyper/commit/4c56adcadfacc9b8ff0d2905c24eec8773bd07ba))
+ __box.json:__ Use * as default version to avoid installation issues ([c0b5294](https://github.com/coldbox-modules/hyper/commit/c0b52945429b82939241f1f75db838ebb24a7a85))
+ __HyperRequest:__ Missing semicolon ([484fa87](https://github.com/coldbox-modules/hyper/commit/484fa87ab52e8ff817264d6b871c824d15a4bc22))
+ __HyperRequest:__ Fix for Lucee 4 compatibility on LinkedHashMaps and keyArray ([a8b64de](https://github.com/coldbox-modules/hyper/commit/a8b64deea9e423b1f77c346315789a94926ee74d))
+ __HyperRequest:__ Preserve case in header names ([59c3349](https://github.com/coldbox-modules/hyper/commit/59c33493f5b740b6448b61198583a9928ee9910c))
+ __HyperRequest:__ Preserve case for query parameters ([617f5db](https://github.com/coldbox-modules/hyper/commit/617f5dbeb1c9a00cf6ba9dc771c130fe684afe13))
+ __HyperRequest:__ Serialize both params from the url and set on the HyperRequest ([7e960a0](https://github.com/coldbox-modules/hyper/commit/7e960a0a4caeeb14c200955d001f5ae4344da3ec))
+ __HyperResponse:__ Default to UTF-8 charset if none is present in the response. ([9587100](https://github.com/coldbox-modules/hyper/commit/958710027a9cde725583f5e9025ca84f05bb719d))
+ __HyperRequest:__ Fix withHeaders and withQueryParams for Lucee compatibility ([26d5628](https://github.com/coldbox-modules/hyper/commit/26d56285fc7bff0a83195d8e3b7a9044e4fdd643))
+ __HyperBuilder:__ Only map HyperBuilder as a singleton in WireBox ([e5556f7](https://github.com/coldbox-modules/hyper/commit/e5556f7c76c5de7859c909fe99678b41973570a8))

### other

+ __\*:__ Trigger build ([46ae862](https://github.com/coldbox-modules/hyper/commit/46ae86286921dce105b95f5e8f626ee5c2d6c73b))
+ __\*:__ 1.3.0 ([293bdc4](https://github.com/coldbox-modules/hyper/commit/293bdc4ce19547d63a384815459db979d90e3b76))
+ __\*:__ 1.3.0 ([a9f939b](https://github.com/coldbox-modules/hyper/commit/a9f939b9ec13ac074b11a733f25ecad04940c7c7))
+ __\*:__ 1.3.0 ([a66c31a](https://github.com/coldbox-modules/hyper/commit/a66c31a88242ff9e75a2c93a6b359347c5e2e75e))
+ __\*:__ 1.0.0 ([215fb05](https://github.com/coldbox-modules/hyper/commit/215fb0594debfb3d7d16710416deaff34d929952))
+ __\*:__ Docblocks for HyperBuilder ([18c4cb2](https://github.com/coldbox-modules/hyper/commit/18c4cb2bebaf087ba5f0cedfaceeff30973c7105))
+ __\*:__ Add PUT, PATCH, and DELETE method shortcuts ([f79694b](https://github.com/coldbox-modules/hyper/commit/f79694b0e4a60d58ffa85b3b6eb4837764478a7f))
+ __\*:__ Add basic auth ([dc90012](https://github.com/coldbox-modules/hyper/commit/dc90012270599267ff993700d32df7d683cc4eca))
+ __\*:__ Rename makeRequest to send ([05041b5](https://github.com/coldbox-modules/hyper/commit/05041b53c640a83b118f1fc2895cb48c4b32e8da))
+ __\*:__ Serialize query params ([9072a48](https://github.com/coldbox-modules/hyper/commit/9072a48bd633c08c4ab75d66c4a4c448b92840b8))
+ __\*:__ Add withHeaders method to set multiple headers at once ([f4adf3e](https://github.com/coldbox-modules/hyper/commit/f4adf3ec034bf36ec23eb0493bbe17af7d51b52e))
+ __\*:__ Pass on any init arguments to builder to the default request ([03a05a3](https://github.com/coldbox-modules/hyper/commit/03a05a3a3c03cf1ddd5781a5974e779a8fa6086b))
+ __\*:__ Allow defaults to be set on the HyperBuilder that appear on each request ([ab034ca](https://github.com/coldbox-modules/hyper/commit/ab034ca58da30a632ccbf070e167fd9d3f9f74ad))
+ __\*:__ Refactor to use internal api instead of external one ([9f21e88](https://github.com/coldbox-modules/hyper/commit/9f21e887f954980490718b08ded528ba807f8354))
+ __\*:__ Add status code detection to the response class ([abbdd70](https://github.com/coldbox-modules/hyper/commit/abbdd70206fe611c6c7ac13799695a20b9a9315a))
+ __\*:__ Begin README ([61cd67c](https://github.com/coldbox-modules/hyper/commit/61cd67c51ca89aa1a674da6ecd626fb3fe8722b8))
+ __\*:__ Default engine to the most restrictive engine we support. ([54eed06](https://github.com/coldbox-modules/hyper/commit/54eed068b45153bf1fbe3d61f89ef1e82c9d06b1))
+ __\*:__ Switch ColdBox to be a devDependency ([2871bc6](https://github.com/coldbox-modules/hyper/commit/2871bc6b588201a523b85531c5f172462c8479fb))
+ __\*:__ Add in missing coldbox dependency ([cefb604](https://github.com/coldbox-modules/hyper/commit/cefb604a42f2e3d9701db18095b00d2524f36759))
+ __\*:__ Some refactoring and fixes for ACF. ([08dc986](https://github.com/coldbox-modules/hyper/commit/08dc986511b568a110d3d811f15ba820982e631d))
+ __\*:__ Allow for POST requests ([77a28ee](https://github.com/coldbox-modules/hyper/commit/77a28ee793e8e31938eb87509132fd8e298b1f0a))
+ __\*:__ Handle redirects and store the request on the response ([c1f6b33](https://github.com/coldbox-modules/hyper/commit/c1f6b3310d5799b8a71c83f12194eb41902c28c6))
+ __\*:__ It passes through all other methods to the HyperRequest class. ([ccfd213](https://github.com/coldbox-modules/hyper/commit/ccfd213fc9c1258fc87de571f83d4a7ca8fb4069))
+ __\*:__ Throw an exception when trying to deserialize data to json that is not json ([7030d38](https://github.com/coldbox-modules/hyper/commit/7030d385d3e28406ed29c1430e1a68d986837a80))
+ __\*:__ Make a basic GET request with Hyper! ([005edfd](https://github.com/coldbox-modules/hyper/commit/005edfd52518b5dfc081b78e46f83b79ec3bd85a))
+ __\*:__ Initial commit ([de0c27d](https://github.com/coldbox-modules/hyper/commit/de0c27d2d0602cb7566b3639196c6d79d5a53bd1))


# 23 Jan 2018

### chore

+ __box.json:__ Migrate to coldbox-modules organization ([c16a9a4](https://github.com/coldbox-modules/hyper/commit/c16a9a43b9b29bb89f6f5d1f28424509810dbb91))
+ __box.json:__ Update description ([1c7f268](https://github.com/coldbox-modules/hyper/commit/1c7f268586afce87dcaadf1d8e5ae1b202079957))
+ __release:__ Enable semantic release ([39e9ebd](https://github.com/coldbox-modules/hyper/commit/39e9ebd7406e8c7d5b59161be0e3d110861f6fa2))

### doc

+ __docblocks:__ Update the docblock for data in HyperBuilder ([a33ef95](https://github.com/coldbox-modules/hyper/commit/a33ef958be48eb3c3379eb8f2e8658363464c9de))

### docs

+ __HyperRequest:__ Add missing docblocks ([8f6a3b5](https://github.com/coldbox-modules/hyper/commit/8f6a3b5ee386be872e2f69ac3857a498ab329dd2))
+ __README:__ Add initial documentation ([9104e89](https://github.com/coldbox-modules/hyper/commit/9104e89b1092d1865ede837bf1e43766bf6fc21e))
+ __docblocks:__ Update docblocks for HyperBuilder, HyperRequest, and HyperResponse ([6eb0087](https://github.com/coldbox-modules/hyper/commit/6eb0087f6d160beda89cc309daeaba3103a5afb2))

### feat

+ __HyperRequest:__ Add a when helper to execute conditions without breaking chaining. ([b8ec096](https://github.com/coldbox-modules/hyper/commit/b8ec096e9e61a7253cd8dd3bb9d1d8eac1c95111))
+ __HyperRequest:__ Clear out any configured values of the HyperRequest. ([ca13e6f](https://github.com/coldbox-modules/hyper/commit/ca13e6fd4173cfb307150163d17b59a26cc73309))
+ __HyperRequest:__ Add configurable timeout ([929abeb](https://github.com/coldbox-modules/hyper/commit/929abebe7c39f3e038ea1322c739809e0fa781cd))

### fix

+ __box.json:__ Use * as default version to avoid installation issues (again) ([d2b32ff](https://github.com/coldbox-modules/hyper/commit/d2b32ff0f98bdf573ff091f49420f96303da3e4f))
+ __box.json:__ Use latest as default version to avoid installation issues ([4c56adc](https://github.com/coldbox-modules/hyper/commit/4c56adcadfacc9b8ff0d2905c24eec8773bd07ba))
+ __box.json:__ Use * as default version to avoid installation issues ([c0b5294](https://github.com/coldbox-modules/hyper/commit/c0b52945429b82939241f1f75db838ebb24a7a85))
+ __HyperRequest:__ Missing semicolon ([484fa87](https://github.com/coldbox-modules/hyper/commit/484fa87ab52e8ff817264d6b871c824d15a4bc22))
+ __HyperRequest:__ Fix for Lucee 4 compatibility on LinkedHashMaps and keyArray ([a8b64de](https://github.com/coldbox-modules/hyper/commit/a8b64deea9e423b1f77c346315789a94926ee74d))
+ __HyperRequest:__ Preserve case in header names ([59c3349](https://github.com/coldbox-modules/hyper/commit/59c33493f5b740b6448b61198583a9928ee9910c))
+ __HyperRequest:__ Preserve case for query parameters ([617f5db](https://github.com/coldbox-modules/hyper/commit/617f5dbeb1c9a00cf6ba9dc771c130fe684afe13))
+ __HyperRequest:__ Serialize both params from the url and set on the HyperRequest ([7e960a0](https://github.com/coldbox-modules/hyper/commit/7e960a0a4caeeb14c200955d001f5ae4344da3ec))
+ __HyperResponse:__ Default to UTF-8 charset if none is present in the response. ([9587100](https://github.com/coldbox-modules/hyper/commit/958710027a9cde725583f5e9025ca84f05bb719d))
+ __HyperRequest:__ Fix withHeaders and withQueryParams for Lucee compatibility ([26d5628](https://github.com/coldbox-modules/hyper/commit/26d56285fc7bff0a83195d8e3b7a9044e4fdd643))
+ __HyperBuilder:__ Only map HyperBuilder as a singleton in WireBox ([e5556f7](https://github.com/coldbox-modules/hyper/commit/e5556f7c76c5de7859c909fe99678b41973570a8))

### other

+ __\*:__ Trigger build ([46ae862](https://github.com/coldbox-modules/hyper/commit/46ae86286921dce105b95f5e8f626ee5c2d6c73b))
+ __\*:__ 1.3.0 ([293bdc4](https://github.com/coldbox-modules/hyper/commit/293bdc4ce19547d63a384815459db979d90e3b76))
+ __\*:__ 1.3.0 ([a9f939b](https://github.com/coldbox-modules/hyper/commit/a9f939b9ec13ac074b11a733f25ecad04940c7c7))
+ __\*:__ 1.3.0 ([a66c31a](https://github.com/coldbox-modules/hyper/commit/a66c31a88242ff9e75a2c93a6b359347c5e2e75e))
+ __\*:__ 1.0.0 ([215fb05](https://github.com/coldbox-modules/hyper/commit/215fb0594debfb3d7d16710416deaff34d929952))
+ __\*:__ Docblocks for HyperBuilder ([18c4cb2](https://github.com/coldbox-modules/hyper/commit/18c4cb2bebaf087ba5f0cedfaceeff30973c7105))
+ __\*:__ Add PUT, PATCH, and DELETE method shortcuts ([f79694b](https://github.com/coldbox-modules/hyper/commit/f79694b0e4a60d58ffa85b3b6eb4837764478a7f))
+ __\*:__ Add basic auth ([dc90012](https://github.com/coldbox-modules/hyper/commit/dc90012270599267ff993700d32df7d683cc4eca))
+ __\*:__ Rename makeRequest to send ([05041b5](https://github.com/coldbox-modules/hyper/commit/05041b53c640a83b118f1fc2895cb48c4b32e8da))
+ __\*:__ Serialize query params ([9072a48](https://github.com/coldbox-modules/hyper/commit/9072a48bd633c08c4ab75d66c4a4c448b92840b8))
+ __\*:__ Add withHeaders method to set multiple headers at once ([f4adf3e](https://github.com/coldbox-modules/hyper/commit/f4adf3ec034bf36ec23eb0493bbe17af7d51b52e))
+ __\*:__ Pass on any init arguments to builder to the default request ([03a05a3](https://github.com/coldbox-modules/hyper/commit/03a05a3a3c03cf1ddd5781a5974e779a8fa6086b))
+ __\*:__ Allow defaults to be set on the HyperBuilder that appear on each request ([ab034ca](https://github.com/coldbox-modules/hyper/commit/ab034ca58da30a632ccbf070e167fd9d3f9f74ad))
+ __\*:__ Refactor to use internal api instead of external one ([9f21e88](https://github.com/coldbox-modules/hyper/commit/9f21e887f954980490718b08ded528ba807f8354))
+ __\*:__ Add status code detection to the response class ([abbdd70](https://github.com/coldbox-modules/hyper/commit/abbdd70206fe611c6c7ac13799695a20b9a9315a))
+ __\*:__ Begin README ([61cd67c](https://github.com/coldbox-modules/hyper/commit/61cd67c51ca89aa1a674da6ecd626fb3fe8722b8))
+ __\*:__ Default engine to the most restrictive engine we support. ([54eed06](https://github.com/coldbox-modules/hyper/commit/54eed068b45153bf1fbe3d61f89ef1e82c9d06b1))
+ __\*:__ Switch ColdBox to be a devDependency ([2871bc6](https://github.com/coldbox-modules/hyper/commit/2871bc6b588201a523b85531c5f172462c8479fb))
+ __\*:__ Add in missing coldbox dependency ([cefb604](https://github.com/coldbox-modules/hyper/commit/cefb604a42f2e3d9701db18095b00d2524f36759))
+ __\*:__ Some refactoring and fixes for ACF. ([08dc986](https://github.com/coldbox-modules/hyper/commit/08dc986511b568a110d3d811f15ba820982e631d))
+ __\*:__ Allow for POST requests ([77a28ee](https://github.com/coldbox-modules/hyper/commit/77a28ee793e8e31938eb87509132fd8e298b1f0a))
+ __\*:__ Handle redirects and store the request on the response ([c1f6b33](https://github.com/coldbox-modules/hyper/commit/c1f6b3310d5799b8a71c83f12194eb41902c28c6))
+ __\*:__ It passes through all other methods to the HyperRequest class. ([ccfd213](https://github.com/coldbox-modules/hyper/commit/ccfd213fc9c1258fc87de571f83d4a7ca8fb4069))
+ __\*:__ Throw an exception when trying to deserialize data to json that is not json ([7030d38](https://github.com/coldbox-modules/hyper/commit/7030d385d3e28406ed29c1430e1a68d986837a80))
+ __\*:__ Make a basic GET request with Hyper! ([005edfd](https://github.com/coldbox-modules/hyper/commit/005edfd52518b5dfc081b78e46f83b79ec3bd85a))
+ __\*:__ Initial commit ([de0c27d](https://github.com/coldbox-modules/hyper/commit/de0c27d2d0602cb7566b3639196c6d79d5a53bd1))


# 23 Jan 2018

### chore

+ __box.json:__ Migrate to coldbox-modules organization ([c16a9a4](https://github.com/coldbox-modules/hyper/commit/c16a9a43b9b29bb89f6f5d1f28424509810dbb91))
+ __box.json:__ Update description ([1c7f268](https://github.com/coldbox-modules/hyper/commit/1c7f268586afce87dcaadf1d8e5ae1b202079957))
+ __release:__ Enable semantic release ([39e9ebd](https://github.com/coldbox-modules/hyper/commit/39e9ebd7406e8c7d5b59161be0e3d110861f6fa2))

### doc

+ __docblocks:__ Update the docblock for data in HyperBuilder ([a33ef95](https://github.com/coldbox-modules/hyper/commit/a33ef958be48eb3c3379eb8f2e8658363464c9de))

### docs

+ __HyperRequest:__ Add missing docblocks ([8f6a3b5](https://github.com/coldbox-modules/hyper/commit/8f6a3b5ee386be872e2f69ac3857a498ab329dd2))
+ __README:__ Add initial documentation ([9104e89](https://github.com/coldbox-modules/hyper/commit/9104e89b1092d1865ede837bf1e43766bf6fc21e))
+ __docblocks:__ Update docblocks for HyperBuilder, HyperRequest, and HyperResponse ([6eb0087](https://github.com/coldbox-modules/hyper/commit/6eb0087f6d160beda89cc309daeaba3103a5afb2))

### feat

+ __HyperRequest:__ Add a when helper to execute conditions without breaking chaining. ([b8ec096](https://github.com/coldbox-modules/hyper/commit/b8ec096e9e61a7253cd8dd3bb9d1d8eac1c95111))
+ __HyperRequest:__ Clear out any configured values of the HyperRequest. ([ca13e6f](https://github.com/coldbox-modules/hyper/commit/ca13e6fd4173cfb307150163d17b59a26cc73309))
+ __HyperRequest:__ Add configurable timeout ([929abeb](https://github.com/coldbox-modules/hyper/commit/929abebe7c39f3e038ea1322c739809e0fa781cd))

### fix

+ __box.json:__ Use * as default version to avoid installation issues (again) ([d2b32ff](https://github.com/coldbox-modules/hyper/commit/d2b32ff0f98bdf573ff091f49420f96303da3e4f))
+ __box.json:__ Use latest as default version to avoid installation issues ([4c56adc](https://github.com/coldbox-modules/hyper/commit/4c56adcadfacc9b8ff0d2905c24eec8773bd07ba))
+ __box.json:__ Use * as default version to avoid installation issues ([c0b5294](https://github.com/coldbox-modules/hyper/commit/c0b52945429b82939241f1f75db838ebb24a7a85))
+ __HyperRequest:__ Missing semicolon ([484fa87](https://github.com/coldbox-modules/hyper/commit/484fa87ab52e8ff817264d6b871c824d15a4bc22))
+ __HyperRequest:__ Fix for Lucee 4 compatibility on LinkedHashMaps and keyArray ([a8b64de](https://github.com/coldbox-modules/hyper/commit/a8b64deea9e423b1f77c346315789a94926ee74d))
+ __HyperRequest:__ Preserve case in header names ([59c3349](https://github.com/coldbox-modules/hyper/commit/59c33493f5b740b6448b61198583a9928ee9910c))
+ __HyperRequest:__ Preserve case for query parameters ([617f5db](https://github.com/coldbox-modules/hyper/commit/617f5dbeb1c9a00cf6ba9dc771c130fe684afe13))
+ __HyperRequest:__ Serialize both params from the url and set on the HyperRequest ([7e960a0](https://github.com/coldbox-modules/hyper/commit/7e960a0a4caeeb14c200955d001f5ae4344da3ec))
+ __HyperResponse:__ Default to UTF-8 charset if none is present in the response. ([9587100](https://github.com/coldbox-modules/hyper/commit/958710027a9cde725583f5e9025ca84f05bb719d))
+ __HyperRequest:__ Fix withHeaders and withQueryParams for Lucee compatibility ([26d5628](https://github.com/coldbox-modules/hyper/commit/26d56285fc7bff0a83195d8e3b7a9044e4fdd643))
+ __HyperBuilder:__ Only map HyperBuilder as a singleton in WireBox ([e5556f7](https://github.com/coldbox-modules/hyper/commit/e5556f7c76c5de7859c909fe99678b41973570a8))

### other

+ __\*:__ Trigger build ([46ae862](https://github.com/coldbox-modules/hyper/commit/46ae86286921dce105b95f5e8f626ee5c2d6c73b))
+ __\*:__ 1.3.0 ([293bdc4](https://github.com/coldbox-modules/hyper/commit/293bdc4ce19547d63a384815459db979d90e3b76))
+ __\*:__ 1.3.0 ([a9f939b](https://github.com/coldbox-modules/hyper/commit/a9f939b9ec13ac074b11a733f25ecad04940c7c7))
+ __\*:__ 1.3.0 ([a66c31a](https://github.com/coldbox-modules/hyper/commit/a66c31a88242ff9e75a2c93a6b359347c5e2e75e))
+ __\*:__ 1.0.0 ([215fb05](https://github.com/coldbox-modules/hyper/commit/215fb0594debfb3d7d16710416deaff34d929952))
+ __\*:__ Docblocks for HyperBuilder ([18c4cb2](https://github.com/coldbox-modules/hyper/commit/18c4cb2bebaf087ba5f0cedfaceeff30973c7105))
+ __\*:__ Add PUT, PATCH, and DELETE method shortcuts ([f79694b](https://github.com/coldbox-modules/hyper/commit/f79694b0e4a60d58ffa85b3b6eb4837764478a7f))
+ __\*:__ Add basic auth ([dc90012](https://github.com/coldbox-modules/hyper/commit/dc90012270599267ff993700d32df7d683cc4eca))
+ __\*:__ Rename makeRequest to send ([05041b5](https://github.com/coldbox-modules/hyper/commit/05041b53c640a83b118f1fc2895cb48c4b32e8da))
+ __\*:__ Serialize query params ([9072a48](https://github.com/coldbox-modules/hyper/commit/9072a48bd633c08c4ab75d66c4a4c448b92840b8))
+ __\*:__ Add withHeaders method to set multiple headers at once ([f4adf3e](https://github.com/coldbox-modules/hyper/commit/f4adf3ec034bf36ec23eb0493bbe17af7d51b52e))
+ __\*:__ Pass on any init arguments to builder to the default request ([03a05a3](https://github.com/coldbox-modules/hyper/commit/03a05a3a3c03cf1ddd5781a5974e779a8fa6086b))
+ __\*:__ Allow defaults to be set on the HyperBuilder that appear on each request ([ab034ca](https://github.com/coldbox-modules/hyper/commit/ab034ca58da30a632ccbf070e167fd9d3f9f74ad))
+ __\*:__ Refactor to use internal api instead of external one ([9f21e88](https://github.com/coldbox-modules/hyper/commit/9f21e887f954980490718b08ded528ba807f8354))
+ __\*:__ Add status code detection to the response class ([abbdd70](https://github.com/coldbox-modules/hyper/commit/abbdd70206fe611c6c7ac13799695a20b9a9315a))
+ __\*:__ Begin README ([61cd67c](https://github.com/coldbox-modules/hyper/commit/61cd67c51ca89aa1a674da6ecd626fb3fe8722b8))
+ __\*:__ Default engine to the most restrictive engine we support. ([54eed06](https://github.com/coldbox-modules/hyper/commit/54eed068b45153bf1fbe3d61f89ef1e82c9d06b1))
+ __\*:__ Switch ColdBox to be a devDependency ([2871bc6](https://github.com/coldbox-modules/hyper/commit/2871bc6b588201a523b85531c5f172462c8479fb))
+ __\*:__ Add in missing coldbox dependency ([cefb604](https://github.com/coldbox-modules/hyper/commit/cefb604a42f2e3d9701db18095b00d2524f36759))
+ __\*:__ Some refactoring and fixes for ACF. ([08dc986](https://github.com/coldbox-modules/hyper/commit/08dc986511b568a110d3d811f15ba820982e631d))
+ __\*:__ Allow for POST requests ([77a28ee](https://github.com/coldbox-modules/hyper/commit/77a28ee793e8e31938eb87509132fd8e298b1f0a))
+ __\*:__ Handle redirects and store the request on the response ([c1f6b33](https://github.com/coldbox-modules/hyper/commit/c1f6b3310d5799b8a71c83f12194eb41902c28c6))
+ __\*:__ It passes through all other methods to the HyperRequest class. ([ccfd213](https://github.com/coldbox-modules/hyper/commit/ccfd213fc9c1258fc87de571f83d4a7ca8fb4069))
+ __\*:__ Throw an exception when trying to deserialize data to json that is not json ([7030d38](https://github.com/coldbox-modules/hyper/commit/7030d385d3e28406ed29c1430e1a68d986837a80))
+ __\*:__ Make a basic GET request with Hyper! ([005edfd](https://github.com/coldbox-modules/hyper/commit/005edfd52518b5dfc081b78e46f83b79ec3bd85a))
+ __\*:__ Initial commit ([de0c27d](https://github.com/coldbox-modules/hyper/commit/de0c27d2d0602cb7566b3639196c6d79d5a53bd1))


# 23 Jan 2018

### fix

+ __box.json:__ Use * as default version to avoid installation issues (again) ([d2b32ff](https://github.com/coldbox-modules/hyper/commit/d2b32ff0f98bdf573ff091f49420f96303da3e4f))
+ __box.json:__ Use latest as default version to avoid installation issues ([4c56adc](https://github.com/coldbox-modules/hyper/commit/4c56adcadfacc9b8ff0d2905c24eec8773bd07ba))
