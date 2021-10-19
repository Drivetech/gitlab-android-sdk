FROM openjdk:8-jdk@sha256:27dbfb1e7034b544e0928b5463c1f3ef3d7feb51a8d8d27317e55e418cee4a7b

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV ANDROID_TARGET_SDK=25 ANDROID_BUILD_TOOLS=25.0.2 ANDROID_SDK_TOOLS=25.2.3 ANDROID_HOME=/opt/android

WORKDIR /opt/android

RUN apt-get -q update -y && \
  apt-get -q install -y wget unzip lib32stdc++6 lib32z1 && \
  wget -q -O android-sdk.zip https://dl.google.com/android/repository/tools_r${ANDROID_SDK_TOOLS}-linux.zip && \
  unzip -qq android-sdk.zip && rm android-sdk.zip && \
  echo y | tools/android -s update sdk -u -a -t android-${ANDROID_TARGET_SDK},platform-tools,build-tools-${ANDROID_BUILD_TOOLS},extra-android-m2repository,extra-google-google_play_services,extra-google-m2repository
