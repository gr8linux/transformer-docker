
# Text Classification Transformer with Gradio Interface

This repository contains a Dockerized application for running a text classification model using Hugging Face's Transformers and Gradio. The application is designed to be run in a secure, containerized environment using Docker.

## Project Overview

This project uses a pre-trained model from Hugging Face's Transformers library to perform text classification. It includes a Gradio interface to allow users to interact with the model through a web interface. The Docker setup ensures that the application can be run in a consistent and isolated environment.

## Prerequisites

Before you build and run this Docker container, ensure you have the following installed:
- Docker: You can download it from [Docker's official website](https://www.docker.com/get-started).

## Building the Docker Image

To build the Docker image, navigate to the root directory of this project and run the following command:

```
docker build -t transformers-docker .
```

This command builds a Docker image named `transformers-docker` based on the instructions in the Dockerfile.

## Running the Container

Once the image is built, you can start the container using:

```
docker run -p 7860:7860 transformers-docker
```

This command runs the Docker container and maps port 7860 of the container to port 7860 on your host. This is the port used by the Gradio interface.

## Accessing the Application

After starting the Docker container, open a web browser and go to `http://localhost:7860` to access the Gradio interface. You can now interact with the text classification model.

## Contributing

Contributions to this project are welcome! Please fork the repository and submit a pull request with your proposed changes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
