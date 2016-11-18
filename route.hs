import Control.Monad
import Control.Monad.IO.Class
import Data.Aeson
import Data.List
import Network.HTTP.Types
import System.Directory
import System.FilePath
import System.IO
import Data.Char 
import AronModule 

app runner = do
  settings <- newAppSettings

  runner $ controllerApp settings $ do
    routeTop $ render "index.html" ()

routeMethod GET $ do
  -- Respond to the root route
  routeTop $ do
    posts <- liftIO $ do
      dataDir <- getDirectoryContents "data"
      let postFiles = sort $
            filter (not . isPrefixOf ".") dataDir
      forM postFiles $ \postFile -> do
        withFile ("data" </> postFile) ReadMode $ \h -> do
          title <- hGetLine h
          return $ object ["id" .= postFile
                          , "title" .= title]
    render "index.html" $ object ["posts" .= posts]

