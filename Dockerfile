## To pull this image from the GitHub Container Repo, just do:
##
##   sudo docker pull ghcr.io/joshobrien/docker-r2u-spatial
##
## Build it with:
##
##   docker build . -t r2u-spatial:latest

FROM eddelbuettel/r2u:jammy

RUN apt-get update \
    && sudo apt-get install emacs -y \
    && sudo apt-get install tmux -y \
    ## Provision with spatial and other R packages
    ## (1) This in https://hub.docker.com/r/rocker/geospatial
    && install2.r RNetCDF terra wk hdf5r \
    && install2.r raster rgdal rgeos sf sp  geosphere \
    && install2.r ggplot2 sfheaders \
    && install2.r trip 
    
CMD ["bash"]
