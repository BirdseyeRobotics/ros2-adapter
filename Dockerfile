FROM arm64v8/ros:jazzy-ros-core

RUN apt-get update --fix-missing
RUN apt-get install -y apt-utils 
RUN apt-get install -y python3-dev python3-pip libffi-dev
RUN apt-get install -y ros-jazzy-rmw-cyclonedds-cpp
RUN apt-get install -y ros-jazzy-nav2-msgs

COPY ./requirements.txt .
RUN python3 -m pip config set global.break-system-packages true &&\
    pip3 install -r requirements.txt --ignore-installed

COPY . /app

ENTRYPOINT ["/app/start_docker.sh"]
CMD ["bash"]
