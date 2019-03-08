module ResultJson where

import Data.Hashable (hash)
import Data.Text (Text, append, pack)
import Data.Vector as V
import GHC.Generics (Generic)

import CoreDataTypes

newtype ResultServices = ResultServices[ResultService]
-- instance ToJSON ResultServices

data ResultService = ResultService {
  resServiceName :: Text
, resServiceEnvironments :: [ResultEnvironment]
}

data ResultEnvironment = ResultEnvironment {
  resultEnvironmentName   :: Text
, resultInstances         :: [ResultInstance]
}

data ResultInstance = ResultInstance {
  resultInstanceEnvironmentName      :: Text
, resultInstancePingEndpoint         :: Endpoint
, resultInstancePingResult           :: PingResult
, resultInstanceDocumentation        :: [Endpoint]
, resultInstanceLogs                 :: [Endpoint]
, resultInstanceHealthCheckResults   :: [ResultHealthCheck]
, information                        :: [(Text,Text)]
}

instanceId :: ResultInstance -> Text
instanceId = append "instance-" . pack . show . hash . resultInstancePingEndpoint

data ResultHealthCheck = ResultHealthCheck {
  healthCheckEndpoint    :: Endpoint
, healthCheckResultItems  :: [HealthCheckResult]
} deriving Show
