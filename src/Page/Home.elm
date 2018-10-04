module Page.Home exposing (Model, Msg(..), init, update, view)

import Data.Session exposing (Session, VideoData(..))
import Html as H
import Html.Attributes as HA
import Http


type alias Model =
    {}


type Msg
    = Noop


init : Session -> ( Model, Cmd Msg )
init session =
    ( {}, Cmd.none )


update : Session -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    ( model, Cmd.none )


view : Session -> Model -> ( String, List (H.Html Msg) )
view session model =
    ( "Liste des vidéos"
    , case session.videoData of
        Fetching ->
            [ H.text "Chargement des vidéos..." ]

        Received videoList ->
            viewVideoList videoList

        Error error ->
            [ H.text <| "Erreur lors du chargement des videos: " ++ error ]
    )


viewVideoList : List Data.Session.Video -> List (H.Html Msg)
viewVideoList videoList =
    [ H.div
        [ HA.class "box" ]
        [ H.div [ HA.class "field has-addons" ]
            [ H.div [ HA.class "control is-expanded" ]
                [ H.input [ HA.class "input", HA.type_ "search", HA.placeholder "Search video titles" ] [] ]
            , H.div [ HA.class "control" ]
                [ H.a [ HA.class "button is-info" ] [ H.text "Search" ] ]
            ]
        ]
    , H.div [ HA.class "row columns is-multiline" ]
        (videoList
            |> List.map
                (\video ->
                    H.div [ HA.class "column is-one-quarter" ]
                        [ H.a [ HA.href video.url ]
                            [ H.div [ HA.class "card large round" ]
                                [ H.div [ HA.class "card-image " ]
                                    [ H.figure [ HA.class "image" ]
                                        [ H.img
                                            [ HA.src video.thumbnail
                                            , HA.alt <| "Thumbnail of the video titled: " ++ video.title
                                            ]
                                            []
                                        ]
                                    ]
                                , H.div [ HA.class "card-content" ]
                                    [ H.div [ HA.class "content" ]
                                        [ H.text video.author
                                        , H.p [ HA.class "video-date" ] [ H.text video.date ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                )
        )
    ]