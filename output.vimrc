autocmd BufEnter *.vimrc,*.tex,*.java iabbr <buffer> xxfor1 
\<CR>for(int i=0; i<10; i++){
\<CR>}

autocmd BufEnter *.vimrc,*.tex,*.java iabbr <buffer> xxfor2 
\<CR>for(int j=0; j<10; j++){
\<CR>for(int k=0; k<10; k++){
\<CR>System.out.println("cool")
\<CR>}
\<CR>}

autocmd BufEnter *.vimrc,*.tex,*.java iabbr <buffer> xxmat 
\<CR>A= \begin{bmatrix}
\<CR>1 & 2 & 3\\
\<CR>4 & 5 & 6\\
\<CR>7 & 8 & 9
\<CR>\end{bmatrix}

