**What are some common HTTP status codes?**
 informational (1xx), success (2xx), redirection (3xx), client errors (4xx), server errors (5xx) (from googling)

**What is the difference between a GET request and a POST request? When might each be used?**

 - POST:
   - requests additional data
   -  all data in the message body
   - use for destructive requests
   - more secure
   - can transmit a larger amount of information than a GET request
   - responses to POST requests must not be cached
   - common: uploading a file, submitting a completed web form

 - GET:
   - all data encoded in the URL
   - limited/no side effects, can be repeated, use for idempotent (can be repeated, doesn't matter how often you repeat a request) requests
   - responses can be cached
   - for example: retrieving a restaurant on yelp and all of its reviews

**Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?**

 - Cookies are passed as HTTP headers both in the request (client to server) and response (server to client)
 - "small files stores on the user's computer"
 - Can be used for tracking, saving username and password, other client information, security authentication...

