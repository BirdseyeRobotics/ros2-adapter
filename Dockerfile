FROM osrf/ros:humble-desktop

RUN apt-get update --fix-missing
RUN apt-get install -y apt-utils 
RUN apt-get install -y python3-dev python3-pip libffi-dev
RUN apt-get install -y ros-humble-rmw-cyclonedds-cpp
RUN apt-get install -y ros-humble-nav2-msgs

COPY ./requirements.txt .
RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT ["/app/start_docker.sh"]
CMD ["bash"]
