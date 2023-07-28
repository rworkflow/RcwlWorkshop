FROM bioconductor/bioconductor_docker:devel

RUN apt-get update \
        && apt-get install -y cwltool \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

#RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE)"

RUN Rscript -e 'BiocManager::install(c("knitr", "rmarkdown", "pkgdown"))'

RUN Rscript -e 'BiocManager::install(c("RcwlPipelines", "ReUseData"))'

## fix current bug
RUN Rscript -e 'devtools::install_version("reticulate", "1.28")'

#RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); devtools::install('.', dependencies=FALSE, build_vignettes=TRUE, repos = BiocManager::repositories())"
