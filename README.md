# Use R to Create and Execute Reproducible CWL Workflows for Genomic Research

Authors:
	Qian Liu ^[Roswell Park Comprehensive Cancer Center],
    Another Author^[Roswell Park Comprehensive Cancer Center].
    <br/>
Last modified: July 27, 2023.

### Pre-requisites

- Basic familiarity with DNA-seq data variant calling 
- Interest of using workflow language 

### Workshop Participation

The workshop format is a 45 minute session consisting of hands-on demos, exercises and Q&A.

### R / Bioconductor packages used
- ReUseData
- RcwlPipelines
- Rcwl

## Workshop: Somatic variant calling

For the somatic variant calling, we will need to prepare the following: 

- Experiment data 
  - In the format of `.bam`, `.bam.bai` files
- ReUsable Genomic data 
  - reference sequence file (`b37` or `hg38`)
  - Panel of Normals (PON) (ref)[https://gatk.broadinstitute.org/hc/en-us/articles/360035890631-Panel-of-Normals-PON-]
- Software tool: 
  - Here we use `Mutect2`to Call somatic SNVs and indels via local assembly of
    haplotypes. (ref)[https://gatk.broadinstitute.org/hc/en-us/articles/360037593851-Mutect2]

We also want to have the data analysis workflow to be reproducible:  

1. Software tool properly tracked for version, docker image etc.
2. Data provenance properly tracked for public data resources for: 
	- workflow reproducibility
	- later reuse in other similar projects

The first can be solved by workflow languages (e.g., CWL, WDL,
snakemake, etc.). There is no similar tools for the 2nd task. 

In this workshop, I will demostrate two _Bioconductor_ packages:
`Rcwl` as an R interface for `CWL`, and `RcwlPipelines` for >200
pre-built bioinformatics tools and best practice pipelines in _R_,
that are easily usable and highly customizable. I will also introduce
a _R/Bioconductor_ package `ReUseData` for the management of reusable
genomic data.

With these tools, we should be able to conduct reproducible data
analysis using commonly used bioinformatics tools (including
command-line based tools and _R/Bioconductor_ packages) and validated,
best practice workflows (based on workflow languages such as CWL)
within a unified _R_ programming environment.


