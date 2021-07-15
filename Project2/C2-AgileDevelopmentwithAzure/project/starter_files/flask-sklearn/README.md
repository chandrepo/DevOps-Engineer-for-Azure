# Overview
[![Python application test with Github Actions](https://github.com/chandrepo/DevOps-Engineer-for-Azure/actions/workflows/pythonapp.yml/badge.svg)](https://github.com/chandrepo/DevOps-Engineer-for-Azure/actions/workflows/pythonapp.yml)
[![Build Status](https://dev.azure.com/chandyadlapalli/flask-ml-service-cd/_apis/build/status/chandrepo.DevOps-Engineer-for-Azure?branchName=master)](https://dev.azure.com/chandyadlapalli/flask-ml-service-cd/_build/latest?definitionId=9&branchName=master)
 This project is about Implementing the continuous integration(CI) using GitHub Actions and continuous delivery(CD) for a Python-based machine learning application using the Flask web framework.


## Project Plan
* A link to a Trello board for the project
  * [Trello Board URL] (https://trello.com/b/CytbVR5I/flask-ml-web-application)
* A link to a spreadsheet that includes the original and final project plan
  * [Project Plan URL] (https://github.com/chandrepo/DevOps-Engineer-for-Azure/blob/master/Project2/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/project-management-template.xlsx)

## Instructions

* Architectural Diagram

![image](https://user-images.githubusercontent.com/32601965/125748304-b01f4dbc-f4c5-412f-8901-6c067543322f.png)



<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service
  ![image](https://user-images.githubusercontent.com/32601965/125204139-593d5f00-e299-11eb-8054-17c1aa00b125.png)
  ![image](https://user-images.githubusercontent.com/32601965/125204162-783bf100-e299-11eb-81ca-f2f8fb1178dd.png)
  ![image](https://user-images.githubusercontent.com/32601965/125204179-973a8300-e299-11eb-9cad-4f65c3729a7c.png)
  ![image](https://user-images.githubusercontent.com/32601965/125204401-bede1b00-e29a-11eb-88ac-68b31e0033e9.png)
  ![image](https://user-images.githubusercontent.com/32601965/125204391-aec63b80-e29a-11eb-9ef5-4978cfedeefb.png)


* Project cloned into Azure Cloud Shell
  * Open Azure Cloud Shell and generate the ssh key pair.
    ![image](https://user-images.githubusercontent.com/32601965/125200175-5c2f5400-e287-11eb-8f27-73ef8f0a84a9.png)
  * Copy the public SSH key from path ~/.ssh/id_rsa.pub and paste to github.com 
  * Clone the git repository using following command as shown below
    Command: git clone git@github.com:chandrepo/DevOps-Engineer-for-Azure.git     
    ![image](https://user-images.githubusercontent.com/32601965/125200487-0fe51380-e289-11eb-9d35-431b962b96e4.png)


* Passing tests that are displayed after running the `make all` command from the `Makefile`
  ![image](https://user-images.githubusercontent.com/32601965/125203923-6148cf00-e298-11eb-82f0-add0ba58a0c8.png)
  ![image](https://user-images.githubusercontent.com/32601965/125203933-6ad23700-e298-11eb-8dc3-c7893e652a8d.png)
  ![image](https://user-images.githubusercontent.com/32601965/125203938-6f96eb00-e298-11eb-8ef4-e9041aaec03f.png)
  ![image](https://user-images.githubusercontent.com/32601965/125203942-74f43580-e298-11eb-8fa2-2f5644deb2de.png)



* Output of a test run
  ![image](https://user-images.githubusercontent.com/32601965/125204321-48411d80-e29a-11eb-91d9-b6957700a689.png)
  ![image](https://user-images.githubusercontent.com/32601965/125204388-a53cd380-e29a-11eb-8eba-b12e85e81f5a.png)
* Load test flask ml application using Locust
  Create python virtual environment using following commands
    python -m venv .locust
    source .locust/bin/activate on Linux or source .locust/Scripts/activate on Windows
    run locust on Linux or locust.exe on Windows
  ![image](https://user-images.githubusercontent.com/32601965/125228569-a4d02700-e2f2-11eb-8f87-72ff6e45783f.png)
  ![image](https://user-images.githubusercontent.com/32601965/125228618-ba455100-e2f2-11eb-8720-f25ce12f8a06.png)



* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).
  * Creating the project for 

* Running Azure App Service from Azure Pipelines automatic deployment
  ![image](https://user-images.githubusercontent.com/32601965/125219454-629ee980-e2e2-11eb-9e18-ccb5ba59a902.png)
  ![image](https://user-images.githubusercontent.com/32601965/125219712-e527a900-e2e2-11eb-86ba-4df4d6495ad5.png)
  ![image](https://user-images.githubusercontent.com/32601965/125219805-215b0980-e2e3-11eb-843a-743cd523c2c1.png)


* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:
![image](https://user-images.githubusercontent.com/32601965/125219304-384d2c00-e2e2-11eb-8d8a-5ea4d4dab92d.png)




* Output of streamed log files from deployed application
![image](https://user-images.githubusercontent.com/32601965/125229156-c4b41a80-e2f3-11eb-9f2b-89e899399b28.png)
![image](https://user-images.githubusercontent.com/32601965/125229103-aa7a3c80-e2f3-11eb-90cd-eb89f1ebfe81.png)
![image](https://user-images.githubusercontent.com/32601965/125229364-4310bc80-e2f4-11eb-8597-79c29fa164d2.png)
![image](https://user-images.githubusercontent.com/32601965/125229446-73f0f180-e2f4-11eb-99d1-0ce234760840.png)



> 

## Enhancements

Containerization of Python-based machine learning flask application using docker and push the image to Azure container registry.

Operationalize the Python-based machine learning flask application using Azure Kubernetes service, Azure Container registry and Azure DevOps pipeline.

## Demo 

<TODO: Add link Screencast on YouTube>


