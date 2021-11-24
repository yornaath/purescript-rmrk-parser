module RMRK.Syntax where

import Prelude
import Data.Eq.Generic (genericEq)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe)
import Data.Show.Generic (genericShow)
import RMRK.Primitives.Entity (Entity)
import RMRK.Primitives.NFTId (NFTId)
import RMRK.Primitives.Price (Price)
import RMRK.Primitives.Recipient (Recipient)
import RMRK.Primitives.Version (Version)

data Expr
  = Namespace
  | Seperator
  | Version Version
  | Remark Stmt

derive instance genericExpr :: Generic Expr _

instance showExpr :: Show Expr where
  show = genericShow

instance eqExpr :: Eq Expr where
  eq = genericEq

-- rmrk::ACCEPT::{version}::{id1}::{entity}::{id2})
data Stmt
  = ACCEPT Version NFTId Entity
  | LIST Version NFTId Price
  | BURN Version NFTId
  | BUY Version NFTId (Maybe Recipient)

derive instance genericStmt :: Generic Stmt _

instance showStmt :: Show Stmt where
  show = genericShow

instance eqStmt :: Eq Stmt where
  eq = genericEq
