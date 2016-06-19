## Generate a cached matrix for which the inversed matrix is being calculated
## 

## Generate the cached matrix and also define the function (solve) 
## which tries to create the inverted matrix
makeCacheMatrix <- function(x = matrix()) {
  inverseMatrix <<- NULL
  setCacheMatrix <- function(y){
    x <<- y
  }
  getCacheMatrix <- function() x
  setInverseMatrix <- function(solve) inverseMatrix <<- solve
  getInverseMatrix <- function() inverseMatrix
  list(setCacheMatrix = setCacheMatrix, getCacheMatrix = getCacheMatrix, 
       setInverseMatrix = setInverseMatrix, getInverseMatrix = getInverseMatrix)
}


## The funtion will try to generate the inverted matrix and both reacts on both an 
## already made attempt to invert (with no change) to the cached matrix and on a yet
## uninverted cached matrix


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverseMatrixCached <- x$getInverseMatrix()
  if(!is.null(inverseMatrixCached))
  {
    message("getting cached inversed matrix")
    return(inverseMatrixCached)
  }
  matrixCached <- x$getCacheMatrix()
  inverseMatrixCached <- (solve(matrixCached))
  x$setInverseMatrix(inverseMatrixCached)
  inverseMatrixCached
}
