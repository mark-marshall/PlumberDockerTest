# start from the rocker/r-ver:3.5.0 image
FROM trestletech/plumber

# install plumber and openair
RUN R -e "install.packages(c('openair'))"

# copy everything from the current directory into the container
COPY plumber.R /

# open port 80 to traffic
EXPOSE 8000

# when the container starts, start the main.R script
ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('plumber.R'); pr$run(host='0.0.0.0', port=8000)"]