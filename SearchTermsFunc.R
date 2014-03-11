require(stringr)
Chapter1 <- file("Chapter1.Rnw", "rt") 
Chapter1 <- readLines(Chapter1)

Term_w <- str_detect(string=Chapter1, pattern="\\\\term")
Term <- list()
for(i in 1:length(Chapter1[Term_w])){
line <- Chapter1[Term_w][i]
line_cleaned <- gsub("[\\{\\}]", "", regmatches(line, gregexpr("term\\{.*?\\}", line))[[1]])
line_term_cleaned <- gsub("term","",line_cleaned)
Term[[i]] <- line_term_cleaned
}

cat(unique(unlist(Term)),sep=",")


Func_w <- str_detect(string=Chapter1, pattern="\\\\func")
Func <- list()
for(i in 1:length(Chapter1[Func_w])){
line <- Chapter1[Func_w][i]
line_cleaned <- gsub("[\\{\\}]", "", regmatches(line, gregexpr("func\\{.*?\\}", line))[[1]])
line_term_cleaned <- gsub("func","",line_cleaned)
Func[[i]] <- line_term_cleaned
}

cat(unique(unlist(Func)),sep=",")

closeAllConnections()

