module Main where

import App (AppEffects, State, Action, initialState, update, view)
import Control.Bind ((=<<))
import Control.Monad.Eff (Eff)
import Prelude (bind, pure)
import Pux (App, Config, CoreEffects, renderToDOM)

init :: State
init = initialState

-- | App configuration
config :: forall e. State -> Eff e (Config State Action AppEffects)
config state =
  pure
    { initialState
    , update
    , view
    , inputs: []
    }

-- | Entry point for the browser.
main :: State -> Eff (CoreEffects AppEffects) (App State Action)
main state = do
  app <- Pux.start =<< config state
  renderToDOM "#app" app.html
  -- | Used by hot-reloading code in support/index.js
  pure app

-- | Entry point for the browser with pux-devtool injected.
debug :: State -> Eff (CoreEffects AppEffects) (App State (Pux.Devtool.Action Action))
debug state = do
  app <- Pux.Devtool.start =<< config state
  renderToDOM "#app" app.html
  -- | Used by hot-reloading code in support/index.js
  pure app
