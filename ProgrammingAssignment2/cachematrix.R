## The two functions below are necessary to calculate the inverse of a matrix 
## taking advantage of the cache memory. The input matrix must be invertible!

## The makeCacheMatrix function receives a matrix as input and creates a special matrix, that is really a list containing a function to
##	1. set the values of the matrix
##	2. get the values of the matrix
##	3. set the values of the inverse
##	4. get the values of the inverse

makeCacheMatrix <- function(x = matrix()) {
			  xinv <- NULL
			  set <- function(y) {
				x <<- y
				xinv <<- NULL
			  }
			  get <- function() x
			  setsolve <- function(solve) xinv <<- solve
			  getsolve <- function() xinv
			  list(set = set, get = get,
				   setsolve = setsolve,
				   getsolve = getsolve)
  }

## The cacheSolve function calculates the inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse 
## from the cache and skips the computation. Otherwise, it calculates the inverse of the data and sets 
## the value of the inverse in the cache via the setsolve function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		xinv <- x$getsolve()
            if(!is.null(xinv)) {
                    message("getting cached data")
                    return(xinv)
            }
            data <- x$get()
            xinv <- solve(data, ...)
            x$setsolve(xinv)
            xinv
			
}
