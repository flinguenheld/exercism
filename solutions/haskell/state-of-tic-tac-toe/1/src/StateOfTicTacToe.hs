module StateOfTicTacToe (gameState, GameState(..)) where
import Data.Foldable (foldl')

data GameState = WinX | WinO | Draw | Ongoing | Impossible deriving (Eq, Show)

gameState :: [String] -> GameState
gameState board
  | abs (nb_x - nb_o) > 1 || nb_o > nb_x || (x_win && o_win) = Impossible
  | x_win = WinX
  | o_win = WinO
  | not (any (elem ' ') board) = Draw
  | otherwise = Ongoing
  where
    s = length board - 1
    diag1 = [(board !! c) !! c | c <- [0..s]]
    diag2 = [(board !! row) !! col | (row, col) <- zip [0..s] (reverse [0..s])]
    rev = [[(board !! row) !! col | row <- [0..s]] | col <- [0..s]]

    boards = board ++ rev ++ [diag1, diag2]

    x_win = "XXX" `elem` boards
    o_win = "OOO" `elem` boards

    nb_x = foldl' (\acc line -> acc + length (filter (=='X') line)) 0 board
    nb_o = foldl' (\acc line -> acc + length (filter (=='O') line)) 0 board
