#install.packages("readtext")
#install.packages("stylo")
#install.packages("networkD3")

library("readtext")
library("stylo")
library("networkD3")

#creation corpus as dataframe
folder<-"EAPtexts"
alltexts <- list.files(path=folder)
df <- data.frame(Testo = c(readtext::readtext("EAPtexts/*.txt")))    
corpus_df <- data.frame(Titolo = c(df$Testo.doc_id), Testo = c(df$Testo.text)) #texts as dataframe

#create corpus as .RData
EAP_texts <- paste(corpus_df, collapse = "\n")
save(EAP_texts, file = "EAP_texts.RData")
View("EAP_texts.RData")

#move file
corpus_file <- list.files(pattern = "EAP_texts.RData")
file.copy(corpus_file, "Corpora/", recursive = T)
unlink(corpus_file)

#preparation for stylo analysis

# assign IDs to texts
num_rows = nrow(corpus_df)
ID <- c(1:num_rows)
corpus_df <- cbind(ID, corpus_df) #unification
all_texts <- corpus_df$Testo[corpus_df$ID]

# remove too short texts
exclude <- which(corpus_df$length < 2000) #it results "integer (empty) so all have more than 2000 words

#texts' tokenization
tokenized_texts <- lapply(all_texts, function(x) txt.to.words.ext(x, corpus.lang = "English"))
names(tokenized_texts) <- paste(corpus_df$Titolo)
texts <- tokenized_texts[sort(names(tokenized_texts))]

#stylometry analysis: dendogram
stylo(parsed.corpus = texts, 
      mfw.min=100,
      mfw.max=2000,
      mfw.incr=100,
      distance.measure="dist.delta",
      analysis.type="CA")

#network visualization
stylo.network(parsed.corpus = texts)

# clean up files maintaining .csv as preparation for gephi
unlink(c("*.txt"))

#move files
my_files <- list.files(pattern = ".csv")
file.copy(my_files, "Corpora/", recursive = T)
unlink(my_files)

#stylometry analysis: consensus tree
stylo(parsed.corpus = texts,
      mfw.min=100, 
      mfw.max=2000,
      mfw.incr=100,
      distance.measure="dist.wurzburg",
      analysis.type="BCT")

#clean up files
unlink(c("*.txt"))

#once R gives the plot (dendogram) and the network, they can be saved and moved to the folder Results:
#results <- list.files(pattern = ".png") #or (pattern = ".html") for the network
#file.copy(results, "Corpora/", recursive = T)
#unlink(results)