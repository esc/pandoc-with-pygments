#!/usr/bin/env runhaskell
-- A Pandoc filter to use Pygments for Pandoc
-- Code blocks in HTML output
-- Nickolay Kudasov 2013
-- Requires Pandoc 1.12

-- 2014-07-20 Modified for LaTeX by Valentin Haenel
 
import Text.Pandoc.Definition
import Text.Pandoc.JSON (toJSONFilter)
import System.Process (readProcess)
 
 
main = toJSONFilter highlight
 
highlight :: Block -> IO Block
highlight (CodeBlock (_, options , _ ) code) = do
  pygmentedCode <- pygments code options
  return (RawBlock (Format "latex") pygmentedCode)
highlight x = return x
 
pygments:: String -> [String] -> IO String
pygments code options
         | (options !! 1 /= "") = readProcess "pygmentize" ["-l", (options !! 1), "-f", "latex"] code
         | otherwise = return ("\\begin{Verbatim}\n" ++ code ++ "\n\\end{Verbatim}")
