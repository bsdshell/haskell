import Graphics.UI.GLUT

main::IO()
main = do
    (_progName, _args) <- getArgsAndInitialize
    _window <- createWindow "OpenGL Vertex and Color in Haskell"
    displayCallback $= display
    mainLoop

display::DisplayCallback
display = do
    let color3f r g b = color $ Color3 r g (b::GLfloat)
        vertex3f x y z = vertex $ Vertex3 x y (z::GLfloat)
    clear [ColorBuffer]
    renderPrimitive Quads $  do
        color3f 1 1 0
        vertex3f 0 0 0
        vertex3f 0 0.2 0
        vertex3f 0.2 0.2 0 
        vertex3f 0.2 0 0 

        color3f 0 1 0.5 
        vertex3f 0 0 0
        vertex3f 0 (-0.2) 0
        vertex3f 0.2 (-0.2) 0 
        vertex3f 0.2 0 0

        color3f 0 0.5  1
        vertex3f 0 0 0
        vertex3f 0 (-0.2) 0 
        vertex3f (-0.2) (-0.2) 0 
        vertex3f (-0.2) 0 0 

        color3f 0.3 0.3 0.3 
        vertex3f 0 0 0 
        vertex3f 0 0.2 0
        vertex3f (-0.2) 0.2 0 
        vertex3f (-0.2) 0 0 
    flush
