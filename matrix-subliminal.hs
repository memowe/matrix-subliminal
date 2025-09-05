module Main where

import Options.Applicative

data Input = Input  { delay     :: Int
                    , messages  :: [String]
                    } deriving Show

argsParser :: Parser Input
argsParser = Input <$> delayP <*> msgsP
  where delayP  = option auto
                    (   long "delay"
                    <>  short 'd'
                    <>  metavar "MICROSECONDS"
                    <>  help "Optional delay between updates (default: 80000)"
                    <>  value 80000
                    )
        msgsP   = many (argument str
                    (   metavar "MESSAGES"
                    <>  help "Subliminal messages like \"YOLO\" \"The end is near\""
                    ))

main :: IO ()
main = do
  args <- execParser $ info (argsParser <**> helper) fullDesc
  print args
