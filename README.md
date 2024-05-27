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

## TODO

Things still missing from the exercise description:

* Add WireMock that retuns a random joke.
* Production skeleton.

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
{"Description":"Not implemented yet. Family: baconipsum","Time":"2024-05-27T04:30:08Z"}
```

Invalid amount:
```
NAMESPACE>do ##class(IOP.Jokes.Runner).Run("simpsons", -1)
IOP.Jokes.Error:
{"Description":"Invalid amount: -1. Valid amount > 0.","Time":"2024-05-27T04:33:36Z"}
```