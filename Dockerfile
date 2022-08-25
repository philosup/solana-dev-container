FROM solanalabs/rust:latest


ENV SOLANA_CLI="v1.10.29"

RUN sh -c "$(curl -sSfL https://release.solana.com/${SOLANA_CLI}/install)"
# WORKDIR /root/.local/share/solana/install/active_release/bin/
# RUN ./solana-install --version
# RUN ./solana-install update
# RUN ./solana-install --version

ENV ANCHOR_CLI="v0.25.0"
RUN cargo install --git https://github.com/coral-xyz/anchor --tag ${ANCHOR_CLI} anchor-cli --locked
ENV HOME="/root"
# ENV PATH="${HOME}/.cargo/bin:${PATH}"
ENV PATH="${HOME}/.local/share/solana/install/active_release/bin:${PATH}"
WORKDIR ${HOME}

# RUN /usr/local/cargo/bin/avm install latest
# RUN avm use latest

# RUN corepack enable
# RUN yarn init -2

RUN npm install -g yarn

# Build a dummy program to bootstrap the BPF SDK (doing this speeds up builds).
# RUN mkdir -p /tmp && cd /tmp && anchor init dummy && cd dummy && anchor build