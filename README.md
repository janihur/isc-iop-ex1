# InterSystems Interoperability Exercise

Create an Intersystems Interoperability production that provides an unified API to call different humorous APIs.

The production will have the following ObjectScript API:
```
NAMESPACE>do ##class(IOP.Jokes.Runner).Run(<FAMILY>, <AMOUNT>)
```

where

* `<FAMILY>` is the canonical name (string) for the actual humorous API. See valid values in table below.
* `<AMOUNT>` tells how many jokes (number) should be returned. Default value is 1.

Implement support for at least two of the following families. You can also use other similar humorous APIs.

|FAMILY       |API                                  |
|-------------|-------------------------------------|
|`baconipsum` |https://baconipsum.com/json-api/     |
|`chucknorris`|https://api.chucknorris.io           |
|`simpsons`   |https://thesimpsonsquoteapi.glitch.me|

There have to be also a valid family returning "not implemented yet" error, see examples below.

## Production Skeleton

`src/` directory has a production skeleton that provides the starting point. You have to fill the gaps marked with `// TODO`. Please see the [sequence diagram](sequence-diagram.svg) that describes the expected behaviour.

You can import and compile the skeleton with following command:
```
NAMESPACE>do $system.OBJ.ImportDir("<LOCATION>/isc-iop-ex1/src/",,"/compile=1",,1)
```

where `<LOCATION>` is the directory where you have this repository.

## WireMock

Emulate one of the APIs above with [WireMock](https://wiremock.org/) or invent your own API.

Get the [WireMock Standalone](https://wiremock.org/docs/download-and-installation/#direct-download) and drop it into your preferred location.

WireMock already has an example API (`/status` and `/joke`) configured in `wiremock/` directory. Put your JSON stub configuration files there. See [Stubbing](https://wiremock.org/docs/stubbing/) for further details.

How to run WireMock:
```
java -jar <LOCATION>/wiremock-standalone.jar --verbose --disable-gzip --global-response-templating --root-dir ./wiremock/
```

How to try the API:
```
$ curl --include localhost:8080/status
HTTP/1.1 200 OK
Content-Type: application/json
X-Clacks-Overhead: GNU Terry Pratchett
Matched-Stub-Id: b0e9e6a8-59a5-4204-a153-ec92c36bc2e6
Transfer-Encoding: chunked

{"status":"OK"}
```

```
$ curl --include localhost:8080/joke/1
HTTP/1.1 200 OK
Content-Type: application/json
X-Clacks-Overhead: GNU Terry Pratchett
Matched-Stub-Id: 1b941e39-b965-47af-a113-79a19adf819e
Transfer-Encoding: chunked

{
    "id": "1",
    "joke": {
        "language": "en",
        "text": "Why did the tomato turn red? Because it saw the salad dressing!"
    }
}
```

## Examples

Return default amount of jokes:
```
NAMESPACE>do ##class(IOP.Jokes.Runner).Run("simpsons")
{"jokes":[{"family":"simpsons","text":"Facts are meaningless. You could use facts to prove anything that's even remotely true."}]}
```

Return 3 jokes:
```
NAMESPACE>do ##class(IOP.Jokes.Runner).Run("chucknorris", 3)
{"jokes":[{"family":"chucknorris","text":"Chuck Norris likes Apples for dessert ... especially Macbook Pros and Airbooks"},{"family":"chucknorris","text":"Doctor's slap babies because their NOT Chuck Norris"},{"family":"chucknorris","text":"If you see Chuck Norris picking his nose, it's best not to say anything."}]}
```

Invalid family:
```
NAMESPACE>do ##class(IOP.Jokes.Runner).Run("foobar")
IOP.Jokes.Error:
{"Description":"Invalid family: \"foobar\". Valid families: \"baconipsum\", \"chucknorris\", \"simpsons\".","Time":"2024-05-27T04:26:54Z"}
```

Valid family, but not impelemented yet:
```
NAMESPACE>do ##class(IOP.Jokes.Runner).Run("baconipsum")
IOP.Jokes.Error:
{"Description":"Not implemented yet. Family: \"baconipsum\"","Time":"2024-05-27T04:30:08Z"}
```

Invalid amount:
```
NAMESPACE>do ##class(IOP.Jokes.Runner).Run("simpsons", -1)
IOP.Jokes.Error:
{"Description":"Invalid amount: -1. Valid amount > 0.","Time":"2024-05-27T04:33:36Z"}
```