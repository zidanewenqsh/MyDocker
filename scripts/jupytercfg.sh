#!/bin/bash
python -m pip install jupyter
python -m pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
python -m pip install --user jupyter_nbextensions_configurator
jupyter nbextensions_configurator enable --user

jupyter notebook --generate-config
jupyter notebook password

sed -i '1ic.NotebookApp.ip="*"' $HOME/.jupyter/jupyter_notebook_config.py
sed -i "1ac.NotebookApp.password=\"$(perl -F\" -lane 'print "@F[3]" if /password/' $HOME/.jupyter/jupyter_notebook_config.json)\"" $HOME/.jupyter/jupyter_notebook_config.py
sed -i "2ac.NotebookApp.open_browser=False" $HOME/.jupyter/jupyter_notebook_config.py
sed -i "3ac.NotebookApp.port=8888" $HOME/.jupyter/jupyter_notebook_config.py