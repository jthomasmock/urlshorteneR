# BITLY ---------------------------------------------------------------------------------------------------------------

# There is a lot more analytics functionality, like country of click, available at
# http://dev.bitly.com/link_metrics.html.
#
analytics.bitly <- function(url) {
  token = get("oauth_token", envir = oauth_cache)

  result = httr::GET("https://api-ssl.bitly.com/v3/link/clicks",
                     query = list(access_token = token$credentials$access_token,
                                  units = -1,
                                  link = url))

  stop_for_status(result)

  httr::content(result)$data
}
