## Put comments here that give an overall description of what your
## functions do

## Function creates a list of functions for use in lexical scoping; it creates the means to cache a matrix inverse for the following function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
  ##defining the list of functions
  set <- function(y) {
    
    x <<- y
    
    m <<- NULL
    
  }
  
  get <- function() x
  
  setsolve <- function(solve) m <<- mean
  
  getsolve <- function() m

##Returning the list of functions
  
  list(set = set, get = get,
       
       setsolve = setsolve,
       
       getsolve = getsolve)

}


## Function which returns a matrix inverse by first checking if it has been calculated previously, and if not, calculating and returning the matrix inverse

cacheSolve <- function(x, ...) {
      
  ##checking whether inverse has been previously calculated and if so, returns that cached value
  m <- x$getsolve()
  
  if(!is.null(m)) {
    
    message("getting cached data")
    
    return(m)
    
  }

        ##if inverse has not been calculated, calculates inverse
  
  data <- x$get()
  
  m <- solve(data, ...)
  
  x$setsolve(m)
  
  m
  

}
