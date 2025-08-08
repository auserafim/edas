# parent image
FROM python:3.12

# default directory
WORKDIR /app 

# install jupyter notebook
RUN pip install jupyter

# Make port 8888 available to the world outside this container
EXPOSE 8888

COPY requirements.txt .

# install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Copy all the files to the container

COPY . .

# Env variable
ENV NAME=World

# default command to run when starting container from this image 
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

