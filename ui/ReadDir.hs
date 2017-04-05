module ReadDir(Src(..), readSrc, FileSrc(..)) where

import Control.Monad
import System.Directory
import System.FilePath

data FileSrc = FileSrc 
    { fileSrcPath :: FilePath
    , fileSrcName :: String    
    } deriving (Eq, Show)

read1 :: FilePath -> IO [FileSrc]
read1 root = do
    files <- listFiles root
    return $ fmap (\x -> FileSrc x (takeBaseName x)) files

read2 :: FilePath -> IO [(String, [FileSrc])]
read2 root = do
    dirs <- listDirs root
    mapM (\x -> fmap (\files -> (takeBaseName x, files)) $ read1 x) dirs

listDirs :: FilePath -> IO [FilePath]
listDirs x = filterM doesDirectoryExist . fmap (x </>) =<< listDirectory x

listFiles :: FilePath -> IO [FilePath]
listFiles x = filterM (fmap not . doesDirectoryExist) . fmap (x </> ) =<< listDirectory x

listDirectory = fmap (filter ((/= '.') . head)) . getDirectoryContents

--------------------------------------------------------
--

pads = "test/units/pads"
midis = "test/units/v-midis"
noisers = "test/units/noisers"

data Src = Src
    { srcPads :: [(String, [FileSrc])]
    , srcNoisers :: [FileSrc]
    , srcMidis :: [(String, [FileSrc])]
    }

readSrc :: IO Src
readSrc = Src <$> readPads <*> readNoisers <*> readMidis

readPads = read2 pads
readNoisers = read1 noisers
readMidis = read2 midis
