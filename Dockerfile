FROM circleci/android:api-29

ARG FLUTTER_VERSION

ENV LANG en_US.UTF-8
ENV FLUTTER_HOME ${HOME}/sdks/flutter
ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin


RUN sudo apt-get update \
    && sudo apt-get install -y --allow-unauthenticated --no-install-recommends lib32stdc++6 libstdc++6 libglu1-mesa locales \
    && sudo rm -rf /var/lib/apt/lists/*

RUN sudo locale-gen en_US "en_US.UTF-8" \
    && sudo dpkg-reconfigure locales


RUN git clone --branch ${FLUTTER_VERSION} https://github.com/flutter/flutter.git ${FLUTTER_HOME}


# doctor
RUN flutter doctor