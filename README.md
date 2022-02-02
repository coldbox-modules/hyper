<h1 style="text-align: center;">hyper</h1>
<p style="text-align: center;">
    <a href="https://forgebox.io/view/hyper"><img src="https://cfmlbadges.monkehworks.com/images/badges/available-on-forgebox.svg" alt="Available on ForgeBox" /></a>
    <img src="https://cfmlbadges.monkehworks.com/images/badges/tested-with-testbox.svg" alt="Tested With TestBox" />
</p>
<p style="text-align: center;">
    <img height="30" src="https://cfmlbadges.monkehworks.com/images/badges/compatibility-coldfusion-11.svg" alt="Compatible with ColdFusion 11" />
    <img height="30" src="https://cfmlbadges.monkehworks.com/images/badges/compatibility-coldfusion-2016.svg" alt="Compatible with ColdFusion 2016" />
    <img height="30" src="https://cfmlbadges.monkehworks.com/images/badges/compatibility-lucee-5.svg" alt="Compatible with Lucee 5" />
</p>
<p style="text-align: center;">
    <a href="https://travis-ci.org/coldbox-modules/hyper"><img src="https://img.shields.io/travis/coldbox-modules/hyper/master.svg?style=flat-square&label=master" alt="Master Branch Build Status"></a>
</p>

## A CFML HTTP Builder

### Inspiration

Hyper was built after coding several API SDK's for various platforms —
[S3SDK](https://github.com/coldbox-modules/s3sdk),
[cbstripe](https://github.com/coldbox-modules/cbox-stripe), and
[cbgithub](https://github.com/elpete/cbgithub), to name a few. I noticed that I
spent a lot of time setting up the plumbing for the requests and a wrapper
around `cfhttp`. Each implementation was mostly the same but slightly different.
It was additionally frustrating because I really only needed to tweak a few
values, usually just the `Authorization` header. It would be nice to create an
HTTP client pre-configured for each of these SDK's. It seemed the perfect fit
for a module.

### The problem it solves

Hyper exists to provide a fluent builder experience for HTTP requests and responses. It also provides a powerful way to create clients, i.e. Builder objects with pre-configured defaults like a base URL or certain headers.

### Requirements

Hyper runs on Adobe ColdFusion 11+ and Lucee 5+.

ColdBox is not required, but mappings are provided for ColdBox users automatically.

### HyperBuilder

The component you will most likely inject is the `HyperBuilder`. This is
commonly aliased as `hyper`.

```js
component {
    property name="hyper" inject="HyperBuilder@Hyper";
}
```

The `HyperBuilder` creates new requests. This can be done in one of two ways:

1. Calling the `new` method will create a new request with the configured
   defaults.
2. Calling any method on `HyperRequest` on the `HyperBuilder` instance will
   create a new request and forward on the method call.

Using the `HyperBuilder` lets you easily create requests with defaults while
also avoiding having to deal with providers directly.

### HyperRequest

Though the `HyperBuilder` is the component you will most likely inject,
`HyperRequest` is the component will you interact with the most. `HyperRequest`
provides a fluent interface to configure your HTTP call.

Example:

```js
hyper.get( "https//api.github.com/users" );

hyper.setMethod( "PUT" )
    .withHeaders( { "Authorization" = "Bearer #token#" } )
    .setUrl( "https://jsonplaceholder.typicode.com/posts/1" )
    .setBody( {
        title: "New Title"
    } )
    .send();
```

#### Request Execution

##### `get`

Execute a GET request.

| Name        | Type   | Required | Default | Description                                                    |
| ----------- | ------ | -------- | ------- | -------------------------------------------------------------- |
| url         | string | false    | null    | An optional URL to set for the request.                        |
| queryParams | struct | false    | null    | An optional struct of query parameters to set for the request. |

##### `post`

Execute a POST request.

| Name | Type   | Required | Default | Description                              |
| ---- | ------ | -------- | ------- | ---------------------------------------- |
| url  | string | false    | null    | An optional URL to set for the request.  |
| body | struct | false    | null    | An optional body to set for the request. |

##### `put`

Execute a PUT request.

| Name | Type   | Required | Default | Description                              |
| ---- | ------ | -------- | ------- | ---------------------------------------- |
| url  | string | false    | null    | An optional URL to set for the request.  |
| body | struct | false    | null    | An optional body to set for the request. |

##### `patch`

Execute a PATCH request.

| Name | Type   | Required | Default | Description                              |
| ---- | ------ | -------- | ------- | ---------------------------------------- |
| url  | string | false    | null    | An optional URL to set for the request.  |
| body | struct | false    | null    | An optional body to set for the request. |

##### `delete`

Execute a DELETE request.

| Name | Type   | Required | Default | Description                              |
| ---- | ------ | -------- | ------- | ---------------------------------------- |
| url  | string | false    | null    | An optional URL to set for the request.  |
| body | struct | false    | null    | An optional body to set for the request. |

##### `send`

Send the HTTP request and return a HyperResponse.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |


#### Request Properties

##### `getRequestId`

Gets the unique request ID representing this request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `getFullURL`

Gets the full URL for the request.

| Name            | Type    | Required | Default | Description                                            |
| --------------- | ------- | -------- | ------- | ------------------------------------------------------ |
| withQueryString | boolean | false    | false   | Includes the configured query string with the full URL |

##### `getBaseURL`

Gets the base URL for the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setBaseURL`

Sets the base URL for the request.

| Name  | Type   | Required | Default | Description                                                   |
| ----- | ------ | -------- | ------- | ------------------------------------------------------------- |
| value | string | true     |         | The base URL for the request, e.g. `https://api.github.com/`. |

##### `getURL`

Gets the URL for the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setURL`

Sets the URL for the request.

| Name  | Type   | Required | Default | Description                                                                                                     |
| ----- | ------ | -------- | ------- | --------------------------------------------------------------------------------------------------------------- |
| value | string | true     |         | The URL for the request. It can either be a full url or a URI resource for use with the baseURL. e.g. `/repos`. |

##### `setResolveURL`

Sets the resolveURL parameter for the request.

| Name  | Type    | Required | Default | Description                                                                    |
| ----- | ------- | -------- | ------- | ------------------------------------------------------------------------------ |
| value | boolean | false    | false   | Resolves URLs in the response body to absolute URLs, including the port number |

##### `getMethod`

Gets the HTTP method for the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setMethod`

Sets the HTTP method for the request.

| Name  | Type   | Required | Default | Description                      |
| ----- | ------ | -------- | ------- | -------------------------------- |
| value | string | true     |         | The HTTP method for the request. |

##### `withBasicAuth`

Sets the username and password for HTTP Basic Auth.

| Name     | Type   | Required | Default | Description                      |
| -------- | ------ | -------- | ------- | -------------------------------- |
| username | string | true     |         | The username for the basic auth. |
| password | string | true     |         | The password for the basic auth. |

##### `withCertificateAuth`

Sets the username and password for HTTP Basic Auth.

| Name            | Type   | Required | Default | Description                                              |
| --------------- | ------ | -------- | ------- | -------------------------------------------------------- |
| certificatePath | string | true     |         | The mapped path to the certificate used to authenticate. |
| password        | string | false    |         | The optional password used to decrypt the certificate.   |

##### `withNTLMAuth`

Sets the username, password, domain and workstation for NTLM Auth.

| Name        | Type   | Required | Default | Description                        |
| ----------- | ------ | -------- | ------- | ---------------------------------- |
| username    | string | true     |         | The username for the NTLM auth.    |
| password    | string | true     |         | The password for the NTLM auth.    |
| domain      | string | true     |         | The domain for the NTLM auth.      |
| workstation | string | true     |         | The workstation for the NTLM auth. |

Workstation can be obtained with `createObject('java','java.net.InetAddress').getLocalHost().getHostName()`

##### `withRequestCallback`

Schedules a callback to be ran when executing the request.

| Name        | Type     | Required | Default | Description                                     |
| ----------- | -------- | -------- | ------- | ----------------------------------------------- |
| callback    | function | true     |         | The callback to run when executing the request. |

Returns: the `HyperRequest` instance

##### `withResponseCallback`

Schedules a callback to be ran when receiving the response.

| Name        | Type     | Required | Default | Description                                      |
| ----------- | -------- | -------- | ------- | ------------------------------------------------ |
| callback    | function | true     |         | The callback to run when receiving the response. |

Returns: the `HyperRequest` instance

##### `getUsername`

Gets the username for the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setUsername`

Sets the username for the request.

| Name  | Type   | Required | Default | Description                   |
| ----- | ------ | -------- | ------- | ----------------------------- |
| value | string | true     |         | The username for the request. |

##### `getPassword`

Gets the password for the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setPassword`

Sets the password for the request.

| Name  | Type   | Required | Default | Description                   |
| ----- | ------ | -------- | ------- | ----------------------------- |
| value | string | true     |         | The password for the request. |

##### `getTimeout`

Gets the timeout for the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setTimeout`

Sets the timeout for the request.

| Name  | Type   | Required | Default | Description                  |
| ----- | ------ | -------- | ------- | ---------------------------- |
| value | string | true     |         | The timeout for the request. |

##### `withoutRedirecting`

A convenience method to not follow any redirects.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `withoutEncodingUrl`

A convenience method to not encode the url.
WARNING: Not supported on Adobe engines.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `getMaximumRedirects`

Gets the maximum number of redirects to follow.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setMaximumRedirects`

Sets the maximum number of redirects to follow. A value of `*` will follow
redirects infinitely.

| Name  | Type | Required | Default | Description                                |
| ----- | ---- | -------- | ------- | ------------------------------------------ |
| value | any  | true     |         | The maximum number of redirects to follow. |

##### `getBody`

Gets the body for the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setBody`

Sets the body for the request. Complex values will be serialized before sending
the request.

| Name  | Type | Required | Default | Description               |
| ----- | ---- | -------- | ------- | ------------------------- |
| value | any  | true     |         | The body for the request. |

##### `getBodyFormat`

Gets the body format for the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setBodyFormat`

Sets the body format for the request.

| Name  | Type | Required | Default | Description                      |
| ----- | ---- | -------- | ------- | -------------------------------- |
| value | any  | true     |         | The body format for the request. |

##### `asJson`

A convenience method to set the body format and Content-Type to json.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `asFormFields`

A convenience method to set the body format and Content-Type to form fields.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `getReferrer`

Gets the referrer for the request, if any.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `getHeaders`

Gets the headers for the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setHeaders`

Sets the headers for the request.

| Name  | Type   | Required | Default | Description                  |
| ----- | ------ | -------- | ------- | ---------------------------- |
| value | struct | true     |         | The headers for the request. |

##### `setHeader`

Set a header for the request.

| Name  | Type   | Required | Default | Description              |
| ----- | ------ | -------- | ------- | ------------------------ |
| name  | string | true     |         | The name of the header.  |
| value | string | true     |         | The value of the header. |

##### `withHeaders`

Add additional headers to the request.

| Name    | Type   | Required | Default | Description                                |
| ------- | ------ | -------- | ------- | ------------------------------------------ |
| headers | struct | true     |         | A struct of headers to add to the request. |

##### `forwardHeaders`

Adds specified headers to the request if they exist. Usually used in conjunction with the current CFML request headers.

| Name    | Type   | Required | Default                               | Description                                                                           |
| ------- | ------ | -------- | ------------------------------------- | ------------------------------------------------------------------------------------- |
| names   | array  | true     |                                       | An array of header names to add to the request if they exist in the `headers` struct. |
| headers | struct | false    | `getHTTPRequestData( false ).headers` | A struct of headers to inspect.                                                       |

##### `hasHeader`

Check if the request has a header with the given name.

| Name | Type   | Required | Default | Description                      |
| ---- | ------ | -------- | ------- | -------------------------------- |
| name | string | true     |         | The name of the header to check. |

##### `setContentType`

A convenience method to set the Content-Type header.

| Name | Type   | Required | Default | Description                            |
| ---- | ------ | -------- | ------- | -------------------------------------- |
| type | string | true     |         | The Content-Type value for the request |

##### `setAccept`

A convenience method to set the Accept header.

| Name | Type   | Required | Default | Description                      |
| ---- | ------ | -------- | ------- | -------------------------------- |
| type | string | true     |         | The Accept value for the request |

##### `getQueryParams`

Gets the query parameters for the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `setQueryParams`

Sets the query parameters for the request.

| Name  | Type   | Required | Default | Description                           |
| ----- | ------ | -------- | ------- | ------------------------------------- |
| value | struct | true     |         | The query parameters for the request. |

##### `setQueryParam`

Set a query parameter for the request.

| Name  | Type   | Required | Default | Description                       |
| ----- | ------ | -------- | ------- | --------------------------------- |
| name  | string | true     |         | The name of the query parameter.  |
| value | string | true     |         | The value of the query parameter. |

##### `withQueryParams`

Add additional query parameters to the request.

| Name        | Type   | Required | Default | Description                                         |
| ----------- | ------ | -------- | ------- | --------------------------------------------------- |
| queryParams | struct | true     |         | A struct of query parameters to add to the request. |

##### `hasQueryParam`

Check if the request has a query parameter with the given name.

| Name | Type   | Required | Default | Description                               |
| ---- | ------ | -------- | ------- | ----------------------------------------- |
| name | string | true     |         | The name of the query parameter to check. |

##### `attach`

Attaches a file to the Hyper request.
Also sets the Content-Type as `multipart/form-data`.
Multiple files can be attached by calling `attach` multiple times before calling a send method.

| Name     | Type   | Required | Default | Description                                       |
| -------- | ------ | -------- | ------- | ------------------------------------------------- |
| name     | string | true     |         | The name of the file being uploaded.              |
| path     | string | true     |         | The absolute path to the file to be uploaded.     |
| mimeType | string | false    |         | An optional mime type to associate with the file. |

##### `setThrowOnError`

Sets the throw on error property for the request. If true, error codes and status
will be turned in to exceptions.

| Name  | Type    | Required | Default | Description                           |
| ----- | ------- | -------- | ------- | ------------------------------------- |
| value | boolean | true     |         | The value of the throw on error flag. |

##### `throwErrors`

A convenience method to throw on errors.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `allowErrors`

A convenience method to not throw on errors.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `clone`

Clones the current request into a new HyperRequest.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

Returns: A new HyperRequest instance cloned from this one.

##### `setProperties`

Quickly set many request properties using a struct. The key should be the name
of one of the properties on the request, e.g. `url`, `headers`, `method`,
`body`.

| Name       | Type   | Required | Default | Description                                                                                                                                   |
| ---------- | ------ | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| properties | struct | true     |         | A struct of properties to set. Each property name will be set on the request. Properties that don't exist on the request will throw an error. |

##### `setHttpClient`

Sets the HTTP Client to use for the request.  The client should conform to
the `HyperHttpClientInterface` (though it does not need to use the `implements` keyword).

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| httpClient   | `HyperHttpClientInterface`     | `true`          |         | The httpClient to use for the request.             |

##### `setInterceptorService`

ColdBox Interceptor Service to announce request and response interception points.
A noop option is provided in the `init` for non-ColdBox settings.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| interceptorService   | any    | `true`          |         | The interceptor service to use for the request.             |

### HyperResponse

The `HyperResponse` component is a read-only wrapper to easily grab different information about the response.

##### `getResponseId`

Gets the unique response ID representing this response.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `getStatusCode`


Gets the status code for the response.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `getData`

Gets the data for the response.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `getRequest`

Gets the HyperRequest instance associated with this response.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `getCharset`

Gets the charset value for the response.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `getTimestamp`

Gets the timestamp for when this response was recieved.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `getExecutionTime`

Gets the execution time of the request.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `json`

Returns the data of the request as deserialized JSON.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `isSuccess`

Returns true if the request status code is considered successful.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `isOK`

Returns true if the request status code is 200 OK.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `isRedirect`

Returns true if the request status code is considered a redirect.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `isError`

Returns true if the request status code is considered either a client error or a server error.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `isClientError`

Returns true if the request status code is considered a client error.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `isUnauthorized`

Returns true if the request status code is 401 Unauthorized.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `isForbidden`

Returns true if the request status code is 403 Forbidden.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `isNotFound`

Returns true if the request status code is 404 Not Found.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

##### `isServerError`

Returns true if the request status code is considered a server error.

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| No arguments |      |          |         |             |

### Request Defaults

Hyper allows you to configure defaults for your requests. This is particularly useful for reducing boilerplate in your application.

Defaults are set on the `HyperBuilder` instance. The easiest way to do this is to configure it in WireBox:

```js
// config/WireBox.cfc
component {

    function configure() {
        map( "StarWarsClient" )
            .to( "hyper.models.HyperBuilder" )
            .asSingleton()
            .initWith(
                baseUrl = "https://swapi.co/api"
            );
    }

}
```

Now, you can inject this pre-configured builder wherever you need in your application:

```js
component {

    property name="StarWarsClient" inject="id";

    function findUser( id ) {
        return StarWarsClient.get( "/people/#id#" );
    }

}
```

You can even create multiple clients using this approach:

```js
// config/WireBox.cfc
component {

    function configure() {
        map( "SWAPIClient" )
            .to( "hyper.models.HyperBuilder" )
            .asSingleton()
            .initWith(
                baseUrl = "https://swapi.co/api"
            );

        map( "GitHubClient" )
            .to( "hyper.models.HyperBuilder" )
            .asSingleton()
            .initWith(
                baseUrl = "https://api.github.com",
                headers = {
                    "Authorization" = getSetting( "SWAPI_TOKEN" )
                }
            );
    }

}
```

You can also set or change the defaults by either passing the key / value pairs in to the `init` method or by calling the appropriate `HyperRequest` method on the `HyperBuilder.defaults` property.

```js
var hyper = new Hyper.models.HyperBuilder(
    baseUrl = "https://api.github.com"
);
hyper.defaults.withHeaders( { "Authorization" = token } );
```

The defaults set here need to match the property names on the `HyperRequest`. These are:

```
/**
* The httpClient to use for the request
*/
property name="httpClient";

/**
* The baseURL for the request.
* e.g. https://api.github.com/
*/
property name="baseUrl" default="";

/**
* The URL for the request.
* It can either be a full url
* or a URI resource for use with the baseURL.
* e.g. /repos
*/
property name="url" default="";

/**
* Setting this to true will change all relative urls in the document to absolute.
*/
property name="resolveUrls" default="false";

/**
* Setting this to false will not automatically encode the url passed.
* WARNING: Setting this to false is not supported on Adobe engines.
*/
property name="encodeUrl" default="true";

/**
* The HTTP method for the request.
*/
property name="method" default="GET";

/**
* The username for the request for basic auth.
*/
property name="username" default="";

/**
* The password for the request for basic auth.
*/
property name="password" default="";

/**
* Timeout, in seconds, for the request.
*/
property name="timeout" default="10";

/**
* The maximum number of redirects to follow.
* A value of `*` will follow redirects infinitely.
*/
property name="maximumRedirects" default="*";

/**
* The body to send with the request.
* How the body is serialized is
* determined by the bodyFormat.
*/
property name="body" default="";

/**
* The format to serialize the body.
* e.g. `json` or `formFields`
*/
property name="bodyFormat" default="json";

/**
* The referring response in the case of redirects.
*/
property name="referrer";

/**
* A struct of headers for the request.
*/
property name="headers";

/**
* A struct of query parameters for the request.
*/
property name="queryParams";

/**
* Flag to throw on a cfhttp error.
*/
property name="throwOnError" default="false";

/**
* The full path to a PKCS12 format file that contains the client certificate for the request.
*/
property name="clientCert";

/**
* 	Password used to decrypt the client certificate.
*/
property name="clientCertPassword";

/**
* The domain for the request for NTLM auth.
*/
property name="domain" default="";

/**
* The workstation for the request for NTLM auth.
*/
property name="workstation" default="";

/**
* The authType for the request
*/
property name="authType" default="BASIC";

/**
* An array of callback functions to call
* before firing off a request.
*/
property name="requestCallbacks" type="array";

/**
* An array of callback functions to call
* after receiving a response.
*/
property name="responseCallbacks" type="array";
```

### Interceptors

Hyper announces two interception points you can listen to in your ColdBox applications:
`onHyperRequest` and `onHyperResponse`.

`onHyperRequest` receives a struct with a `request` key as the data.

`onHyperResponse` receives a struct with a `response` key as the data.