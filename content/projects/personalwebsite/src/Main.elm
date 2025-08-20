module Main exposing (main)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)

-- Elm-UI https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/
-- How to make sections
-- https://ellie-app.com/4cYct6jfjJya1

-- MODEL


type alias Model =
    {}


initialModel : Model
initialModel =
    {}



-- UPDATE


type Msg
    = NoAction


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoAction ->
            model



-- VIEW
-- Styles


card : String -> String -> Element msg
card name content =
    column
        [ Border.shadow
            { offset = ( 0, 0 )
            , size = 3
            , blur = 5
            , color = rgb255 211 211 211
            }
        , Border.rounded 3
        , padding 10
        , width fill
        , spacingXY 4 8
        ]
        [ wrappedRow [ Region.heading 2, Font.bold, Font.size 18 ]
            [ paragraph
                []
                [ text name
                ]
            ]
        , wrappedRow [ Font.size 14 ]
            [ paragraph
                []
                [ text content
                ]
            ]
        ]



-- View


view : Model -> Html.Html Msg
view model =
    layout
        []
        (column []
            [ row
                [ Border.shadow
                    { offset = ( 0, 0 )
                    , size = 3
                    , blur = 5
                    , color = rgb255 211 211 211
                    }
                , width fill
                , centerY
                , centerX
                ]
                [ paragraph []
                    [ text "Hi"
                    ]
                ]
            , column
                [ padding 10
                , spacingXY 10 10
                ]
                [ el
                    [ Region.heading 1
                    , Font.size 24
                    , Font.bold
                    , centerX
                    , centerY
                    ]
                    (text "Iniyan Joseph")
                , card "Paper #1" "Lorem Ipsum Dolor Set Id Amet carisentcairse cairse ntcaire siace rstiaecn rsitae"
                ]
            ]
        )


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
