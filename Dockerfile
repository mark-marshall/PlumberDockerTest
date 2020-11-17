# start from the rocker/r-ver:3.5.0 image
FROM trestletech/plumber

# install plumber and openair
RUN R -e "install.packages(c('plumber','openair'))"

# copy everything from the current directory into the container
COPY / /

# open port 80 to traffic
EXPOSE 80

# when the container starts, start the main.R script
ENTRYPOINT ["Rscript", "Main.R"]