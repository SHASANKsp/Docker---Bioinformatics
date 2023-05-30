#building the docker image
docker build -t <image_name>:<tag> .
#loading the image into the container and assining volume to assess the local files
docker run -it -v /path/to/local/files:/data <image_name>:<tag>
bedtools --version
#goes into the local data folder
cd /data
#intersecting two BED file
bedtools intersect -a file1.bed -b file2.bed