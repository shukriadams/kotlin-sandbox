
Kotlin sandbox for native app dev in Ubuntu 22.04. No IDE.

## Compile

Standard

    kotlinc hello.kt -include-runtime -d hello.jar

Native

    kotlinc-native hello.kt