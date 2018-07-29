# Eta Fibonacci Service

This repository hosts the code for the fibonacci service example in the [Web Service](https://eta-lang.org/docs/tutorials/web-services/the-api) tutorial.

## Running

```
etlas run
```

This will start a server at `http://localhost:9000`.


There's a single endpoint:

```
GET /fibonacci/:n
```

Where the `:n` can be replaced with a non-negative integer.
