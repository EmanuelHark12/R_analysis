library(tidyverse)

df <- read.csv("data/american_poll/nonvoters_data.csv")

df$income_cat  <- forcats::fct(df$income_cat)
df$income_cat  <- forcats::fct_relevel(df$income_cat,c("Less than $40k","$40-75k","$75-125k","$125k or more"))

df$educ  <- forcats::fct(df$educ)
df$educ  <- forcats::fct_relevel(df$educ,c("High school or less","Some college","College"))

head(df)
print(names(df))
#summary(df)

# PARTE 1

table(df$income_cat) # CATEGORIA DE SALÁRIO ANUAL
prop.table(table(df$income_cat))
#income_cat      -- people -- percentage -- census percentage
# Less than $40k -- 1418   -- 24.29%     -- 25.1%
# $40-75k        -- 1396   -- 23.92%     -- 24.1%
# $75-125k       -- 1628   -- 27.89%     -- 21.0%
# $125k or more  -- 1394   -- 23.88%     -- 29.8%


table(df['ppage']) # IDADE

table(df['race']) # RAÇA
prop.table(table(df$race))
# race        -- people -- percentage -- census percentage
# Other/Mixed -- 381    --  6.52%     --  8.40%
# Black       -- 932    -- 14.96%     -- 12.40%
# Hispanic    -- 813    -- 13.93%     -- 18.70% 
# White       -- 3710   -- 63.57%     -- 61.30%

table(df['gender']) # GÊNERO
prop.table(table(df$gender))
# gender -- people -- percentage -- census percetage
# Female -- 2896   -- 49.62%     -- 50.8%
# Male   -- 2940   -- 50.37%     -- 49.2%

table(df['educ']) # NÍVEL EDUCACIONAL
prop.table(table(df$educ))
#educ                 -- people -- percentage -- census percentage  
# High school or less -- 1796   -- 30.77%     -- 39.4%
# Some College        -- 1710   -- 29.30%     -- 28.5%
# College             -- 2330   -- 39.92%     -- 32.1%

#

table(df$gender,df$educ)
prop.table(table(df$gender,df$educ),2)
table(df$gender,df$income_cat)
table(df$educ,df$gender)
table(df$race,df$income_cat)
table(df$race,df$gender)
table(df$educ,df$income_cat)


table_income <- ggplot2::ggplot(df, ggplot2::aes(x = income_cat)) +
  ggplot2::geom_bar()
print(table_income)
table_ppage <- ggplot2::ggplot(df, ggplot2::aes(x = ppage)) +
  ggplot2::geom_bar()
print(table_ppage)
table_race <- ggplot2::ggplot(df,ggplot2::aes(x = race)) +
    ggplot2::geom_bar()
print(table_race)
table_race <- ggplot2::ggplot(df,ggplot2::aes(x = gender)) +
    ggplot2::geom_bar()
print(table_race)
table_educ <- ggplot2::ggplot(df,ggplot2::aes(x = educ)) +
    ggplot2::geom_bar()
print(table_educ)

# Primeiramente, como dados comparativos