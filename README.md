# RHODA-CI

RHODA-CI is a framework to test Red Hat Openshift Database Access features and functionality
using QE tiered testing.

# Requirements
  Linux distribution that supports Selenium automation of a chromium web browser using [ChromeDriver](https://chromedriver.chromium.org)
  * chromedriver binaries can be downloaded from https://chromedriver.chromium.org/downloads. The chromedriver version must match the installed version of chromium/google-chrome

# Quick Start
  1. Create a variables file for all of the global test values
     ```bash
     # Create the initial test variables from the example template variables file
     cp test-variables.yaml.example test-variables.yaml
     ```

  2. Edit the test variables file to include information required for this test run.
     You will need to add info required for test execution:

     * Openshift Console URL (Should be an OCP Cluster or a Cluster with default Namespace "_openshift-dbaas-operator_")
     * Test user credentials
     * Browser webdriver to use for testing


  3. Run this script which will create the virtual environment, install the required packages and kickoff the Robot test suite
    ```bash
    sh run_robot_test.sh
    ```
    This script is a wrapper for creating the python virtual environment and running the Robot Framework CLI.  You can run any of the test cases by creating the python virtual environment, install the packages in requirements.txt and running the `robot` command directly.
    To understand the various possible inputs to run_robot_test.sh, run it with _-h_ flag
    ```
    sh run_robot_test.sh -h
    ```


##### NOTE:
The code on this branch has been aligned to work with an OCP Cluster or a cluster whose default Namespace for RHODA Operator is _openshift-dbaas-operator_. Make sure you are providing appropriate Console URL to avoid false failures

# Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)

# RHODA-CI Container Image
See build [README](build/README.md) on how you can build a container to run RHODA-CI automation in OpenShift.

# License
This project is open sourced under MIT License.
