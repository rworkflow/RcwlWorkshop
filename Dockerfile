FROM bioconductor/bioconductor_docker:devel

RUN apt-get update \
        && apt-get install -y cwltool \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE)"

RUN Rscript -e 'BiocManager::install(c("rworkflow/Rcwl", "rworkflow/RcwlPipelines", "rworkflow/ReUseData"))'

RUN Rscript -e 'BiocManager::install("VariantAnnotation")'

## fix current bug
RUN Rscript -e 'devtools::install_version("reticulate", "1.28")'

WORKDIR /opt/
RUN wget https://github.com/indigo-dc/udocker/releases/download/1.3.10/udocker-1.3.10.tar.gz
RUN tar zxvf udocker-1.3.10.tar.gz
RUN ln -sf /usr/bin/python3 /usr/bin/python
ENV PATH="/opt/udocker-1.3.10/udocker:$PATH"

WORKDIR /home/rstudio
#RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); devtools::install('.', dependencies=FALSE, build_vignettes=TRUE, repos = BiocManager::repositories())"
