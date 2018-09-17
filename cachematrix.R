## makeCacheMatrix is a function that creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## cacheSolve is a function that takes value of special "matrix" created by makeCacheMatrix 
## above, and checks if there is any value in it or not.
## If the inverse matrix from makeCacheMatrix has a value, it should retrieve the inverse from the cache. 
## If inverse matrix from makeCacheMatrix((matrix) is empty, it gets the original matrix data from 
## and set the invertible  matrix by using the solve function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- mean(mat, ...)
  x$setInverse(inv)
  inv
}
