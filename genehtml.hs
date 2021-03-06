import Data.Char 
import Control.Monad
import System.IO
import System.Directory
import System.Environment
import Text.Regex.Posix
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import Data.Time.Clock.POSIX
import Data.Time
import Data.Time.Clock.POSIX

import AronModule

-- generate zsurface page, generate static page
-- generate static html page

array = [
        "Gmail Operator",
        "Regular Expression",
        "Difference between Mutex and Semaphore",
        "Multiple Thread LinkedList Queue HashMap",
        "Markov Chain Algorithm Generate Text",
        "Java Thread",
        "ffmpeg example",
        "Tableau Interview Questions",
        "Print Previous element from Binary Tree",
        "Tower Hanoi",
        "Polish Notation and Preporder Traveral",
        "Haskell Quick Sort",
        "OpenGL draw point",
        "OpenGL draw line",
        "OpenGL draw triangle",
        "OpenGL draw polygon",
        "OpenGL Vertex Array",
        "OpenGL Vertex Array Triangle",
        "Draw Triangle OpenGL IOS",
        "Message Queue",
        "Observer Pattern",
        "Publish Subscribe Pattern",
        "The beauty of Torus",
        "one proof a day 5",
        "one proof a day 4",
        "one proof a day 3",
        "one proof a day 2",
        "one proof a day 1",
        "Povray draw box",
        "Singleton in Java",
        "Maximum difference on an array",
        "Maximum Continuous Sum List",
        "Maximum non consecutive sum",
        "Auto Complete with Map and List",
        "The power of image",
        "Eight Queen Solver",
        "Java Lambda Expression",
        "Build Tree from pre and post",
        "Build Tree from preorder and inorder",
        "Serialize Binary Tree Ternary Tree",
        "Tokenize Simple XML",
        "Print All Binary",
        "Tokenize Simple XML",
        "Json Parser in Java",
        "Find the Lowest Common Ancestor in a Binary Tree",
        "Find a pair of elements from an array whose sum equals a given number",
        "Least Recent Used LRU in Java",
        "Array to Balanced BST",
        "Implement HashMap with array",
        "Find the First Non-Repeating Char from Stream Char",
        "Excel Column Header",
        "Minimum Distance Between two given words",
        "Set up Mutt for Gmail Account",
        "Throw Throws Throwable in Java",
        "Get All methods in Java",
        "Clone Skip List One pass or NO Extra Space",
        "Insert node to sorted list",
        "Graph Implementation",
        "Merge Sorted Array with Extra Space",
        "Google Pill Interview Question",
        "Nim Game",
        "Compress String",
        "Design URL shortener",
        "Design Vendor Machina",
        "Design Coin Change Machina",
        "Design Parking Lot",
        "Graph Loop and Path",
        "Range Query",
        "Find the maximum children of given tree",
      
        "Level order without queue",
        "Merge Sorted Single LinkedList",
        "Facebook Interview Question",
        "Carmichael Number",
        "Merge Intervals",
        "The power of next next",
        "Traversal Iteration",
        "Binary Iterator",
        "Debug With LLDB",
        "Count Occurrence pattern String",
        "Check Prime Number Algorithm",
        "Expedia Tech Interview",
        "Directed Graph",
        "Binary Tree Definition",
        "Fix Swap Two nodes in Binary Search Tree",
        "Swap Two nodes in Binary Search Tree",
        "Java Longest component",
        "Java Matrix Multiply",
        "Microsoft Tech Interview Questions",
        "Java Priority Heap",
        "C++ Copy Constructor",
        "C++ Clone Double Linked List",
        "C++ Clone Single Linked List",
        "C++ Single Linked List",
        "C++ All children at K dist from a Node",
        "C++ Print nodes at K distance from Root",
        "C++ Invert Binary Tree",
        "C++ Queue with Two Stacks",
        "C++ Multiply Long Integer",
        "C++ product of all integers except current one",
        "C++ Print Sprial from Rectangle",
        "C++ Rotate 2d array 90 degree",
        "C++ Draw Circle Using Symmetric property",
        "C++ Reverse Byte",
        "C++ Least Operation Add one Multiply two",
        "C++ Power of Two",
        "C++ Print All Binary With Binary Tree",
        "C++ Print All Binary",
        "C++ Decimal To Binary",
        "C++ Binary Tree Insert",
        "C++ Tries",
        "C++ Data Structure",
        "C++ Merge three sorted arrays",
        "C++ Merge two sorted arrays",
        "C++ overload Operator",
        "Java Lock Compare And Swap",
        "Java Join Thread",
        "Java Synchronize Thread",
        "Java Simple Thread",
        "Maximum internval overlap",
        "C++ find path in maze",
        "C++ Binary Search",
        "C++ Quick Sort",
        "C++ two stacks get minimum",
        "Generate n prime in C++",
        "C++ Smart Pointers",
        "C++ Double Linked List With Smart Pointer",
        "C++ Virtual Class",
        "C++ Dangling Pointer",
        "C++ Regular Expression",
        "Allocate 2D array in C and C++",
        "C and C++ unsigned Integer Gotcha",
        "C and C++ Tutorial",
        "Shell Script",
        "Magic Square Solver",
        "Sudoku Solver",
        "How to create animation gif",
        "Check Square Number in Java",
        "Bezier Curve", 
        "Property of determinant", 
        "Change Matrix Basis", 
        "Similar Matrix", 
        "Image Processing", 
        "Euler Formula", 
        "Computing determinant with cofactor expansion", 
        "Find the eigenvalue and eigenvector of 2 by 2 matrix", 
        "Find the eigenvalue of skew-symmetic matrix", 
        "From Matrix to Lie Group", 
        "Cubic Curve", 
        "Differentiated", 
        "Algebraic Curve", 
        "Projective Geometry",
        "Hermitian matrix has real eigenvalue value",
        "Proof On Some Sequences",
        "Mathematic Note",
        "Math Definition",
        "Square Root of Two is irrational", 
        "Square Root of Three is irrational", 
        "Visualize Binomial Theorem",
        "Binomial Identity",
        "Proof Fermat Little Theorem", 
        "Computer Graphic Matrix",
        "Functional Picture",
        "Compute the Determiant of 2x2 Matrix", 
        "How to solve the system equation", 
        "How to plot a linear equation", 
        "UIAlert in iOS",
        "TableViewController in iOS",
        "Switch different RootController",
        "IOS Center Two Button",
        "IOS Subdivision Curve",
        "IOS Capture Screenshot",
        "IOS Load Image",
        "IOS UIBezierPath closePath",
        "IOS Animation",
        "IOS Simple Animation",
        "IOS Bezier Curve",
        "IOS Stop Watch",
        "IOS Rotate Different CAShapeLayers",
        "IOS Anchor Point Bounds Frame",
        "IOS Rotate CAShapeLayer",
        "IOS Transform Rotation 3",
        "IOS Transform Rotation 2",
        "IOS Transform Rotation 1",
        "IOS CAShapeLayer Gradient",
        "IOS Draw Hexagon",
        "IOS Click Inside Circle or Rectangle",
        "IOS Remove CAShapeLayer",
        "IOS CAShaperLayer StrokeColor",
        "IOS Slide Up Controller",
        "IOS List Buttons",
        "IOS Different Fonts",
        "IOS Play Sound",
        "IOS Demo",
        "IOS Simple App Demo",
        "Rename Project in Xcode 6.1",
        "Touches Event in iOS",
        "Draw Circle Rectangle Oval in iOS", 
        "Xcode C++ Standard Library",
        "Xcode Shortcut Key",
        "Xcode Remove Add Unit Test",
        "Xcode Launch Screen File",
        "Xcode Change Build from iPhone iPad",
        "Xcode SnapShot Directory",
        "Xcode Remove Cache",
        "Xcode No such file or directory",
        "Xcode Screenshots",
        "Xcode Add Resource as Group",
        "Xcode Add Resource Bundle",
        "ObjectiveC pass double pointers",
        "ObjectiveC String Format Specifiers",
        "ObjectiveC Block",
        "ObjectiveC Static Method",
        "ObjectiveC Double and Triple Pointer",

        "Tries Data Structure",
        "Cycle Array",
        "Binary Tree",
        "Stack and Queue in Binary Tree",
        "Binary Search One Dimensions",
        "Binary Search Two Dimensions",
        "Longest Increasing Subsequence Recursion",
        "Coin Change Algorithm", 
        "Coin Change Dynamic Programming", 
        "Count Number of Way for Coin Change", 

        "Binary Tree Generate Graphviz file",
        "Binary Maximum Sum Path",
        "Binary Tree Mirror",
        "Binary Tree Isomorphic",
        "Binary Tree Symmetric",
        "Binary Tree Maximum Height",

        "Java Command Snippet",
        "Java Regular Expression",
        "Java Algorithm",
        "Java Data Structure",

        "C++ Data Structure",

        "Reverse a LinkedList in Java",
        
        "Haskell Install Remove GHCi On Mac OSX",
        "Haskell Tutorial",
        
        "Scala Tutorial", 
         
        "Blender Help",

        "Java Help Compile Package ClassPath",
        "Mac OSX Full Screen Tab-Command Not working",
        "Install Terminal Color Theme in Mac OSX",
        "Gradle add package name file",
        "Gradle Add resources folder to Project Layout",
        "Gradle Add Local Jar",
        "Intellij Add Resources or Test Directory",
        "Intellij Remove Base Package",
        "Intellij Import your package",
        "Intellij Add Java File",
        "Intellij Path Hell",
        "Intellij Change Class Output Path",
        "Intellij SetUp",
        "Intellij Add External Library",
        "Intellij Add Maven to proejct",
        "Intellij Add dependency to Maven",
        "Intellij Add Framework Support",
        "Intellij Add Scala SDK",

        "Prime Number",
        "Merge Two Sorted Array",
        "Print All Permutation of an Array",
        "Quick Sort in C and C++",
        "Print all combination of r in a given array of size n",
        "Shuffle algorithm in C++",
        "Rotated Sorted Array", 
        "Multiply Array in Dynamic Programming",
        "Multiply Long Integer",
        "Print Spiral in 2D array",

        "Install Maven in Mac OSX ",
        "Setup The Play Framework",
        "Vim Tricks",
        "Command Line Tricks",
        "Latex Matrix",
        "Latex Example",
        "English Note",
        "Daily Note"
        ] 

indexFile = "/Library/WebServer/Documents/zsurface/index.html"
left_li = "<li><a style=\"text-decoration:none;\" href=\""
href_li = "\"</a>"
last_li = "</li>"

host = "http://zsurface.com/html/"

htmlFile = "/Users/cat/myfile/github/haskell/text/index.html"
pageFile = "/Users/cat/myfile/github/haskell/text/page.html"
removeSpace::String->String
removeSpace s = filter(\x -> isSpace x == False) s 

htmlDir = "/Library/WebServer/Documents/zsurface/html"
newDir = "/Library/WebServer/Documents/zsurface/newhtml" 

-- print partition n [] will cause error since print needs concrete type 
-- split list to n blocks
partition::Int->[a]->[[a]]
partition _ [] = []
partition n xs = (take n xs) : (partition n $ drop n xs)

randomName::IO String
randomName = getPOSIXTime >>= \t  -> return( "/Library/WebServer/Documents/zsurface/html_" ++ (show $ ceiling t))

main = do 
        createDirectory newDir 
        allFiles <- listDirectory htmlDir 
        mapM print allFiles
        let files = take 200 allFiles 
        pList <- filterM(\x -> doesFileExist $ htmlDir ++ "/" ++ x) files 
        let fullList= map(\x -> htmlDir ++ "/" ++ x) pList 
        let newList = map(\x -> newDir ++ "/" ++ x) files 

        ffList <- mapM(\fn -> readFile fn >>=(\contents -> return(splitRegex(mkRegex "<!-- Column 2 start -->|<!-- Column 2 end -->") contents))) fullList

        let fileArray = map(\x -> "index" ++ (removeSpace x) ++ ".html") array
        let pathList  = map(\x -> htmlDir ++ "/" ++ x) fileArray
        let hostList  = map(\x -> host ++ x) fileArray
        let zipList   = zip hostList array
        let menuHtml  = map(\x -> left_li ++ (fst x) ++ href_li ++ (snd x) ++ last_li) zipList

--        print zipList
        let middle = ["<!-- Column 2 start -->\n<ul>"] ++ menuHtml ++ ["</ul>\n<!-- Column 2 end -->"]
        let contents = map(\l -> [head l] ++ middle ++ [last l]) ffList
        zipWithM(\fn list -> writeToFile fn list) newList contents 
--------------------------------------------------------------------------------------------------
        fl
        mapM print files
        fl 
        let files = take 200 $ drop 200 allFiles 
        pList <- filterM(\x -> doesFileExist $ htmlDir ++ "/" ++ x) files 
        let fullList= map(\x -> htmlDir ++ "/" ++ x) pList 
        let newList = map(\x -> newDir ++ "/" ++ x) files 

        ffList <- mapM(\fn -> readFile fn >>=(\contents -> return(splitRegex(mkRegex "<!-- Column 2 start -->|<!-- Column 2 end -->") contents))) fullList

        let fileArray = map(\x -> "index" ++ (removeSpace x) ++ ".html") array
        let pathList  = map(\x -> htmlDir ++ "/" ++ x) fileArray
        let hostList  = map(\x -> host ++ x) fileArray
        let zipList   = zip hostList array
        let menuHtml  = map(\x -> left_li ++ (fst x) ++ href_li ++ (snd x) ++ last_li) zipList

--        print zipList

        let middle = ["<!-- Column 2 start -->\n<ul>"] ++ menuHtml ++ ["</ul>\n<!-- Column 2 end -->"]
        let contents = map(\l -> [head l] ++ middle ++ [last l]) ffList
        zipWithM(\fn list -> writeToFile fn list) newList contents 
        fl
        mapM print files
        fl 

--        ----------------------------------------------------------------------------
--        -- write to index.html 
        linelist <- readFileToList htmlFile 
        let indexPage = map(\x -> if length (removeSpace x) > 0 then x else unlines menuHtml ) linelist
        writeToFile indexFile indexPage 
--        ----------------------------------------------------------------------------
        pagelist <- readFileToList pageFile 
        let htmlPage = map(\x -> if length (removeSpace x) > 0 then x else unlines menuHtml) pagelist 
        uniqueList <- filterM(\x -> doesFileExist x >>= \y -> return (y == False)) pathList 
        mapM(\x -> writeToFile x htmlPage) uniqueList 
--        ----------------------------------------------------------------------------
        oldHtmlName <- randomName
        print oldHtmlName
        renameDirectory htmlDir oldHtmlName 
        renameDirectory oldHtmlName htmlDir
--        ----------------------------------------------------------------------------
