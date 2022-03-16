# Web testing with robot framework

[![PyPI version][pypi-version]][pypi-link]

[![PyPI platforms][pypi-platforms]][pypi-link]

PyPI version PyPI platforms

** ADMIRATION FOR THE UNKNOW **

##Web automatic tests: many cases
=======================================================
Before, Keep your motivation and excitement level high!

### Clone this repository

    git clone https://github.com/caeltarifa/automatic_web_testing.git

### Pull the image.

    docker pull ypasmk/robot-framework
    
### Run the tests

##### Method 1: use docker-compose

    dos2unix robot-framework-docker/run-tests.sh && dos2unix robot-framework-docker/run_suite.sh (only windows user for to execute shell)    
    cd robot-framework-docker && docker-compose up
    
##### Method 2: use bash

    dos2unix robot-framework-docker/run-tests.sh && dos2unix robot-framework-docker/run_suite.sh (only windows user for to execute shell)
    cd robot-framework-docker && ./run_tests.sh
    

NOTE
-----

You can run the tests without cloning the repository by 
creating a docker-compose.yml file with the following content:

    version: '3.3'
    services:
        test:
            network_mode: host
            image: ypasmk/robot-framework
            shm_size: "256M"
            environment:
                USERNAME: Ipatios Asmanidis
            volumes: [
               "$PWD/output:/output",
               "$PWD/suites:/suites",
               "$PWD/scripts:/scripts",
               "$PWD/reports:/reports"
            ]

Afterwards, run the following command within the directory of 
your docker-compose file:

    docker-compose up


Contents
========

This image contains the following to facilitate robot testing

Xvfb
----

You can use it to start a visual display and fire up a browser for UI testing.
 
Example (suites/virtual_display.robot):

    Start Virtual Display    1920    1080
    

Selenium2Library
----------------

More details here  http://robotframework.org/Selenium2Library/Selenium2Library.html

Also have a look at **suites/virtual_display.robot**

HttpLibrary.HTTP
----------------

More details here https://github.com/peritus/robotframework-httplibrary

Example:

    Create Http Context     api.some-end-point.com
    GET                     /some/service/that/supports/get
    Verify Status           200
    ${response}=            Get Response Body
    [return]                ${response}
    
robotframework-sshlibrary
-------------------------

More details here http://robotframework.org/SSHLibrary/latest/SSHLibrary.html


robotframework-excellibrary
---------------------------

More details here http://navinet.github.io/robotframework-excellibrary/ExcelLibrary-KeywordDocumentation.html



**PASSION FOR DISCOVERY**

