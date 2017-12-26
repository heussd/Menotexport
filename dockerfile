FROM	python:2.7.14-jessie

WORKDIR	/usr/src/app

# Install tools
RUN		DEBIAN_FRONTEND=noninteractive  \
		apt-get update -qq && apt-get install --no-install-recommends -y sqlite3 poppler-utils

# Install python modules
RUN		pip install --no-cache-dir pypdf2 pandas pdfminer numpy beautifulsoup4

COPY	lib/ ./lib
COPY	*.py *.sh LICENSE ./

CMD		[ "python", "menotexport.py", "--help" ]
