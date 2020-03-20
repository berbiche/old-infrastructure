# Pomerium

Pomerium is an authentication proxy supporting openid providers.

## Configuration

Google IDP is used in this configuration so it must be configured accordingly.

https://www.pomerium.io/docs/identity-providers/google.html

## Takeaways

At the time of writing this, the Pomerium documentation is bad.

For instance, it is not mentionned that the `forward_auth_url` domain has to be
different from the `authenticate_service_url`.
Otherwise you get a simple 404 error in the logs with no information on how to
resolve this issue.

One could infer this by looking at the documentation and note the different
domains used in the example, but it wasn't apparent to me.
