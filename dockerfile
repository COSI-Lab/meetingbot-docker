FROM ubuntu:22.04

COPY src/ src/
COPY config/ config/

RUN apt-get update && \
	apt-get install wget -y && \ 
	wget -O libdpp.deb https://dl.dpp.dev/latest && \
	apt-get install build-essential libopus0 libopus-dev libsodium-dev -y && \
	dpkg -i libdpp.deb && \
   	rm libdpp.deb

CMD g++ -std=c++17 src/meetingbot.cpp -o meetingbot -ldpp && \
	./meetingbot