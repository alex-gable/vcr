% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/request_handler-crul.R
\name{RequestHandlerCrul}
\alias{RequestHandlerCrul}
\title{RequestHandlerCrul}
\description{
Methods for the crul package, building on \link{RequestHandler}
}
\examples{
\dontrun{
vcr_configure(
 dir = tempdir(),
 record = "once"
)

data(crul_request)
crul_request$url$handle <- curl::new_handle()
crul_request
x <- RequestHandlerCrul$new(crul_request)
# x$handle()

library(crul)
data(crul_request_post_json)
crul_request_post_json$request$url$handle <- curl::new_handle()
crul_request_post_json
crul_request_post_json$request
x <- RequestHandlerCrul$new(crul_request_post_json$request)
# x$handle()

# body matching
library(vcr)
library(crul)
vcr_configure(dir = tempdir(), log = TRUE)
cli <- HttpClient$new(url = "https://httpbin.org")

## testing, same uri and method, changed body in 2nd block
use_cassette(name = "apple7", {
  resp <- cli$post("post", body = list(foo = "bar"))
}, match_requests_on = c("method", "uri", "body"))
## should error, b/c record="once"
use_cassette(name = "apple7", {
  resp <- cli$post("post", body = list(foo = "bar"))
  resp2 <- cli$post("post", body = list(hello = "world"))
}, match_requests_on = c("method", "uri", "body"))
cas <- insert_cassette(name = "apple7", 
  match_requests_on = c("method", "uri", "body"))
resp2 <- cli$post("post", body = list(hello = "world"))
eject_cassette("apple7")

## testing, same body, changed method in 2nd block
use_cassette(name = "apple8", {
  x <- cli$post("post", body = list(hello = "world"))
}, match_requests_on = c("method", "body"))
use_cassette(name = "apple8", {
  x <- cli$get("post", body = list(hello = "world"))
}, match_requests_on = c("method", "body"))

## testing, same body, changed uri in 2nd block
use_cassette(name = "apple9", {
  x <- cli$post("post", body = list(hello = "world"))
  w <- cli$post("get", body = list(hello = "world"))
}, match_requests_on = c("method", "body"))
use_cassette(name = "apple9", {
  NOTHING HERE
}, match_requests_on = c("method", "body"))
unlink(file.path(vcr_configuration()$dir, "apple9.yml"))

jsonlite::fromJSON(resp$parse())
}
}
\section{Super class}{
\code{\link[vcr:RequestHandler]{vcr::RequestHandler}} -> \code{RequestHandlerCrul}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-clone}{\code{RequestHandlerCrul$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="vcr" data-topic="RequestHandler" data-id="handle">}\href{../../vcr/html/RequestHandler.html#method-handle}{\code{vcr::RequestHandler$handle()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="vcr" data-topic="RequestHandler" data-id="initialize">}\href{../../vcr/html/RequestHandler.html#method-initialize}{\code{vcr::RequestHandler$initialize()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{RequestHandlerCrul$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
