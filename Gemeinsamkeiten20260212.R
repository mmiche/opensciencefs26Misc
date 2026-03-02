library(ggplot2)
# install.packages("ggbeeswarm")
library(ggbeeswarm)
library(rstatix)
library(ggpubr)

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

c(mean(group1), mean(group2))

## ----ttest2sided---------------------------------------------------
t.test(x=group2, y=group1, alternative = "two.sided", var.equal=TRUE)

# Visualization: ttest2sided

ggpaired(
        simulateDf, x = "groups", y = "measured", color = "groups", palette = "jco", 
        line.color = "gray", linewidth = 0.4, ylim = c(-2, 8)) +
    labs(x="Groups", y="Measured score", title = "Two-sided independent t-test")


## ----anova--------------------------------------
summary(aov(measured ~ groups, data = simulateDf))

# Visualization: anova

# https://visualstats.bryer.org/anova.html
ggplot(simulateDf, aes(x = groups, y = measured)) +
    geom_boxplot() + 
    geom_beeswarm(aes(color = groups)) + 
    theme_bw() + theme(legend.position = 'none')


## ----simpleLinReg------------------------------
summary(lm(measured ~ groups, data = simulateDf))

# Visualization: simple linear regression

simulateDf$groupsChar <- as.character(factor(simulateDf$groups, levels=c("group1", "group2"), labels=c(0,1)))
simulateDf$groupsNum <- as.numeric(simulateDf$groupsChar)
ggplot(simulateDf) +
    aes(x = groupsNum, y = measured) +
    geom_point(shape = 1) +
    geom_smooth(color = "blue", 
                method = lm, se = FALSE)
