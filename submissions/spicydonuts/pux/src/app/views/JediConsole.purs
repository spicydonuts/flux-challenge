module App.Views.JediConsole where

import App.Actions (Action)
import App.Types (State)
import Prelude ((++))
import Pux.Html (li, button, h3, h6, (#), ul, section, text, h1, Html, div)
import Pux.Html.Attributes (className)

view :: State -> Html Action
view state =
  div
    [ className "app-container" ]
    [ div
      [ className "css-root" ]
      [ h1
        [ className "css-planet-monitor" ]
        [ text ("Obi-Wan currently on " ++ "Example Planet") ]
      , section
        [ className "css-scrollable-list" ]
        [ ul
          [ className "css-slots" ]
          [ li
            [ className "css-slot" ]
            [ h3 # text "Example Sith Name"
            , h6 # text ("Homeworld: " ++ "Example Planet")
            ]
          ]
        , div
          [ className "css-scroll-buttons" ]
          [ button
            [ className "css-bottom-up"
            ]
            []
          , button
            [ className "css-bottom-down"
            ]
            []
          ]
        ]
      ]
    ]
