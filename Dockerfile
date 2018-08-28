FROM debian:9 

LABEL authors="remi-andre.olsen@scilifelab.se" \
    description="Docker image for 10X Supernova assembler" \
    version="2.1.0"

# Install container wide requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    unzip \
    rsync

# Download and install Supernova (Note! this link will expire)
RUN cd /opt && \
    wget -O supernova-2.1.0.tar.gz "http://cf.10xgenomics.com/releases/assembly/supernova-2.1.0.tar.gz?Expires=1535496581&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9hc3NlbWJseS9zdXBlcm5vdmEtMi4xLjAudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNTM1NDk2NTgxfX19XX0_&Signature=HTsVU9GBJjulxQ0f2jK4ejLddbSG6RIAVl9Ogk7PJS9LniGuYKqUpBow46Wh4HOuAEvIkh~0CSSEMw~hSlQxg5RlQxRWFTQre6ruJ0zbVfJ9VZWJaZYdQta~~LGEhjtWaVuDEn8hj2vIrety-hdQztVJ0Cf~9e0uPDQlCjIHHLBlctJwnuU25fBYlcaRcErbvjKpBXm16JsLXikLf3odsmKYm894g-0vDir34ToFYM2Fy5VYouZo5jd0JulCpLxJ2zC6XwDbUVbCak~x95VtLBost597m1uVvsyQhKfezjoiX7x9-JyWS~iKE14MsXp7sb5kaEmPF2ANxxeJ0nk-DA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" && \
    tar zxf supernova-2.1.0.tar.gz && rm supernova-2.1.0.tar.gz
ENV PATH="/opt/supernova-2.1.0:$PATH"
