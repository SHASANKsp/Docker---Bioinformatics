# Docker - Bioinformatics
Repository for Docker related files.

Building docker images for bioinformatics tools and further initializing the docker container to use the imagee for some of it's basic steps.


##### Basic workflow to make a docker image for any software working in linux:
A. Linux base image: 
   FROM ubuntu:20.04
Select a Linux distribution, you can use an official Ubuntu, Debian, or Alpine Linux image. 
This depends on the requirements of the software.

2. Working directory: 
   WORKDIR /app
Working directory inside the Docker image.

3. Copy the software files: 
   COPY software /app
Copy the necessary files of the software into the Docker image. 
This may include installation files, binaries, or any other required files.

4. Installing dependencies of the software: 
   RUN apt-get update && apt-get install -y <package_name>
If the software has any dependencies, you need to install them inside the Docker image.

5. Expose required ports (if any): 
   EXPOSE <port_number>
If the software requires specific ports to be accessible.

6. Define the startup command: 
   CMD ["<startup_command>"]
Specify the command that should be executed when a container based on the image is launched. 
Check the documentation for the appropriate startup command.

7. Build the Docker image: 
   docker build -t <image_name>:<tag> .
Open a terminal go to your project directory (with the Dockerfile).
Run the docker duild command with the image name and version.

8. Run container:
docker run -p PORT_ON_SYSTEM:PORT_ON_CONTAINER <image_name>:<tag>
You can create and run containers based on it using the docker run command.


  ################################################### Dockerfile
FROM ubuntu:20.04
WORKDIR /app
COPY software /app
RUN apt-get update && apt-get install -y <package_name>
EXPOSE 3500
CMD ["<startup_command>"]

##################################################### Shell
docker build -t random:0.0.1 .
docker run -p 3500:3500 random:0.0.1




### List of Docker images: (in development)

