module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { input : String
    }


init : Model
init =
    { input = ""
    }



-- UPDATE


type Msg
    = Input String
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input input ->
          { model | input = input }

        Submit ->
          -- 曲を決定
          run model.input


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ Html.form [ onSubmit Submit ]
            [ datalist [ value model.input, onInput Input ]
            [ option [ value "https://www.youtube.com/watch?v=ygY2qObZv24" ] [ text "https://www.youtube.com/watch?v=ygY2qObZv24" ]
            , option [ value "https://www.youtube.com/watch?v=a-Nf3QUFkOU" ] [ text "https://www.youtube.com/watch?v=a-Nf3QUFkOU" ]
            , option [ value "https://www.youtube.com/watch?v=XSLhsjepelI" ] [ text "https://www.youtube.com/watch?v=XSLhsjepelI" ]
            ]
        , button
            []
            [ text "Run" ]
            ]
        ]



-- run songName = 
