raw_data_1 <- read.csv("d_flower_matched.csv")
raw_data_2 <- read.csv("d_flower_not_matched.csv")

raw_data <- rbind(raw_data_1, raw_data_2)

averaged_data <- read.csv("sp_flowering_nitfix_neon.csv")

library(ggplot2)
for (site in sites) {
	species_list <- averaged_data[averaged_data$site == site,]$sp
	species_date_list <- averaged_data[averaged_data$site == site,]$doy_50_percentile
	x_axis_labels <- data.frame(x = species_list, y = species_date_list)
	print(species_list)
	tryCatch({
		ggplot(raw_data[raw_data$sp %in% species_list,], aes(x = as.Date(doy, origin = as.Date("2024-01-01")))) + geom_density() + scale_x_date(date_labels = "%b", date_breaks = "1 month") + ggtitle(site) + geom_vline(data = x_axis_labels, aes(xintercept = as.Date(y, origin = as.Date("2024-01-01"))), linetype = "dashed", color = "red") + annotate("text", x = as.Date(x_axis_labels$y, origin = as.Date("2024-01-01")), y = Inf, label = x_axis_labels$x, vjust = 0, hjust = 1.1, color = "gray", size = 3, angle = 45)
		ggsave(file = paste(site, ".pdf", sep  = ""))
		}, error=function(e){})
	}