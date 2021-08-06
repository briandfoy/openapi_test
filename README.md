## Array issue in Mojolicious::Plugin::API

This applies to  Mojolicious::Plugin::API 3.x and 4.x, although this
only demonstrates the problem for 4.x.

Consider a parameter that is a schema for an object:

      parameters:
        - in: query
          name: values
          schema:
            type: object
            properties:
              q:
                type: string
              flags:
                type: array
                items:
                  type: string
            additionalProperties: false
            required:
              - q
          style: form
          explode: true

This form allows multiple values of the optional parameter `flags`.
No `flags` and everything is fine:

	example.com/search?q=123

More than one `flags` and everything is fine:

 	example.com/search?q=123&flags=abc&flags=345

But, one `flags` is a problem:

 	example.com/search?q=123&flags=abc

The error says it expected an array but got a string

    {"errors":[{"message":"Expected array - got string.",
    "path":"\/values\/flags"}],"status":400}

Similar issues:
