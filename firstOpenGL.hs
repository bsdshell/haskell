import Graphics.UI.GLUT

myPoints::[(GLfloat, GLfloat, GLfloat)]
myPoints = [(sin(2*pi*k/12), cos(2*pi*k/12), 0) | k <- [1..12]]

main::IO()
main = do
    (_progName, _args) <- getArgsAndInitialize
    _window <- createWindow "Hello World"
    displayCallback $= display
    mainLoop

display::DisplayCallback
display = do
    clear [ ColorBuffer]
    renderPrimitive Triangles$ mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) myPoints
    flush
