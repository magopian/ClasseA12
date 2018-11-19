module Request.Kinto exposing
    ( KintoData(..)
    , client
    )

import Kinto


type KintoData a
    = NotRequested
    | Requested
    | Received a
    | Failed Kinto.Error


client : String -> String -> Kinto.Client
client login password =
    Kinto.client "https://kinto.agopian.info/v1/" (Kinto.Basic login password)
