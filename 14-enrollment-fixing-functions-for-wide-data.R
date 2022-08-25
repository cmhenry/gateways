## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Create a function to make the enrollment variables usable in the wide data

enrollment_fix_wide <- function(df) {
  # get index of Enrollment columns
  enr_ii <- grep('ENR', colnames(df))
  
  # Convert negative enrollments to 0
  df[,enr_ii][df[,enr_ii] < 0] <- 0
  
  # Return data frame with zeroed out enrollments
  return(df)
}

