FROM postgres:16.0

ENV LANG "C.UTF-8"
ENV LC_ALL "C.UTF-8"
ENV LC_CTYPE "C.UTF-8"
ENV DEBIAN_FRONTEND "noninteractive"

# ==================================================================================================

# Install the requirements.
RUN apt-get update && apt-get install -y build-essential git postgresql-server-dev-16

# Install the bktree extension.
RUN git clone https://github.com/fake-name/pg-spgist_hamming/
RUN cd pg-spgist_hamming/bktree && make && make install

# Copy the script to execute on initalizing the default user and database.
COPY ubuntu-2204.install-extensions.sh /docker-entrypoint-initdb.d/
