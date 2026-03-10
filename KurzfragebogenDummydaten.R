# Kurzfragebogen - Analysecode - Dummydaten

# Dummydaten deshalb, um kein data peeking oder andere fragewürdige Forschungspraktiken auszuführen, nicht einmal unbeabsichtigt.

(fragebogenLs <- list(
    F1="Es war finanziell schwierig für mich, Studiengebühren, Miete und Nahrungs- kosten aufzubringen.",
    F2="Die soziale Unterstützung durch Mitstudent/innen war gut.",
    F3="Die soziale Unterstützung durch meine engsten Freund/innen war gut.",
    F4="Die soziale Unterstützung durch meine Familie war gut.",
    F5="Ich hatte Zeit, mich auf das Studium zu konzentrieren, z.B. MUSSTE ich nicht aus finanziellen Gründen nebenher arbeiten.",
    F6="Grösstenteils fühlte ich mich emotional fähig, um mit den Herausforderungen des Psychologiestudiums umzugehen.",
    F7="Grösstenteils habe ich die psychologischen Ideen verstanden, die mir präsentiert wurden.",
    F8="Grösstenteils habe ich die statistischen Methoden verstanden, die mir präsentiert wurden.",
    F9="Im Allgemeinen war ich körperlich gesund.",
    F10="Die psychologische Forschung, die mir präsentiert wurde, war exzellent.",
    F11="Die didaktische Qualität, mit der die psychologische Forschung präsentiert wurde, war exzellent.",
    F12="Die didaktische Qualität, mit der die statistischen Methoden präsentiert wurden, war exzellent.",
    F13="Grösstenteils fühle ich mich sehr gut vorbereitet, das Psychologiestudium fortzusetzen.",
    F14="Ich bin glücklich über meine Wahl, Psychologie zu studieren.",
    F15="Es ist gut möglich, dass ich versuchen werde, mein Psychologiestudium als Doktorand/in fortzusetzen."))

# The data (= the answers):
set.seed(3)
realData <- sample(1:10, size = 15*13, replace=TRUE)
# df = data frame
df <- data.frame(matrix(data=realData, ncol=15, byrow=TRUE))
colnames(df) <- paste0("F", 1:15)
df

# Use some functions from some packages from the tidyverse
library(tidyverse)

dfL <- tidyr::pivot_longer(data=df, cols = everything(), names_to = "Frage")
dfL$Frage <- forcats::as_factor(dfL$Frage)
# Add extra column "students"
dfL$students <- rep(1:nrow(df), each=length(fragebogenLs))


# Barplots for each of the 15 questions
ggplot(data=dfL, aes(x=students, y=value)) +
    geom_bar(stat="identity") +
    # Show all barplots summarized in a single frame.
    facet_wrap(~Frage, nrow=4)

# Using lines for each student
# ggplot geom_point shapes: https://sape.inf.usi.ch/quick-reference/ggplot2/shape
ggplot(data=dfL, aes(x=Frage, y=value, group=1)) +
    geom_line() +
    geom_point(color="red", shape=15) +
    # Show all plots summarized in a single frame.
    facet_wrap(~students, nrow=6)

# If you want to have very compressed information (= a single summarizing result), visualizing the correlation matrix might be a good solution.
# cm = correlation matrix
cm <- cor(df)
# Load package ggcorrplot (install first, if not yet installed)
library(ggcorrplot)

(corPlot <- 
        ggcorrplot(
            cm,
            hc.order = FALSE,
            type = "lower",
            lab = TRUE,
            show.diag = FALSE,
            outline.col = "white",
            ggtheme = ggplot2::theme_gray()) +
        theme(
            legend.position = "top",
            axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
            axis.title.x.top = element_blank(),
            axis.text.x.top  = element_blank(),
            axis.title.y.right = element_blank(),
            axis.text.y.right  = element_blank()))

# If you are interested in detailed information of a correlation between two particular variables, maybe using (my) correlatio package is of help.
# Load package correlatio (install first, if not yet installed)
library(correlatio)
help(package="correlatio")

?correlatio::corrio
# 
# What are the questions?
questionnaireLs[c("F8", "F12")]

correlatio::corrio(data=df[,c("F8", "F12")])

# What does this detailed correlation plot show?


# Möglichkeit(en), diesen mit einem anderen Datensatz zu vergleichen:

# Anderer Datensatz aus selbem Seminar, selbe Fakultät, halbes Jahr vor diesem, selber Fragebogen, 'nur' auf Englisch.

(questionnaireLs <- list(
    Q1="Financially, it was difficult for me to pay for study fees, rent, and groceries.",
    Q2="I had good social support by other students.",
    Q3="I had good social support by my closest friend(s).",
    Q4="I had good social support by my family.",
    Q5="I had time to focus on studying psychology, e.g., did not HAVE TO work to financially support myself.",
    Q6="On average, I felt emotionally capable to deal with the challenges during studying psychology.",
    Q7="On average, I have understood the psychological ideas that were presented to me.",
    Q8="On average, I have understood the statistical methods that were presented to me.",
    Q9="Generally, I was physically healthy.",
    Q10="The psychological research that was presented to me, was excellent.",
    Q11="The pedagogical quality of how the psychological research was presented to me, was excellent.",
    Q12="The pedagogical quality of how the statistical methods were presented to me, was excellent.",
    Q13="On average, I feel very well prepared for continuing to study psychology.",
    Q14="I am happy with my choice of studying psychology.",
    Q15="It is likely that I will try to continue studying psychology as a doctoral student."))

# The data (= the answers):
# realData <- c(...) # Not yet!!! No data peeking, etc.!
set.seed(86)
# 11 Studierende füllten den Fragebogen aus.
realData <- sample(1:10, size = 15*11, replace=TRUE)
# df = data frame
df1 <- data.frame(matrix(data=realData, ncol=15, byrow=TRUE))
colnames(df1) <- paste0("F", 1:15)

df1L <- tidyr::pivot_longer(data=df1, cols = everything(), names_to = "Frage")
df1L$Frage <- forcats::as_factor(df1L$Frage)
# Add extra column "students"
df1L$students <- rep(1:nrow(df1), each=ncol(df1))

dfL$Zeit <- "HS25"
df1L$Zeit <- "FS26"

dfL2 <- dplyr::bind_rows(dfL, df1L)
dfL2$Zeit <- forcats::as_factor(dfL2$Zeit)
head(dfL2)
levels(dfL2$Frage)

ggplot(data=dfL2, aes(x=Frage, y=value, color=Zeit)) +
    geom_boxplot()
