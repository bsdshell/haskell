{-# LANGUAGE OverloadedStrings #-}
import Network.Wai
import Network.HTTP.Types (status200)
import Network.Wai.Handler.Warp (run)

application _ respond = respond $
  responseLBS status200 
            [("Content-Type", "text/plain")] 
            "Hello world from application"

app2::Application
app2 _ respond = respond index

index::Response
index = responseFile status200 [("Content-Type", "text/plain")] "index.html" Nothing

main = run 3000 app2 
