# 🤠 PDS Engineering: Roundup
# ============================

FROM nasapds/pds-github-actions-base:latest


# Metadata
# --------

LABEL "com.github.actions.name"="PDS Roundup"
LABEL "com.github.actions.description"="🤠 PDS Roundup is the continuous integration and delivery system for the Planetary Data System 🤠"
LABEL "com.github.actions.icon"="circle"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/NASA-PDS/roundup-action.git"
LABEL "homepage"="https://pds-engineering.jpl.nasa.gov/"
LABEL "maintainer"="Sean Kelly <kelly@seankelly.biz>"


# Image Details
# -------------

WORKDIR    /usr/src/roundup
COPY       README.md CHANGELOG.md LICENSE.txt setup.cfg setup.py ./
COPY       src/ ./src
RUN        python3 setup.py --quiet install --optimize=2
ENTRYPOINT ["/usr/local/bin/roundup"]
