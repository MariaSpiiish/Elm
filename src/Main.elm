module Main exposing (main)

import Browser
import Html exposing (Html, Attribute, span, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias UserInput = String

type alias Model =
  { celsius : UserInput
    
    , inches : UserInput
    
  }


init : Model
init =
  { celsius = ""
    , inches = ""}



-- UPDATE


type Msg
  = Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newInput ->
      { model | celsius = newInput }



-- VIEW


view : Model -> Html Msg
view model =
    div [] 
       [ div [] 
           [span []
               [ input [ value model.celsius, onInput Change, style "width" "40px" ] []
               , text "°C = "
               , span [ style "color" (foo model.celsius) ] [ text (bar model.celsius) ]
               , text "°F"
               ]
        ]
        , div [] 
           [span []
               [ input [ value model.inches, onInput Change, style "width" "40px" ] []
               , text " Inches = "
               , span [ style "color" (foo model.inches) ] [ text (bar2 model.inches) ]
               , text " Metres"
               ]
            ]
        ]
        
foo : UserInput -> String
foo userInput =
    case String.toFloat userInput of
        Just celsius ->
          "blue"

        Nothing ->
          "red"
          
bar : UserInput -> String
bar celsius = 
    case String.toFloat celsius of
        Just n ->
            String.fromFloat (n * 1.8 + 32)
    
        Nothing ->
            "False"
            
bar2 : UserInput -> String
bar2 inches = 
    case String.toFloat inches of
        Just num ->
            String.fromFloat (num * 0.0254)
    
        Nothing ->
            "False"