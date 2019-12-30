#!/bin/bash
USER=$(whoami)

cp -R .config $HOME/
cp .tmux.conf $HOME/
chown $USER -R $HOME/.config
chown $USER -R $HOME/.tmux.conf

