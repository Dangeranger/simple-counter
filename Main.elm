module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)


type alias Model =
    { totalCount : Int
    , incrementCount : Int
    , decrementCount : Int
    }


type Msg
    = Increment
    | Decrement


calculate_count : Model -> Int
calculate_count model =
    model.incrementCount - model.decrementCount


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model
                | incrementCount = model.incrementCount + 1
                , totalCount = model.totalCount + 1
            }

        Decrement ->
            { model
                | decrementCount = model.decrementCount + 1
                , totalCount = model.totalCount + 1
            }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div []
            [ calculate_count (model)
                |> toString
                |> text
            ]
        , button [ onClick Increment ] [ text "+" ]
        , h3 [] [ text ("Increment clicked: " ++ toString model.incrementCount) ]
        , h3 [] [ text ("Decrement clicked: " ++ toString model.decrementCount) ]
        , h3 [] [ text ("Total clicks: " ++ toString model.totalCount) ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model =
            { totalCount = 0, incrementCount = 0, decrementCount = 0 }
        , view = view
        , update = update
        }
