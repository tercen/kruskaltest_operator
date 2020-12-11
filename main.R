library(tercen)
library(dplyr)

do.kruskal = function(df, ...) {
  pv = NaN
  
  grp <- unique(df$.group.colors)
  a <- df$.y[df$.group.colors == grp[1]]
  b <- df$.y[df$.group.colors == grp[2]]
  
  result = try(kruskal.test(a, b, ...), silent = TRUE)
  if(!inherits(result, 'try-error')) {
    statistic = result$statistic
    parameter = result$statistic
    p.value = result$p.value
  } 
  return (data.frame(.ri = df$.ri[1], .ci = df$.ci[1],
                     statistic = c(statistic), parameter = c(parameter), p.value = c(p.value)))
}

ctx = tercenCtx()

if (length(ctx$colors) < 1) stop("A color factor is required.")

df <- ctx %>% 
  select(.ci, .ri, .y) %>%
  mutate(.group.colors = do.call(function(...) paste(..., sep='.'), ctx$select(ctx$colors))) %>%
  group_by(.ci, .ri) %>%
  do(do.kruskal(.)) %>%
  ctx$addNamespace() %>%
  ctx$save()