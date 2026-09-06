module StateOfTicTacToe (gameState, GameState(..)) where
import Data.Foldable (foldl')
import Data.List (transpose)

data GameState = WinX | WinO | Draw | Ongoing | Impossible deriving (Eq, Show)

gameState :: [String] -> GameState
gameState board
  | abs (nb_x - nb_o) > 1 || nb_o > nb_x || (x_win && o_win) = Impossible
  | x_win                                                    = WinX
  | o_win                                                    = WinO
  | not (any (elem ' ') board)                               = Draw
  | otherwise                                                = Ongoing
  where
    diag1 = zipWith (!!) board [0..]
    diag2 = zipWith (!!) (reverse board) [0..]
    all_boards = concat [board, transpose board, [diag1], [diag2]]

    x_win = "XXX" `elem` all_boards
    o_win = "OOO" `elem` all_boards

    nb_x = foldl' (\acc line -> acc + length (filter (=='X') line)) 0 board
    nb_o = foldl' (\acc line -> acc + length (filter (=='O') line)) 0 board
