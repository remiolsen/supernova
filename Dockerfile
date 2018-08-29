FROM debian:9

LABEL authors="remi-andre.olsen@scilifelab.se" \
    description="Docker image for 10X Supernova assembler" \
    version="2.1.0"

# Install container wide requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    unzip \
    rsync \
    procps

# Download and install Supernova (Note! this link will expire)
RUN cd /opt && \
    wget -O supernova-2.1.0.tar.gz "http://cf.10xgenomics.com/releases/assembly/supernova-2.1.0.tar.gz?Expires=1535584829&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9hc3NlbWJseS9zdXBlcm5vdmEtMi4xLjAudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNTM1NTg0ODI5fX19XX0_&Signature=RS1RjiKj7egwEStHh3ygm4b~OwxGWAC9Lk9XVzUW5OaalUfYhQuuUOe0iMJtz-59IGDdSddQM9t8QzS0~ryVyhebD5PFh6lj9wrelpmOVBGrs9j88LityO4GFmr97mxlhTRfBTVjFpY0lgP3IppZN-Rwa5DTAzTMLcmZ52Pa4o8wWobZ4sqZ1maDWn6zzFDKWDNnx12b9PnfEnVFxGGmXI-s1xe498E5CnRTvCocmzoWqNG2x28J7P3DaaFWik-3VQSEXuo8WvYEFLTa4ry1Ys4~r7H7-WTR4-h8zMN8KgrH0tODJJVkQ3MX69axKPFJhStPiZ9gGYx-41C0UeTJIg__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" && \
    tar zxf supernova-2.1.0.tar.gz && rm supernova-2.1.0.tar.gz
ENV PATH="/opt/supernova-2.1.0:$PATH"
