# v8.0.0
## 04 Jun 2024 — 15:33:59 UTC

### BREAKING

+ __CfhttpHttpClient:__ Return more accurate status codes for Bad Gateway and Request Timeout responses ([3e9c2bf](https://github.com/coldbox-modules/hyper/commit/3e9c2bf0aa21aa2b8cacdf2297db6f235f0a989f))
+ __HyperRequest:__ Add `asXML` support ([16dab5e](https://github.com/coldbox-modules/hyper/commit/16dab5ef7f14ebfab72a73dbdefe5e23d57185c2))
+ __HyperRequest:__ Add a debug method to see what the HTTP client generates ([9eae8a7](https://github.com/coldbox-modules/hyper/commit/9eae8a7720d887a67662b5b532ed4f6d1a16e653))
+ __\*:__ feat: Allow adding multiple query params with the same key. ([166a61b](https://github.com/coldbox-modules/hyper/commit/166a61bb23dbb31d5e324509ecdffed0f7ed62fa))
+ __CI:__ Drop support for ColdBox 5 ([1f7296a](https://github.com/coldbox-modules/hyper/commit/1f7296a9a09b85e5929d7bf06dbfd56140aa1165))
+ __HyperResponse:__ Add execution time to response ([96d491f](https://github.com/coldbox-modules/hyper/commit/96d491f44d099d926d410e988e62ba04b3f39e1c))
+ __HyperRequest:__ Do not include username & password unless they have values ([dcd2270](https://github.com/coldbox-modules/hyper/commit/dcd2270e6ddabfd83f22eeb76176f5194122aca4))

### chore

+ __HyperRequest:__ Add missing docblocks
 ([fdc507f](https://github.com/coldbox-modules/hyper/commit/fdc507f67566f5919f1991311232e7b0d5886d9b))
+ __LICENSE:__ Add MIT License file
 ([c321a90](https://github.com/coldbox-modules/hyper/commit/c321a903161beda9c7b04d72c1559d2aedf8502b))
+ __CI:__ Migrate to main branch
 ([65bc774](https://github.com/coldbox-modules/hyper/commit/65bc774c286afea51b81d53c04620d44cb8fe7fa))
+ __CI:__ Do not fail fast on cron job actions ([65b7f47](https://github.com/coldbox-modules/hyper/commit/65b7f47239e3ba26cb4aace1cd313ed80fa46832))
+ __CI:__ Update fetch-depth for tests and release actions
 ([74750bf](https://github.com/coldbox-modules/hyper/commit/74750bfcde399f855b7645a1428ab85380e72851))
+ __CI:__ Attempt to skip committing back changes
 ([0441ab3](https://github.com/coldbox-modules/hyper/commit/0441ab3edac1953841f69f3cc9606f988ffa48a1))
+ __CI:__ Add matrix and cron testing
 ([fcf35a0](https://github.com/coldbox-modules/hyper/commit/fcf35a07765e211dc2ef813c3a0bc6889c45526c))
+ __CI:__ Use better GitHub token
 ([fba0ffa](https://github.com/coldbox-modules/hyper/commit/fba0ffa72af5c9c86b87c9a2b4d0616d3a797ade))
+ __CI:__ Make sure GH_TOKEN is set
 ([46c9ba3](https://github.com/coldbox-modules/hyper/commit/46c9ba32eb56f5c9eed84851261017fe33ab1cc0))
+ __CI:__ Update when FORGEBOX_TOKEN secret is made avaiable
 ([ef98d95](https://github.com/coldbox-modules/hyper/commit/ef98d950500543f84630c9880e3ed37707cd7964))
+ __CI:__ Set entire semantic-release plugins struct
 ([3674433](https://github.com/coldbox-modules/hyper/commit/3674433a9d135f7b77e22fb77a1a519a03b35d0b))
+ __CI:__ Update config set command
 ([591e410](https://github.com/coldbox-modules/hyper/commit/591e410f43c1f434f0fe88c7aa8778f174dea0a6))
+ __CI:__ Remove errant spaces in build script
 ([9f3f08d](https://github.com/coldbox-modules/hyper/commit/9f3f08dd7e502834cd3a2cfdd27f524d2b01a856))
+ __CI:__ Migrate from Travis CI to GitHub Actions ([368c1b3](https://github.com/coldbox-modules/hyper/commit/368c1b3284c72cc6647bfe5f68c1627ad464d2dd))
+ __build:__ Replace periodic failing GPG key
 ([f3baea9](https://github.com/coldbox-modules/hyper/commit/f3baea9bd7adc7b79b97cbdc904e1beecb48f441))
+ __test:__ Add Adobe 2018 to Travis CI ([14506b6](https://github.com/coldbox-modules/hyper/commit/14506b6e76a81f4bf5f2f6d287d0068d3af04218))
+ __box.json:__ Migrate to coldbox-modules organization
 ([c16a9a4](https://github.com/coldbox-modules/hyper/commit/c16a9a43b9b29bb89f6f5d1f28424509810dbb91))
+ __box.json:__ Update description
 ([1c7f268](https://github.com/coldbox-modules/hyper/commit/1c7f268586afce87dcaadf1d8e5ae1b202079957))
+ __release:__ Enable semantic release
 ([39e9ebd](https://github.com/coldbox-modules/hyper/commit/39e9ebd7406e8c7d5b59161be0e3d110861f6fa2))

### doc

+ __docblocks:__ Update the docblock for data in HyperBuilder
 ([a33ef95](https://github.com/coldbox-modules/hyper/commit/a33ef958be48eb3c3379eb8f2e8658363464c9de))

### docs

+ __README:__ Remove Lucee 4.5 support from docs ([3abe4f8](https://github.com/coldbox-modules/hyper/commit/3abe4f847146b38b7c5ee81d1a05e63735791200))
+ __README:__ Fix Travis CI link
 ([d4785e4](https://github.com/coldbox-modules/hyper/commit/d4785e43d6beffe975ca7f5d533b9a427913a0c4))
+ __HyperRequest:__ Add missing docblocks
 ([8f6a3b5](https://github.com/coldbox-modules/hyper/commit/8f6a3b5ee386be872e2f69ac3857a498ab329dd2))
+ __README:__ Add initial documentation
 ([9104e89](https://github.com/coldbox-modules/hyper/commit/9104e89b1092d1865ede837bf1e43766bf6fc21e))
+ __docblocks:__ Update docblocks for HyperBuilder, HyperRequest, and HyperResponse
 ([6eb0087](https://github.com/coldbox-modules/hyper/commit/6eb0087f6d160beda89cc309daeaba3103a5afb2))

### feat

+ __Interceptors:__ Add request to `onHyperResponse` interception point. ([07ca539](https://github.com/coldbox-modules/hyper/commit/07ca539653838a60c36df7b61198e417f75df875))
+ __HyperRequest:__ Add `asBinary` helper method.
 ([98053ed](https://github.com/coldbox-modules/hyper/commit/98053eda1399fe2eb99850e34d329915cc4aa703))
+ __HyperRequest:__ Add retry handling to HyperRequests ([daf90bd](https://github.com/coldbox-modules/hyper/commit/daf90bd8f85ec6287c08909aa24931abe4fc9f2a))
+ __HyperRequest:__ Default to a `HyperCFML/#versionNumber#` User-Agent ([60100c4](https://github.com/coldbox-modules/hyper/commit/60100c4b05b9d7886000f2c631cb338038035269))
+ __HyperBuilder:__ Allow resetting of existing fakes using `resetFakes` ([beab1b7](https://github.com/coldbox-modules/hyper/commit/beab1b7c41ca1d9f5df1aac641a0f6915027aec1))
+ __HyperBuilder:__ Allow faking of requests ([7fb877b](https://github.com/coldbox-modules/hyper/commit/7fb877bb1450d33bafd10fe7762e9bb42a63b82b))
+ __HyperBuilder:__ Allow registering a configured HyperRequest as a custom client ([33348bc](https://github.com/coldbox-modules/hyper/commit/33348bca2218c81b444270c81cfb07e8bbb28f3e))
+ __HyperResponse:__ Add `isCreated` shortcut status check
 ([8d3c169](https://github.com/coldbox-modules/hyper/commit/8d3c16921a2a595b15e4eaf8575594deaebe6284))
+ __HyperRequest:__ Add head and options shortcut methods
 ([c102c15](https://github.com/coldbox-modules/hyper/commit/c102c1525e7ea7d434943f33e1caa895d4fd10a6))
+ __async:__ Add async requests using ColdBox's AsyncManager ([33c4d77](https://github.com/coldbox-modules/hyper/commit/33c4d776af7c70550eab184a23f5ec253caf3237))
+ __HyperRequest:__ Provide more useful error than cfhttp when throwOnErrors is enabled
 ([26eb4d9](https://github.com/coldbox-modules/hyper/commit/26eb4d9fde1e1e50cfd20edcab82a1c41bd3e9c2))
+ __Hyper:__ Provide mementos for HyperRequests and HyperResponses
 ([c360377](https://github.com/coldbox-modules/hyper/commit/c3603774822039754ffbe0d43143e2ed45ca7551))
+ __HyperResponse:__ Capture status text and provide a status convenience string
 ([5ffb774](https://github.com/coldbox-modules/hyper/commit/5ffb774fa8040d8315334d219c91e9df71bb93ec))
+ __HyperResponse:__ Allow for default values in getHeader ([6f193c4](https://github.com/coldbox-modules/hyper/commit/6f193c4bc221dfc1e35d06539d1345c052704e80))
+ __HyperRequest:__ Add `forwardHeaders` shortcut method ([5924787](https://github.com/coldbox-modules/hyper/commit/59247870297088f6493eef42cdda873c4022850d))
+ __HyperResponse:__ Add helper methods for checking for specific status codes ([b428f22](https://github.com/coldbox-modules/hyper/commit/b428f227d8d74e4c9458c47b707ec4ff2b169e5d))
+ __HyperRequest:__ Allowing attaching file uploads to HyperRequests ([0bdd8af](https://github.com/coldbox-modules/hyper/commit/0bdd8af622afe92fbea4e101ef408dc54f771ea5))
+ __HyperResponse:__ Include response data as detail in DeserializeJsonException
 ([6ade42c](https://github.com/coldbox-modules/hyper/commit/6ade42c77cee9cdfe04442c385ed0c4ec76f9257))
+ __HyperRequest:__ Add clone to quickly copy HyperRequests
 ([e280d38](https://github.com/coldbox-modules/hyper/commit/e280d38b5552ce3c6a44a93ec3c980468cfa59c0))
+ __Events:__ Add interceptors and local callbacks for lifecycle events ([3f4dfd1](https://github.com/coldbox-modules/hyper/commit/3f4dfd1d6a65a36b516b0068785f3a292e9123c1))
+ __HyperRequest:__ Add certificate auth ([6e3d335](https://github.com/coldbox-modules/hyper/commit/6e3d3357bf8ee3bd1c14d79a03806d54e299a335))
+ __HyperRequest:__ Add resolveUrls option ([e270d98](https://github.com/coldbox-modules/hyper/commit/e270d98fd076349dc57ad31e64647a125ef13612))
+ __HttpClient:__ Allow for pluggable HTTP Clients ([ad833b9](https://github.com/coldbox-modules/hyper/commit/ad833b96f0624d9d2bb997616dd87aa2cf5d9803))
+ __HyperRequest:__ Add throw on error flag ([bf05152](https://github.com/coldbox-modules/hyper/commit/bf051520eb90f9b917cf1d705cc594f5342b1d5e))
+ __HyperRequest:__ Add a when helper to execute conditions without breaking chaining. ([b8ec096](https://github.com/coldbox-modules/hyper/commit/b8ec096e9e61a7253cd8dd3bb9d1d8eac1c95111))
+ __HyperRequest:__ Clear out any configured values of the HyperRequest.
 ([ca13e6f](https://github.com/coldbox-modules/hyper/commit/ca13e6fd4173cfb307150163d17b59a26cc73309))
+ __HyperRequest:__ Add configurable timeout
 ([929abeb](https://github.com/coldbox-modules/hyper/commit/929abebe7c39f3e038ea1322c739809e0fa781cd))

### fix

+ __FakeHyperResponse:__ Set array back for pass by value semantics ([09ce7d3](https://github.com/coldbox-modules/hyper/commit/09ce7d34a54062b448ab03a14f3b40e70a18b004))
+ __TestBoxMatchers:__ Use `structCount` for Adobe compatibility ([f17fa8c](https://github.com/coldbox-modules/hyper/commit/f17fa8c298c0fbf142bba7ef76fe065b228de1d1))
+ __FakeHyperResponse:__ Add missing semicolon for Adobe ([c3165fc](https://github.com/coldbox-modules/hyper/commit/c3165fc1cda982ffb3722d4d6250642138f76f1f))
+ __CfhttpHttpClient:__ Add an additional fallback status check ([adf9575](https://github.com/coldbox-modules/hyper/commit/adf9575be5b813e42655c19be8bcd5e86dcb8623))
+ __HyperRequest:__ Add a `MissingAsyncManager` type to missing asyncManager exception
 ([18a2fa6](https://github.com/coldbox-modules/hyper/commit/18a2fa69277953220f09435b1424170f41368720))
+ __HyperRequest:__ Fix infinite serialization loop with referrer
 ([8ba6501](https://github.com/coldbox-modules/hyper/commit/8ba65018a7faed4d73e4234ded5e911408c9f0bb))
+ __HyperRequest:__ Handle when body is a string and format is JSON ([3e9e4f9](https://github.com/coldbox-modules/hyper/commit/3e9e4f92bd99e668b710e34e130ed8ab8a177bcf))
+ __HyperRequest:__ Only serializeJSON the body if the bodyFormat is json
 ([4cc0eba](https://github.com/coldbox-modules/hyper/commit/4cc0eba6f9d0a9ab3bd33fa2ff2385b065b3815c))
+ __CfhttpHttpClient:__ Only add authType if a username is set
 ([5007f1f](https://github.com/coldbox-modules/hyper/commit/5007f1fca68b19703793ae031c59d50eadcab476))
+ __HyperRequest:__ Do not prepend the base url when a full url is passed
 ([fd8cfa6](https://github.com/coldbox-modules/hyper/commit/fd8cfa67730591e858204700e22f35c563250a72))
+ __HyperRequest:__ Add `resolveUrls` and `encodeUrl` properties to the memento
 ([1a8f85f](https://github.com/coldbox-modules/hyper/commit/1a8f85feffa22ae88c49d4dec581577e7a0bc1bf))
+ __HyperRequest:__ Correctly set the `encodeUrl` when cloning a request
 ([c996b0f](https://github.com/coldbox-modules/hyper/commit/c996b0f5d3e3c59c00b65faa92140d2715338991))
+ __CFHTTP:__ Convert array values correct when sending form fields ([25383d5](https://github.com/coldbox-modules/hyper/commit/25383d5bc1e8e0338d0ce74d5e95e5aceedf9ebf))
+ __HyperRequest:__ Bug Workaround for Booleans in Query Strings ([b48e629](https://github.com/coldbox-modules/hyper/commit/b48e62947ae8a67d5f7c7010418db140714816ef))
+ __HyperRequest:__  Avoid double encoding using cfhttpparam ([f25bc86](https://github.com/coldbox-modules/hyper/commit/f25bc86fef6f265e33d23912e13722e897bd1d5d))
+ __CHANGELOG:__ Correct changelog for 2.0.0
 ([a25648e](https://github.com/coldbox-modules/hyper/commit/a25648e1cdfb08b785ef0bcac3dd7d14d62b482b))
+ __HyperResponse:__ Use 504 status code for incomplete responses. ([589a6c6](https://github.com/coldbox-modules/hyper/commit/589a6c6f60e00c628fbf0952e4d16f5bc6281866))
+ __HyperRequest:__ Include equal signs in query param values ([abc36be](https://github.com/coldbox-modules/hyper/commit/abc36be58f725ba24bfe4d99f1e3b17c071ba868))
+ __box.json:__ Fix line endings
 ([102ee22](https://github.com/coldbox-modules/hyper/commit/102ee2268d685a5ea9f2c90b7d9df94990b6873f))
+ __box.json:__ Use * as default version to avoid installation issues (again)
 ([d2b32ff](https://github.com/coldbox-modules/hyper/commit/d2b32ff0f98bdf573ff091f49420f96303da3e4f))
+ __box.json:__ Use latest as default version to avoid installation issues
 ([4c56adc](https://github.com/coldbox-modules/hyper/commit/4c56adcadfacc9b8ff0d2905c24eec8773bd07ba))
+ __box.json:__ Use * as default version to avoid installation issues
 ([c0b5294](https://github.com/coldbox-modules/hyper/commit/c0b52945429b82939241f1f75db838ebb24a7a85))
+ __HyperRequest:__ Missing semicolon
 ([484fa87](https://github.com/coldbox-modules/hyper/commit/484fa87ab52e8ff817264d6b871c824d15a4bc22))
+ __HyperRequest:__ Fix for Lucee 4 compatibility on LinkedHashMaps and keyArray
 ([a8b64de](https://github.com/coldbox-modules/hyper/commit/a8b64deea9e423b1f77c346315789a94926ee74d))
+ __HyperRequest:__ Preserve case in header names ([59c3349](https://github.com/coldbox-modules/hyper/commit/59c33493f5b740b6448b61198583a9928ee9910c))
+ __HyperRequest:__ Preserve case for query parameters ([617f5db](https://github.com/coldbox-modules/hyper/commit/617f5dbeb1c9a00cf6ba9dc771c130fe684afe13))
+ __HyperRequest:__ Serialize both params from the url and set on the HyperRequest ([7e960a0](https://github.com/coldbox-modules/hyper/commit/7e960a0a4caeeb14c200955d001f5ae4344da3ec))
+ __HyperResponse:__ Default to UTF-8 charset if none is present in the response.
 ([9587100](https://github.com/coldbox-modules/hyper/commit/958710027a9cde725583f5e9025ca84f05bb719d))
+ __HyperRequest:__ Fix withHeaders and withQueryParams for Lucee compatibility ([26d5628](https://github.com/coldbox-modules/hyper/commit/26d56285fc7bff0a83195d8e3b7a9044e4fdd643))
+ __HyperBuilder:__ Only map HyperBuilder as a singleton in WireBox ([e5556f7](https://github.com/coldbox-modules/hyper/commit/e5556f7c76c5de7859c909fe99678b41973570a8))

### other

+ __\*:__ feat: Add ability to exclude keys from HyperRequest and HyperResponse mementos
 ([b9f9630](https://github.com/coldbox-modules/hyper/commit/b9f9630c890d0ae203822091378f970e25df2aff))
+ __\*:__ docs: Updated misspelled and missing docblocks ([1ba168b](https://github.com/coldbox-modules/hyper/commit/1ba168ba8777e0852300453dfaece01fa92266cb))
+ __\*:__ chore: Pin commandbox-semantic-release to ^3.0.0 ([6136f7d](https://github.com/coldbox-modules/hyper/commit/6136f7d6ca949ae28e441c5b340e3966f65a547d))
+ __\*:__ feat: Add support for cookies to HyperRequest and HyperResponse
 ([ad89b1c](https://github.com/coldbox-modules/hyper/commit/ad89b1ccd012adf740bad10706a70b3422245506))
+ __\*:__ Apply cfformat changes
 ([04aefc0](https://github.com/coldbox-modules/hyper/commit/04aefc0a660f2155510b7c4ac06668753aef29c5))
+ __\*:__ chore: Fix adobe CI support and initial adobe@2023 support
 ([687c342](https://github.com/coldbox-modules/hyper/commit/687c34239e008e66bd5c6ab83b0cf9c3d8e7ccd2))
+ __\*:__ tests: Sort headers since different engines add them differently
 ([7741cb1](https://github.com/coldbox-modules/hyper/commit/7741cb18f286313238c66e7b0e2b27ab4627bd25))
+ __\*:__ Apply cfformat changes
 ([c5d1df1](https://github.com/coldbox-modules/hyper/commit/c5d1df1f4cf963ac8e85d4cd9633b74417cbeaf2))
+ __\*:__ tests: Fix tests by unloading ColdBox between each test file ([13dd8b5](https://github.com/coldbox-modules/hyper/commit/13dd8b5c196042dd6b098320b690913858eb4e48))
+ __\*:__ docs: Update readme for builder initWith headers losing `Content-Type` ([7a80b01](https://github.com/coldbox-modules/hyper/commit/7a80b010727cd6bc91cafdacdb6f42188d6b684b))
+ __\*:__ docs: Fix Hyper Builder Example ([61cd00d](https://github.com/coldbox-modules/hyper/commit/61cd00d1a9467a47ee4ed58c20feb7e33011a614))
+ __\*:__ refactor: Represent query params as an array in order to allow multiple params with the same key ([b422012](https://github.com/coldbox-modules/hyper/commit/b422012af57efdc2b6e24a72fbe7dee372afa270))
+ __\*:__ fix: workaround for CommandBox not having the box:asyncManager injection
 ([f5eeabc](https://github.com/coldbox-modules/hyper/commit/f5eeabc14d7d738d228392ec8f808498d8c74760))
+ __\*:__ fix: Use processState over announce until CommandBox can update
 ([b157ccd](https://github.com/coldbox-modules/hyper/commit/b157ccd5c21deb2cdf729044452228af033fc5d0))
+ __\*:__ fix: Support WireBox without ColdBox ([94009d2](https://github.com/coldbox-modules/hyper/commit/94009d24290e6c687af12eaace8d360b550bcd6c))
+ __\*:__ Interceptors (#23) ([3437fea](https://github.com/coldbox-modules/hyper/commit/3437feaea2a6b9d925e971f288b858e578782c35))
+ __\*:__ docs: Include getFullURL method ([974fb58](https://github.com/coldbox-modules/hyper/commit/974fb587c120e58b4cf5f84e52b7f0190855f278))
+ __\*:__ chore: Formatting with cfformat
 ([0a0b267](https://github.com/coldbox-modules/hyper/commit/0a0b26799eab727485970f5c4f79ee80f016a522))
+ __\*:__ feat: Add support for NTLM authentication ([4ae97bd](https://github.com/coldbox-modules/hyper/commit/4ae97bdedd09983b74c5c8eaa976365cb06a3cf4))
+ __\*:__ docs: Correct "Bulider" to "Builder" ([5c23854](https://github.com/coldbox-modules/hyper/commit/5c23854191db47c8ca0aead3e1dbb93a6bdcd1be))
+ __\*:__ feat: Add withoutEncodingUrl flag ([c7cf713](https://github.com/coldbox-modules/hyper/commit/c7cf713fac943faf1f3b5b7e18858b8adda96f5a))
+ __\*:__ chore: format with cfformat
 ([a887d01](https://github.com/coldbox-modules/hyper/commit/a887d0197f4d5422a4d0332d4ee2663740e729fa))
+ __\*:__ fix: Use previous host for redirect if redirect does not include a full URL
 ([66c2570](https://github.com/coldbox-modules/hyper/commit/66c25703b7c59b0f10cb31d966610dfb3e0698de))
+ __\*:__ chore: Use OpenJDK instead of OracleJDK ([ce9f558](https://github.com/coldbox-modules/hyper/commit/ce9f5581fa4fd8a1e467a28ae9ab2e8c97954920))
+ __\*:__ chore: Use forgeboxStorage ([1d32c19](https://github.com/coldbox-modules/hyper/commit/1d32c19e249585b933c37ac4c7c6924ec8662159))
+ __\*:__ Merge tag 'v1.14.2' ([f01681b](https://github.com/coldbox-modules/hyper/commit/f01681bcb8ea081b20345278cffd847701b1403b))
+ __\*:__ Merge tag 'v1.14.1' ([33165c2](https://github.com/coldbox-modules/hyper/commit/33165c255010c4edbf345263817142323acdefb0))
+ __\*:__ Merge tag 'v1.14.0' ([4b5f2a9](https://github.com/coldbox-modules/hyper/commit/4b5f2a93f10afca5e944409233b09e37443b14e7))
+ __\*:__ Trigger build
 ([46ae862](https://github.com/coldbox-modules/hyper/commit/46ae86286921dce105b95f5e8f626ee5c2d6c73b))
+ __\*:__ 1.3.0 ([293bdc4](https://github.com/coldbox-modules/hyper/commit/293bdc4ce19547d63a384815459db979d90e3b76))
+ __\*:__ 1.3.0 ([a9f939b](https://github.com/coldbox-modules/hyper/commit/a9f939b9ec13ac074b11a733f25ecad04940c7c7))
+ __\*:__ 1.3.0 ([a66c31a](https://github.com/coldbox-modules/hyper/commit/a66c31a88242ff9e75a2c93a6b359347c5e2e75e))
+ __\*:__ 1.0.0 ([215fb05](https://github.com/coldbox-modules/hyper/commit/215fb0594debfb3d7d16710416deaff34d929952))
+ __\*:__ Docblocks for HyperBuilder
 ([18c4cb2](https://github.com/coldbox-modules/hyper/commit/18c4cb2bebaf087ba5f0cedfaceeff30973c7105))
+ __\*:__ Add PUT, PATCH, and DELETE method shortcuts
 ([f79694b](https://github.com/coldbox-modules/hyper/commit/f79694b0e4a60d58ffa85b3b6eb4837764478a7f))
+ __\*:__ Add basic auth
 ([dc90012](https://github.com/coldbox-modules/hyper/commit/dc90012270599267ff993700d32df7d683cc4eca))
+ __\*:__ Rename makeRequest to send
 ([05041b5](https://github.com/coldbox-modules/hyper/commit/05041b53c640a83b118f1fc2895cb48c4b32e8da))
+ __\*:__ Serialize query params
 ([9072a48](https://github.com/coldbox-modules/hyper/commit/9072a48bd633c08c4ab75d66c4a4c448b92840b8))
+ __\*:__ Add withHeaders method to set multiple headers at once
 ([f4adf3e](https://github.com/coldbox-modules/hyper/commit/f4adf3ec034bf36ec23eb0493bbe17af7d51b52e))
+ __\*:__ Pass on any init arguments to builder to the default request
 ([03a05a3](https://github.com/coldbox-modules/hyper/commit/03a05a3a3c03cf1ddd5781a5974e779a8fa6086b))
+ __\*:__ Allow defaults to be set on the HyperBuilder that appear on each request
 ([ab034ca](https://github.com/coldbox-modules/hyper/commit/ab034ca58da30a632ccbf070e167fd9d3f9f74ad))
+ __\*:__ Refactor to use internal api instead of external one
 ([9f21e88](https://github.com/coldbox-modules/hyper/commit/9f21e887f954980490718b08ded528ba807f8354))
+ __\*:__ Add status code detection to the response class
 ([abbdd70](https://github.com/coldbox-modules/hyper/commit/abbdd70206fe611c6c7ac13799695a20b9a9315a))
+ __\*:__ Begin README ([61cd67c](https://github.com/coldbox-modules/hyper/commit/61cd67c51ca89aa1a674da6ecd626fb3fe8722b8))
+ __\*:__ Default engine to the most restrictive engine we support. ([54eed06](https://github.com/coldbox-modules/hyper/commit/54eed068b45153bf1fbe3d61f89ef1e82c9d06b1))
+ __\*:__ Switch ColdBox to be a devDependency
 ([2871bc6](https://github.com/coldbox-modules/hyper/commit/2871bc6b588201a523b85531c5f172462c8479fb))
+ __\*:__ Add in missing coldbox dependency
 ([cefb604](https://github.com/coldbox-modules/hyper/commit/cefb604a42f2e3d9701db18095b00d2524f36759))
+ __\*:__ Some refactoring and fixes for ACF.
 ([08dc986](https://github.com/coldbox-modules/hyper/commit/08dc986511b568a110d3d811f15ba820982e631d))
+ __\*:__ Allow for POST requests
 ([77a28ee](https://github.com/coldbox-modules/hyper/commit/77a28ee793e8e31938eb87509132fd8e298b1f0a))
+ __\*:__ Handle redirects and store the request on the response
 ([c1f6b33](https://github.com/coldbox-modules/hyper/commit/c1f6b3310d5799b8a71c83f12194eb41902c28c6))
+ __\*:__ It passes through all other methods to the HyperRequest class.
 ([ccfd213](https://github.com/coldbox-modules/hyper/commit/ccfd213fc9c1258fc87de571f83d4a7ca8fb4069))
+ __\*:__ Throw an exception when trying to deserialize data to json that is not json
 ([7030d38](https://github.com/coldbox-modules/hyper/commit/7030d385d3e28406ed29c1430e1a68d986837a80))
+ __\*:__ Make a basic GET request with Hyper!
 ([005edfd](https://github.com/coldbox-modules/hyper/commit/005edfd52518b5dfc081b78e46f83b79ec3bd85a))
+ __\*:__ Initial commit ([de0c27d](https://github.com/coldbox-modules/hyper/commit/de0c27d2d0602cb7566b3639196c6d79d5a53bd1))

### tests

+ __CI:__ Add `adobe@2023` to the testing matrix
 ([5bf1260](https://github.com/coldbox-modules/hyper/commit/5bf1260bf5fc59b39cc5fa002519d99ea702ad29))


# v7.5.0
## 18 Mar 2024 — 16:19:44 UTC

### feat

+ __Interceptors:__ Add request to `onHyperResponse` interception point. ([07ca539](https://github.com/coldbox-modules/hyper/commit/07ca539653838a60c36df7b61198e417f75df875))


# v7.4.0
## 02 Feb 2024 — 18:44:17 UTC

### feat

+ __HyperRequest:__ Add `asBinary` helper method.
 ([98053ed](https://github.com/coldbox-modules/hyper/commit/98053eda1399fe2eb99850e34d329915cc4aa703))


# v7.3.0
## 24 Jan 2024 — 20:14:11 UTC

### feat

+ __HyperRequest:__ Add retry handling to HyperRequests ([daf90bd](https://github.com/coldbox-modules/hyper/commit/daf90bd8f85ec6287c08909aa24931abe4fc9f2a))
+ __HyperRequest:__ Default to a `HyperCFML/#versionNumber#` User-Agent ([60100c4](https://github.com/coldbox-modules/hyper/commit/60100c4b05b9d7886000f2c631cb338038035269))
+ __HyperBuilder:__ Allow resetting of existing fakes using `resetFakes` ([beab1b7](https://github.com/coldbox-modules/hyper/commit/beab1b7c41ca1d9f5df1aac641a0f6915027aec1))


# v2.3.5
## 02 Nov 2020 — 21:55:39 UTC

### chore

+ __CI:__ Add matrix and cron testing
 ([fcf35a0](https://github.com/coldbox-modules/hyper/commit/fcf35a07765e211dc2ef813c3a0bc6889c45526c))


# v2.3.4
## 02 Nov 2020 — 21:13:30 UTC

### chore

+ __CI:__ Use better GitHub token
 ([fba0ffa](https://github.com/coldbox-modules/hyper/commit/fba0ffa72af5c9c86b87c9a2b4d0616d3a797ade))


# v2.3.1
## 24 Jun 2020 — 20:15:36 UTC

### fix

+ __HyperRequest:__ Bug Workaround for Booleans in Query Strings ([b48e629](https://github.com/coldbox-modules/hyper/commit/b48e62947ae8a67d5f7c7010418db140714816ef))


# v2.3.0
## 19 Jun 2020 — 20:57:46 UTC

### feat

+ __HyperRequest:__ Add certificate auth ([6e3d335](https://github.com/coldbox-modules/hyper/commit/6e3d3357bf8ee3bd1c14d79a03806d54e299a335))


# v2.2.1
## 04 Jun 2020 — 19:42:40 UTC

### other

+ __\*:__ chore: format with cfformat
 ([a887d01](https://github.com/coldbox-modules/hyper/commit/a887d0197f4d5422a4d0332d4ee2663740e729fa))
+ __\*:__ fix: Use previous host for redirect if redirect does not include a full URL
 ([66c2570](https://github.com/coldbox-modules/hyper/commit/66c25703b7c59b0f10cb31d966610dfb3e0698de))


# v2.2.0
## 20 Apr 2020 — 15:58:35 UTC

### feat

+ __HyperRequest:__ Add resolveUrls option ([e270d98](https://github.com/coldbox-modules/hyper/commit/e270d98fd076349dc57ad31e64647a125ef13612))


# v2.1.1
## 13 Feb 2020 — 18:25:16 UTC

### other

+ __\*:__ chore: Use OpenJDK instead of OracleJDK ([ce9f558](https://github.com/coldbox-modules/hyper/commit/ce9f5581fa4fd8a1e467a28ae9ab2e8c97954920))
+ __\*:__ chore: Use forgeboxStorage ([1d32c19](https://github.com/coldbox-modules/hyper/commit/1d32c19e249585b933c37ac4c7c6924ec8662159))


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
