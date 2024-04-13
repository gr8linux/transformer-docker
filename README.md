# Text Classification Transformer with Gradio Interface

This repository contains a Dockerized application for running a text classification model using Hugging Face's Transformers and Gradio. The application is designed to be run in a secure, containerized environment using Docker.

## Project Overview

This project uses a pre-trained model from Hugging Face's Transformers library to perform text classification. It includes a Gradio interface to allow users to interact with the model through a web interface. The Docker setup ensures that the application can be run in a consistent and isolated environment.

## Prerequisites

Before you build and run this Docker container, ensure you have the following installed:
- Docker: You can download it from [Docker's official website](https://www.docker.com/get-started).

## Building the Docker Image

To build the Docker image, navigate to the root directory of this project and run the following command:

```bash
docker build -t transformers-docker .
