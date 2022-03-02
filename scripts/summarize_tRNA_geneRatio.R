library(readr)
library(purrr)
library(tidyverse)
library(ggplot2)
library(cowplot)
data_dir = "gff3"
gff_files <- fs::dir_ls(data_dir, regexp = ".gff3$")

get_species <- function(filename){
  str_match(filename, 'gff3/(.*)\\.gff3')[,2]
}

gffall <- gff_files %>% map_dfr(read_tsv,
                                col_names=c("scaffold","source","feature","start","end","score","strand","frame","group"),
                                comment="#",show_col_types = FALSE,
                                .id = 'species') %>% filter(feature == "gene" | feature == "tRNA") %>%
          mutate(species = get_species(species))

counts = gffall %>% count(species,feature) %>% spread(key = feature,value = n) %>% mutate(proteingene=gene-tRNA,generatio=tRNA/(gene-tRNA))
counts

#counts %>% pivot_wider(names_from=species, values_from=count)

p <- ggplot(counts, aes(x=feature,y=count,color=species)) + geom_point()
