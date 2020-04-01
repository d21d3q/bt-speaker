FROM python

RUN apt-get update
RUN apt-get --yes install \
	git bluez python python-gobject \
	python-cffi python-dbus python-alsaaudio \
	python-configparser sound-theme-freedesktop vorbis-tools \
	pulseaudio libasound2 alsa-utils alsa-oss

COPY . /opt/bt-speaker
WORKDIR /opt/bt-speaker

COPY config.ini.default /etc/bt_speaker/config.ini
COPY hooks.default/connect /etc/bt_speaker/hooks/connect
COPY hooks.default/disconnect /etc/bt_speaker/hooks/disconnect
COPY hooks.default/startup /etc/bt_speaker/hooks/startup
COPY hooks.default/track /etc/bt_speaker/hooks/track

CMD /opt/bt-speaker/bt_speaker.py
