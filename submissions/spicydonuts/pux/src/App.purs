module App
  ( AppEffects
  , initialState
  , update
  , module App.Actions
  , module App.Views.JediConsole
  , module App.Types
  ) where

import App.Actions (Action)
import App.Types (State)
import App.Views.JediConsole (view)
import Network.HTTP.Affjax (AJAX)
import Pux (noEffects, EffModel)

type AppEffects = (ajax :: AJAX)

initialState :: State
initialState = {}

update :: Action -> State -> EffModel State Action AppEffects
update action state = noEffects state
