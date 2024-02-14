# NEON
Miscellaneous scripts for NEON sampling. Folders summarized as follows under subheadings.

## phenology
The `plots` subfolder contains density plots of all flowering data for species in each site, one site per plot. E.g., `DSNY.pdf` gives the plot for that site. The curve is a density estimate (essentially, a curvilinear histogram), based on all individual records available. Raw observations are available in `d_flower_matched.csv` (species-level IDs successfully matched to phenology data) and `d_flower_not_matched.csv` (genus-level data either not matched or not determined in the source; refer to the "type" column).

The red dotted lines mark the median flowering date for each site species. The labels overlap somewhat for species-rich sites. Check the raw medians in `sp_flowering_nitfix_neon.csv` for more detail. Keep in mind, these are ROUGH estimates based on USA_NPN/NEON, iNaturalist, and plantNet, not necessarily localized site-level estimates. 
 
`sampling_window_suggestions.xlsx` is a suggestion for each site that I made by hand -- please send feedback. `phenology.R` is the analysis script for the plots.
