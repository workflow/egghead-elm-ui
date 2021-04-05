module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


white : Color
white =
    rgb255 255 255 255


view : Model -> Html Msg
view model =
    layout [ Background.color (rgb255 238 241 245) ]
        dashboard


edges =
    { top = 0, right = 0, bottom = 0, left = 0 }


dashboard : Element msg
dashboard =
    let
        attrs =
            [ centerX, centerY, spacing 15, Background.color (rgb255 228 231 235) ]

        breakdown =
            row
                [ width fill
                , Region.heading 2
                , Font.semiBold
                , Font.size 18
                , paddingEach { edges | left = 20, top = 30 }
                ]
                [ text "BREAKDOWN" ]
    in
    column attrs
        [ viewCard "Overall"
        , breakdown
        , viewCard "Category 1"
        , viewCard "Category 2"
        , viewCard "Category 3"
        ]


viewCard : String -> Element msg
viewCard title =
    row
        [ Background.color white
        , Font.color (rgb255 51 51 51)
        , Border.rounded 15
        , padding 20
        , width (px 300)
        , height (px 200)
        ]
        [ textColumn [ alignTop, alignLeft, width fill, spacing 10 ]
            [ el [ Region.heading 3, Font.size 18, Font.semiBold ] (text <| String.toUpper title)
            , el [] <| paragraph [ alignTop ] [ text "content content content content content content" ]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
