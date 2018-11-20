module Main where

import Control.Lens
import Control.Zipper
import Data.Tree
import Data.Tree.Lens

testTree :: Tree Integer
testTree = Node 1 [ Node 2 [ Node 4 [ Node 6 [], Node 8 [] ],
                             Node 5 [ Node 7 [], Node 9 [] ] ],
                    Node 3 [ Node 10 [], 
                             Node 11 [],
                             Node 12 [] ]
                    ]

zipperTree = zipper testTree

main = do
    putStrLn $ show $ zipperTree & downward branches & fromWithin traverse & downward root & focus .~ 999 & rezip
    putStrLn $ show $ zipperTree & downward branches & fromWithin traverse & tug rightward & downward branches & fromWithin traverse & tug rightward & tug rightward & view focus                    