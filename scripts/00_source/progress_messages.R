
for (i in 1:10) {
  cat(message("-"))
}

for (i in 1:10000) {cat("\r",i)}

for (i in 1:10) {Sys.sleep(1); cat("\r",i)}

for (i in 1:10) {Sys.sleep(1);cat(paste("-"))}
