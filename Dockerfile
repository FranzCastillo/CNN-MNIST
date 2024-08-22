FROM python:3.12

# Dependencies Intall and Update
RUN apt-get update && apt-get install -y \
    build-essential \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

# Install any additional dependencies if needed
RUN pip install numpy pandas matplotlib seaborn notebook scikit-learn
RUN pip install tensorflow[and-cuda]

# Set the working directory
WORKDIR /tf

# Expose the port
EXPOSE 8888

# Run the Jupyter notebook
CMD ["sh", "-c", "jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root && tail -f /dev/null"]
