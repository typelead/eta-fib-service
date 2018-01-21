module Main where

import Servant
import Servant.Server
import Data.Aeson
import Network.Wai.Servlet.Handler.Jetty

type API = "fib" :> Capture "n" Int :> Get '[JSON] Value

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

api :: Proxy API
api = Proxy

server :: Application
server = serve api fibHandler
  where fibHandler n
          | n >= 0
          = return $ object ["n" .= n, "fib" .= fib n]
          | otherwise = throwError $ err412 { errBody = "Precondition Failed: n >= 0" }

main :: IO ()
main = run 9000 server
