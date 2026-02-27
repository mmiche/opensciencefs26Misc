## ----simulate--------------------------------------------------------------------
# Ziehe 100 Werte von der Normalverteilung, mit Mittelwert 3, Standardabweichung 2.
set.seed(159)
group1 <- rnorm(n=100, mean=3, sd=2)
# Ziehe 100 Werte von der Normalverteilung, mit Mittelwert 4, Standardabweichung 2.
set.seed(159)
group2 <- rnorm(n=100, mean=4, sd=2)
# Erzeuge data.frame
simulateDf <- data.frame(groups=rep(c("group1", "group2"), times=c(100, 100)),
                         measured=c(group1, group2))


## ----ttest2sided---------------------------------------------------
t.test(x=group2, y=group1, alternative = "two.sided", var.equal=TRUE)


## ----anova--------------------------------------
summary(aov(measured ~ groups, data = simulateDf))


## ----simpleLinReg------------------------------
summary(lm(measured ~ groups, data = simulateDf))
