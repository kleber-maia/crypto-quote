# Crypto Quote Experiment

A simple cryptocurrency app project for Apple TV using SwiftUI, MVVM, TDD.

### Screen recording

https://github.com/kleber-maia/crypto-quote/assets/10270929/0084d593-b640-43e8-82c2-aab0f48a25df

### How it works

- Contains a hardcoded list of ten cryptocurrencies.
- Fetches the most recent quotes for those coins.
- Shows relevant information for a given coin, one at a time.
- Automatically switches between coins every 10 secs.
- Allows the user to switch between coins.
- Automatically fetches new data every 15 min.

### Requirements

- Xcode 15 or superior.
- Apple TV device or simulator running tvOS 17 or superior.

### How to run it

1. Open the project on Xcode, create a file named `ApiKey.txt` and add it to `Crypto Quote` target.
1. Generate an API key to yourself on https://coinmarketcap.com and paste it on the file above.
3. Download the Apple TV simulator, then run the project.
