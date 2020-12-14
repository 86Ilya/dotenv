FROM postgres:latest
ARG wakaapi

RUN apt-get update && apt-get install -y git vim pgformatter
RUN git clone https://github.com/86Ilya/dotenv.git /tmp/dotenv
RUN cp /tmp/dotenv/.vimrc /root/
RUN sed -i '/[aA]rpeggio/d' /root/.vimrc
RUN cp -r /tmp/dotenv/.vim /root/
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
RUN echo "[settings] \n\
debug = false \n\
hidefilenames = false \n\
ignore = \n\
    COMMIT_EDITMSG$ \n\
    PULLREQ_EDITMSG$ \n\
    MERGE_MSG$ \n\
    TAG_EDITMSG$ \n" > /root/.wakatime.cfg 
RUN echo api_key=$wakaapi >> /root/.wakatime.cfg 
RUN vim +BundleInstall +qall
RUN apt-get clean
