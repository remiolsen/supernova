FROM debian:9

LABEL authors="remi-andre.olsen@scilifelab.se" \
    description="Docker image for 10X Supernova assembler used by the nf-core/neutronstar pipeline" \
    version="2.1.1"

# Install container wide requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    unzip \
    rsync \
    procps \
    bsdtar

# Download and install Supernova (Note! this link will expire)
RUN cd /opt && \
    supernova-2.1.1.tar.gz "http://cf.10xgenomics.com/releases/assembly/supernova-2.1.1.tar.gz?Expires=1547261111&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9hc3NlbWJseS9zdXBlcm5vdmEtMi4xLjEudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNTQ3MjYxMTExfX19XX0_&Signature=Ew-5BLGJkb7nHDgi6e76ZVW9AkgVOD6-KqDYJcMQEXZ5Bx55TqYkKieo83xyCft4St4jc99~vAf7iPTBRFu~BR5w58IxPxYh2Deo4vT2eoEbYkHcCow66PFipsiNa6OYY95QRAoxStazToNHUEkH4cx8D4sm4NXa~AlbjxMAXXDjubkwQ0XIK0cHaFTkjudTvNtQkErodAyRvHjd7i54RdCbTQxlK4DHTiSzsBT-q8MuTBCeBiqQI9NPzqbedi1BXoDPSlMimV-C0II~hf4GiYjr32~PtxUHqW48UGvZPyS2~cvod-1HvGwPxE~XUYftHK6fNolPv9J8vXByZtA9yg__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" && \
    bsdtar xzf supernova-2.1.1.tar.gz && rm -r supernova-2.1.1.tar.gz
ENV PATH="/opt/supernova-2.1.1:$PATH"
